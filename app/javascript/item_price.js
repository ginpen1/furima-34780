function item_price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", (e) => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit");
    const fee = 0.1;
    const salesCommission = Math.floor(inputValue * fee);
    const salesProfit = inputValue - salesCommission
    addTaxDom.innerHTML = salesCommission
    addProfitDom.innerHTML = salesProfit
    e.preventDefault();
  });
}

window.addEventListener('load', item_price);