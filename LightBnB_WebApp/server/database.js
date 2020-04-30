const { Pool } = require('pg');
const properties = require('./json/properties.json');
const users = require('./json/users.json');

// Get Environmental Variables
require('dotenv').config();

const pool = new Pool({
  "user": process.env.DB_USER,
  "password": process.env.DB_PASS,
  "host": process.env.DB_HOST,
  "database": process.env.DB_NAME
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  const queryString = `
    SELECT id, name, email, password
    FROM users
    WHERE email = $1
  `;
  return pool
    .query(queryString, [email])
    .then(res => res.rows.length ? res.rows[0] : null);
};
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  const queryString = `
    SELECT id, name, email, password
    FROM users
    WHERE id = $1
  `;
  return pool
    .query(queryString, [id])
    .then(res => res.rows.length ? res.rows[0] : null);
};
exports.getUserWithId = getUserWithId;

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  const queryString = `
    INSERT INTO users (name, email, password)
    VALUES ($1, $2, $3)
    RETURNING *;
  `;
  const values = [ user.name, user.email, user.password ];
  return pool
    .query(queryString, values)
    .then(res => res.rows.length ? res.rows[0] : null);
};
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  const queryString = `
    SELECT properties.*, reservations.*, AVG(rating) as average_rating
    FROM reservations
    JOIN properties ON reservations.property_id = properties.id
    JOIN property_reviews ON properties.id = property_reviews.property_id
    WHERE reservations.guest_id = $1 AND reservations.end_date < now()::date
    GROUP BY properties.id, reservations.id
    ORDER BY reservations.start_date
    LIMIT $2;
  `;
  const values = [ guest_id, limit ];
  return pool
    .query(queryString, values)
    .then(res => res.rows);
};
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) {
  const queryParams = [];
  let queryString = `
    SELECT properties.*, AVG(property_reviews.rating) as average_rating
    FROM properties
    JOIN property_reviews ON properties.id = property_id 
  `;

  if (Object.keys(options).length > 0) {
    queryString += `WHERE `;
  }

  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `city LIKE $${queryParams.length} `;
  }

  if (options.owner_id) {
    if (queryParams.length > 1) {
      queryString += 'AND ';
    }
    queryParams.push(options.owner_id);
    queryString += `owner_id = $${queryParams.length} `;
  }

  if (options.minimum_price_per_night) {
    if (queryParams.length > 1) {
      queryString += 'AND ';
    }
    queryParams.push(options.minimum_price_per_night);
    queryString += `cost_per_night > $${queryParams.length} `;
  }

  if (options.minimum_price_per_night) {
    if (queryParams.length > 1) {
      queryString += 'AND ';
    }
    queryParams.push(options.minimum_price_per_night);
    queryString += `cost_per_night > $${queryParams.length} `;
  }

  if (options.maximum_price_per_night) {
    if (queryParams.length > 1) {
      queryString += 'AND ';
    }
    queryParams.push(options.maximum_price_per_night);
    queryString += `cost_per_night < $${queryParams.length} `;
  }

  queryString += `GROUP BY properties.id `;
  if (options.minimum_rating) {
    queryParams.push(options.minimum_rating);
    queryString += `HAVING AVG(property_reviews.rating) >= $${queryParams.length} `;
  }

  queryParams.push(limit);
  queryString += `
    ORDER BY cost_per_night
    LIMIT $${queryParams.length};
  `;
  
  return pool
    .query(queryString, [limit])
    .then(res => res.rows);
};
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
};
exports.addProperty = addProperty;
