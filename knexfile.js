const mysql = require('mysql');
const pg = require('pg');

module.exports = {
  production: {
    client: 'pg',
    connection: {
      host: process.env.DATABASE_URL_PRODUCTION,
      user: process.env.DATABASE_USER_PRODUCTION,
      password: process.env.DATABASE_PASSWORD_PRODUCTION,
      database: process.env.DATABASE_NAME_PRODUCTION
    },
    pool: { min: 0, max: 10 }
  },
  dev: {
    client: 'pg',
    connection: {
      host: process.env.DATABASE_URL_DEV,
      user: process.env.DATABASE_USER_DEV,
      password: process.env.DATABASE_PASSWORD_DEV,
      database: process.env.DATABASE_NAME_DEV
    },
    pool: { min: 0, max: 10 }
  }
};
