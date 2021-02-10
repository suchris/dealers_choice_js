const express = require("express");
const morgan = require("morgan");
const client = require("./db");

const app = express();

app.use(morgan("dev"));
app.use(express.static(__dirname + "/public"));

app.use("/", require("./routes/ccys"));

app.use("/ccys", require("./routes/ccys"));

const PORT = 1337;

app.listen(PORT, () => {
  console.log(`App listening in port ${PORT}`);
});
