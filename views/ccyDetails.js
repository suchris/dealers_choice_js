const html = require("html-template-tag");
const { formatter } = require("./utils");

module.exports = (ccy) => html`<!DOCTYPE html>
  <html>
    <head>
      <title>Crypto Currency Top List</title>
      <link rel="stylesheet" href="/style.css" />
    </head>
    <body>
      <div class="ccys-list">
        <header><img src="/${ccy.symbol}-logo.png" />${ccy.name}</header>
        <div class="ccys-item">
          <p>${formatter(ccy.price)} <small>(${ccy.symbol})</small></p>
          <p>${ccy.description}</p>
        </div>
      </div>
    </body>
  </html>`;
