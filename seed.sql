DROP TABLE IF EXISTS mktprices;
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
  price DECIMAL(20,8) NOT NULL
);

INSERT INTO cryptos (symbol, name, description) VALUES ('ADA', 'Cardano', 'Cardano (ADA) is a cryptocurrency . Users are able to generate ADA through the process of mining. Cardano has a current supply of 45,000,000,000 with 31,112,484,646 in circulation. The last known price of Cardano is 0.90449667 USD and is up 29.20 over the last 24 hours. It is currently trading on 229 active market(s) with $11,494,766,177.33 traded over the last 24 hours. More information can be found at https://www.cardano.org.');
INSERT INTO cryptos (symbol, name, description) VALUES ('BNB', 'Binance Coin', 'Binance Coin (BNB) is a cryptocurrency . Binance Coin has a current supply of 170,532,785 with 154,532,785 in circulation. The last known price of Binance Coin is 126.20361124 USD and is up 19.09 over the last 24 hours. It is currently trading on 468 active market(s) with $6,892,288,844.20 traded over the last 24 hours. More information can be found at https://www.binance.com/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('BTC', 'Bitcoin', 'Bitcoin (BTC) is a cryptocurrency . Users are able to generate BTC through the process of mining. Bitcoin has a current supply of 18,625,287. The last known price of Bitcoin is 44,915.27136442 USD and is down -4.69 over the last 24 hours. It is currently trading on 9652 active market(s) with $86,214,573,288.61 traded over the last 24 hours. More information can be found at https://bitcoin.org/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('DOGE', 'Dogecoin', 'Dogecoin (DOGE) is a cryptocurrency . Users are able to generate DOGE through the process of mining. Dogecoin has a current supply of 128,317,826,804.23405. The last known price of Dogecoin is 0.07296722 USD and is up 2.05 over the last 24 hours. It is currently trading on 295 active market(s) with $6,777,474,241.99 traded over the last 24 hours. More information can be found at http://dogecoin.com/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('DOT', 'Polkadot', 'Polkadot (DOT) is a cryptocurrency . Polkadot has a current supply of 1,042,589,053.9708368 with 908,691,845.8967876 in circulation. The last known price of Polkadot is 23.17228077 USD and is up 0.94 over the last 24 hours. It is currently trading on 138 active market(s) with $3,667,249,679.08 traded over the last 24 hours. More information can be found at https://polkadot.network/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('ETH', 'Ethereum', 'Ethereum (ETH) is a cryptocurrency . Users are able to generate ETH through the process of mining. Ethereum has a current supply of 114,617,529.8115. The last known price of Ethereum is 1,724.89912808 USD and is down -2.34 over the last 24 hours. It is currently trading on 5868 active market(s) with $41,473,618,891.29 traded over the last 24 hours. More information can be found at https://www.ethereum.org/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('LINK', 'Chainlink', 'Chainlink (LINK) is a cryptocurrency and operates on the Ethereum platform. Chainlink has a current supply of 1,000,000,000 with 405,509,556.4344445 in circulation. The last known price of Chainlink is 26.28403896 USD and is up 0.42 over the last 24 hours. It is currently trading on 471 active market(s) with $4,367,803,298.51 traded over the last 24 hours. More information can be found at https://chain.link/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('LTC', 'Litecoin', 'Litecoin (LTC) is a cryptocurrency . Users are able to generate LTC through the process of mining. Litecoin has a current supply of 66,457,916.89559093. The last known price of Litecoin is 179.669152 USD and is up 2.53 over the last 24 hours. It is currently trading on 752 active market(s) with $12,922,808,775.26 traded over the last 24 hours. More information can be found at https://litecoin.org/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('USDT', 'Tether', 'Tether (USDT) is a cryptocurrency launched in 2015and operates on the Ethereum platform. Tether has a current supply of 31,008,167,440.845192 with 30,300,564,922.05555 in circulation. The last known price of Tether is 1.0006037 USD and is down -0.09 over the last 24 hours. It is currently trading on 10588 active market(s) with $166,548,311,569.86 traded over the last 24 hours. More information can be found at https://tether.to.');
INSERT INTO cryptos (symbol, name, description) VALUES ('XRP', 'XRP', 'XRP (XRP) is a cryptocurrency . XRP has a current supply of 99,990,831,162 with 45,404,028,640 in circulation. The last known price of XRP is 0.49663603 USD and is up 5.92 over the last 24 hours. It is currently trading on 676 active market(s) with $13,388,328,944.09 traded over the last 24 hours. More information can be found at https://ripple.com/xrp/.');

INSERT INTO mktprices (date, cryptoId, price) VALUES ('2021-02-10T22:02:10.000Z',(SELECT id from cryptos where symbol='ADA'), 0.89865691219263);
INSERT INTO mktprices (date, cryptoId, price) VALUES ('2021-02-10T22:02:08.000Z',(SELECT id from cryptos where symbol='BNB'), 126.00020417940233);
INSERT INTO mktprices (date, cryptoId, price) VALUES ('2021-02-10T22:02:02.000Z',(SELECT id from cryptos where symbol='BTC'), 44972.14322779421);
INSERT INTO mktprices (date, cryptoId, price) VALUES ('2021-02-10T22:03:03.000Z',(SELECT id from cryptos where symbol='DOGE'), 0.07288365186925);
INSERT INTO mktprices (date, cryptoId, price) VALUES ('2021-02-10T22:03:05.000Z',(SELECT id from cryptos where symbol='DOT'), 23.21836878717585);
INSERT INTO mktprices (date, cryptoId, price) VALUES ('2021-02-10T22:02:02.000Z',(SELECT id from cryptos where symbol='ETH'), 1726.505482374791);
INSERT INTO mktprices (date, cryptoId, price) VALUES ('2021-02-10T22:02:08.000Z',(SELECT id from cryptos where symbol='LINK'), 26.31551236454368);
INSERT INTO mktprices (date, cryptoId, price) VALUES ('2021-02-10T22:03:02.000Z',(SELECT id from cryptos where symbol='LTC'), 179.85567885191924);
INSERT INTO mktprices (date, cryptoId, price) VALUES ('2021-02-10T22:02:08.000Z',(SELECT id from cryptos where symbol='USDT'), 1.00052799577622);
INSERT INTO mktprices (date, cryptoId, price) VALUES ('2021-02-10T22:03:03.000Z',(SELECT id from cryptos where symbol='XRP'), 0.49681866945462);
