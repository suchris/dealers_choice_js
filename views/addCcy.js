const html = require("html-template-tag");

module.exports = () => html`<!DOCTYPE html>
  <html>
    <head>
      <title>Crypto Currency Top List</title>
      <link rel="stylesheet" href="/style.css" />
    </head>
    <body>
      <div class="ccys-list">
        <header><img src="/logo.png" />Add New Crypto Currency</header>
        <form method="post" action="/ccys">
          <label for="symbol">Symbol</label>
          <input type="text" name="symbol" />
          <label for="name">Name</label>
          <input type="text" name="name" />
          <textarea name="decription">Brief Description</textarea>
          <button type="submit">Submit</button>
        </form>
      </div>
    </body>
  </html>`;
