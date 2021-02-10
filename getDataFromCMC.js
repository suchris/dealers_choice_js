const rp = require("request-promise");
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
  try {
    const [meta, price] = await Promise.all([
      rp(requestMetaData),
      rp(requestPriceData),
    ]);

    console.log(createMetaDataSQL(meta.data));
    console.log(createPriceDataSQL(price.data));
  } catch (error) {
    console.log("API call error:", error.message);
  }
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
      `INSERT INTO mktprices (date, cryptoId, price) VALUES ('${data[key].quote.USD.last_updated}',(SELECT id from cryptos where symbol='${data[key].symbol}'), ${data[key].quote.USD.price});\n`
    );
  }
  return str;
}

makeAPIRequests().then(() => console.log("done!"));
