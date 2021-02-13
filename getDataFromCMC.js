const rp = require("request-promise");
const fs = require("fs");

const symbols = "BTC,ETH,USDT,ADA,XRP,DOT,BNB,LTC,LINK,DOGE";
const APIKey = process.env.CMCKEY;

const requestMetaData = {
  method: "GET",
  uri: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/info",
  qs: {
    symbol: symbols,
  },
  headers: {
    "X-CMC_PRO_API_KEY": APIKey,
  },
  json: true,
  gzip: true,
};

const requestPriceData = {
  method: "GET",
  uri: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest",
  qs: {
    symbol: symbols,
  },
  headers: {
    "X-CMC_PRO_API_KEY": APIKey,
  },
  json: true,
  gzip: true,
};

async function makeAPIRequests() {
  let sqlText = "";
  try {
    const [meta, price] = await Promise.all([
      rp(requestMetaData),
      rp(requestPriceData),
    ]);

    sqlText = sqlText.concat(createMetaDataSQL(meta.data));
    sqlText = sqlText.concat(createPriceDataSQL(price.data));
  } catch (error) {
    console.log("API call error:", error.message);
  }

  return sqlText;
}

function createMetaDataSQL(data) {
  let str = "";

  for (const key in data) {
    str = str.concat(
      `INSERT INTO cryptos (symbol, name, description) VALUES ('${key}', '${data[key].name}', '${data[key].description}');\n`
    );
  }
  return str;
}

function createPriceDataSQL(data) {
  let str = "";

  for (const key in data) {
    str = str.concat(
      `INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('${data[key].quote.USD.last_updated}',(SELECT id from cryptos where symbol='${data[key].symbol}'), ${data[key].quote.USD.market_cap}, ${data[key].quote.USD.price});\n`
    );
  }
  return str;
}

const sqlTableSchema = `DROP TABLE IF EXISTS mktprices;
DROP TABLE IF EXISTS cryptos;

CREATE TABLE cryptos (
  id SERIAL PRIMARY KEY,
  symbol VARCHAR(8) UNIQUE NOT NULL,
  name VARCHAR(20) NOT NULL,
  description TEXT DEFAULT NULL
);

CREATE TABLE mktprices (
  date timestamp DEFAULT now(),
  cryptoId INTEGER REFERENCES cryptos(id) NOT NULL,
  marketcap DECIMAL(20,8) NOT NULL,
  price DECIMAL(20,8) NOT NULL
);\n`;

// write data to seed.sql
makeAPIRequests().then((sqlText) => {
  fs.writeFile("seed.sql", sqlTableSchema.concat(sqlText), (err) => {
    if (err) return console.log(err);
    console.log("Wrote data from CoinMarketCap to seed.sql!");
  });
});
