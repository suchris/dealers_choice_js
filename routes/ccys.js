const client = require("../db");
const ccyList = require("../views/ccyList");
const ccyDetails = require("../views/ccyDetails");
const addCcy = require("../views/addCcy");
const router = require("express").Router();

const baseQuery =
  "SELECT cryptos.*, price, mktprices.date as date FROM cryptos INNER JOIN mktprices ON mktprices.cryptoId = cryptos.id JOIN (SELECT cryptoId, max(date) AS date FROM mktprices GROUP BY cryptoId) AS latest_px ON mktprices.cryptoId = latest_px.cryptoId AND mktprices.date = latest_px.date\n";

router.get("/", async (req, res, next) => {
  try {
    const data = await client.query(baseQuery);
    res.send(ccyList(data.rows));
  } catch (error) {
    next(error);
  }
});

router.get("/add", (req, res) => {
  res.send(addCcy());
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
