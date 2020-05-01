$(() => {
  const $reservationForm = $(`
  <form id="reservation-form" class="reservation-form">
        <p>Make Reservation</p>
        
        <input type="hidden" id="propertyId" name="propertyId">

        <div class="reservation-form__field-wrapper">
          <label for="startDate">Start Date: </label>
          <input type="date" id="startDate" name="startDate">
        </div>

        <div class="reservation-form__field-wrapper">
          <label for="endDate">End Date: </label>
          <input type="date" id="endDate" name="endDate">
        </div>
  
        <div class="reservation-form__field-wrapper">
          <button>Submit</button>
          <a id="reservation-form__cancel" href="#">Cancel</a>
        </div>
      </form>
  `);
  window.$reservationForm = $reservationForm;

  $reservationForm.on('submit', function(event) {
    event.preventDefault();

    const data = $(this).serialize();
    postReservation(data)
      .then((reservation) => {
        views_manager.show('listings');
      });
  });

  $('body').on('click', '#reservation-form__cancel', function() {
    views_manager.show('listings');
    return false;
  });
      
});