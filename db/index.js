const pg = require("pg");
const client = new pg.Client("postgres://localhost/crypto");

client.connect();

module.exports = client;
