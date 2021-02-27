const client = require("../db");
const ccyList = require("../views/ccyList");
const ccyDetails = require("../views/ccyDetails");

const router = require("express").Router();

//love your use of a base query!
const baseQuery =
  "SELECT cryptos.*, marketcap, price, mktprices.date as date FROM cryptos INNER JOIN mktprices ON mktprices.cryptoId = cryptos.id JOIN (SELECT cryptoId, max(date) AS date FROM mktprices GROUP BY cryptoId) AS latest_px ON mktprices.cryptoId = latest_px.cryptoId AND mktprices.date = latest_px.date\n";

router.get("/", async (req, res, next) => {
  try {
    const data = await client.query(baseQuery + "ORDER BY marketcap DESC");
    res.send(ccyList(data.rows));
  } catch (error) {
    next(error);
  }
});

router.get("/:id", async (req, res, next) => {
  try {
    const data = await client.query(baseQuery + "WHERE cryptos.id = $1", [
      req.params.id,
    ]);
    const ccy = data.rows[0];
    res.send(ccyDetails(ccy));
  } catch (error) {
    next(error);
  }
});

module.exports = router;
