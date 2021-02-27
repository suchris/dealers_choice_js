// LOVE THIS!!!!! 
const formatter = function (money) {
  return new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
  }).format(money);
};

module.exports = { formatter };
