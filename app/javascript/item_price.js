window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = inputValue * 0.1
  const profitNumber = document.getElementById("profit")
  const value_result = inputValue * 0.1
  profitNumber.innerHTML = (Math.floor(inputValue - value_result));
})
});