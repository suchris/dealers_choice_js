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
  marketcap DECIMAL(20,8) NOT NULL,
  price DECIMAL(20,8) NOT NULL
);
INSERT INTO cryptos (symbol, name, description) VALUES ('ADA', 'Cardano', 'Cardano (ADA) is a cryptocurrency . Users are able to generate ADA through the process of mining. Cardano has a current supply of 45,000,000,000 with 31,112,484,646 in circulation. The last known price of Cardano is 0.94147808 USD and is up 2.57 over the last 24 hours. It is currently trading on 230 active market(s) with $7,368,155,205.73 traded over the last 24 hours. More information can be found at https://www.cardano.org.');
INSERT INTO cryptos (symbol, name, description) VALUES ('BNB', 'Binance Coin', 'Binance Coin (BNB) is a cryptocurrency . Binance Coin has a current supply of 170,532,785 with 154,532,785 in circulation. The last known price of Binance Coin is 135.30034418 USD and is up 9.65 over the last 24 hours. It is currently trading on 471 active market(s) with $2,923,618,475.45 traded over the last 24 hours. More information can be found at https://www.binance.com/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('BTC', 'Bitcoin', 'Bitcoin (BTC) is a cryptocurrency . Users are able to generate BTC through the process of mining. Bitcoin has a current supply of 18,627,162. The last known price of Bitcoin is 47,769.85011664 USD and is down -1.03 over the last 24 hours. It is currently trading on 9677 active market(s) with $74,589,343,952.19 traded over the last 24 hours. More information can be found at https://bitcoin.org/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('DOGE', 'Dogecoin', 'Dogecoin (DOGE) is a cryptocurrency . Users are able to generate DOGE through the process of mining. Dogecoin has a current supply of 128,345,470,276.08191. The last known price of Dogecoin is 0.0708521 USD and is up 3.62 over the last 24 hours. It is currently trading on 297 active market(s) with $3,963,668,080.10 traded over the last 24 hours. More information can be found at http://dogecoin.com/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('DOT', 'Polkadot', 'Polkadot (DOT) is a cryptocurrency . Polkadot has a current supply of 1,043,286,169.3788884 with 907,678,640.0705268 in circulation. The last known price of Polkadot is 29.89524265 USD and is up 19.54 over the last 24 hours. It is currently trading on 139 active market(s) with $4,724,292,519.54 traded over the last 24 hours. More information can be found at https://polkadot.network/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('ETH', 'Ethereum', 'Ethereum (ETH) is a cryptocurrency . Users are able to generate ETH through the process of mining. Ethereum has a current supply of 114,648,057.0615. The last known price of Ethereum is 1,860.18654685 USD and is up 3.96 over the last 24 hours. It is currently trading on 5881 active market(s) with $38,134,650,219.72 traded over the last 24 hours. More information can be found at https://www.ethereum.org/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('LINK', 'Chainlink', 'Chainlink (LINK) is a cryptocurrency and operates on the Ethereum platform. Chainlink has a current supply of 1,000,000,000 with 407,009,556.4344444 in circulation. The last known price of Chainlink is 31.68325689 USD and is up 15.09 over the last 24 hours. It is currently trading on 473 active market(s) with $4,482,340,934.73 traded over the last 24 hours. More information can be found at https://chain.link/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('LTC', 'Litecoin', 'Litecoin (LTC) is a cryptocurrency . Users are able to generate LTC through the process of mining. Litecoin has a current supply of 66,473,904.39559093. The last known price of Litecoin is 202.89310396 USD and is up 8.81 over the last 24 hours. It is currently trading on 752 active market(s) with $11,659,342,606.64 traded over the last 24 hours. More information can be found at https://litecoin.org/.');
INSERT INTO cryptos (symbol, name, description) VALUES ('USDT', 'Tether', 'Tether (USDT) is a cryptocurrency launched in 2015and operates on the Ethereum platform. Tether has a current supply of 32,108,167,440.845192 with 31,588,698,001.96555 in circulation. The last known price of Tether is 1.00165595 USD and is up 0.12 over the last 24 hours. It is currently trading on 10634 active market(s) with $146,286,513,268.93 traded over the last 24 hours. More information can be found at https://tether.to.');
INSERT INTO cryptos (symbol, name, description) VALUES ('XRP', 'XRP', 'XRP (XRP) is a cryptocurrency . XRP has a current supply of 99,990,831,162 with 45,404,028,640 in circulation. The last known price of XRP is 0.63138711 USD and is up 20.14 over the last 24 hours. It is currently trading on 676 active market(s) with $14,685,434,666.29 traded over the last 24 hours. More information can be found at https://ripple.com/xrp/.');
INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('2021-02-13T02:44:10.000Z',(SELECT id from cryptos where symbol='ADA'), 29288855739.809063, 0.94138594435834);
INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('2021-02-13T02:44:08.000Z',(SELECT id from cryptos where symbol='BNB'), 20881067474.865448, 135.12386691837236);
INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('2021-02-13T02:44:02.000Z',(SELECT id from cryptos where symbol='BTC'), 890464136132.8687, 47804.60577584866);
INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('2021-02-13T02:45:03.000Z',(SELECT id from cryptos where symbol='DOGE'), 9096620830.800081, 0.07087605671811);
INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('2021-02-13T02:45:05.000Z',(SELECT id from cryptos where symbol='DOT'), 27120003760.345116, 29.87842014023585);
INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('2021-02-13T02:44:02.000Z',(SELECT id from cryptos where symbol='ETH'), 212862230818.72302, 1856.6579868382642);
INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('2021-02-13T02:44:08.000Z',(SELECT id from cryptos where symbol='LINK'), 12879110825.872202, 31.64326395354944);
INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('2021-02-13T02:45:02.000Z',(SELECT id from cryptos where symbol='LTC'), 13476057493.820992, 202.72703426030185);
INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('2021-02-13T02:44:08.000Z',(SELECT id from cryptos where symbol='USDT'), 31641430633.105217, 1.00166935120708);
INSERT INTO mktprices (date, cryptoId, marketcap, price) VALUES ('2021-02-13T02:45:03.000Z',(SELECT id from cryptos where symbol='XRP'), 28713582445.91831, 0.6324016459769);
