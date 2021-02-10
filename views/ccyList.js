const timeAgo = require("node-time-ago");
const html = require("html-template-tag");
const { formatter } = require("./utils");

module.exports = (ccys) => html`<!DOCTYPE html>
  <html>
    <head>
      <title>Crypto Currency Top List</title>
      <link rel="stylesheet" href="/style.css" />
    </head>
    <body>
      <div class="ccys-list">
        <header><img src="/logo.png" />Crypto Currency Top List</header>
        ${ccys.map(
          (ccy) => html` <div class="ccys-item">
            <p>
              <span class="ccys-position"
                ><img src="/${ccy.symbol}-logo.png" />
              </span>
              <a href="/ccys/${ccy.id}">${ccy.name}</a>
              <small>(${ccy.symbol})</small>
            </p>
            <small class="ccys-info">
              market price: ${ccy.price ? formatter(ccy.price) : 0} |
              ${timeAgo(ccy.date)}
            </small>
          </div>`
        )}
      </div>
    </body>
  </html>`;
