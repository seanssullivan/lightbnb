module.exports = function(router, database) {

  router.get('/properties', (req, res) => {
    database.getAllProperties(req.query, 20)
    .then(properties => res.send({properties}))
    .catch(e => {
      console.error(e);
      res.send(e)
    }); 
  });

  router.get('/reservations', (req, res) => {
    const userId = req.session.userId;
    if (!userId) {
      res.error("💩");
      return;
    }
    database.getAllReservations(userId)
    .then(reservations => res.send({reservations}))
    .catch(e => {
      console.error(e);
      res.send(e)
    });
  });

  router.post('/reservations', (req, res) => {
    const userId = req.session.userId;
    const propertyId = req.body.propertyId;
    const startDate = req.body.startDate;
    const endDate = req.body.endDate;

    database.addReservation({
      guest_id: userId,
      property_id: propertyId,
      start_date: startDate,
      end_date: endDate
    })
      .then(reservation => {
        res.send(reservation);
      })
      .catch(e => {
        console.error(e);
        res.send(e)
      });
  });

  router.post('/properties', (req, res) => {
    const userId = req.session.userId;
    database.addProperty({...req.body, owner_id: userId})
      .then(property => {
        res.send(property);
      })
      .catch(e => {
        console.error(e);
        res.send(e)
      });
  });

  return router;
}