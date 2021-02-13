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
        <header><img src="/logo.png" /><a href="/">Back to Top List</a></header>
        <div class="ccys-item">
          <p>
            <img src="/${ccy.symbol}-logo.png" />${ccy.name}
            <small>(${ccy.symbol})</small> ${formatter(ccy.price)}
          </p>
          <p>${ccy.description}</p>
        </div>
      </div>
    </body>
  </html>`;
