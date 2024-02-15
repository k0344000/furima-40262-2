function calculateTaxAndProfit() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1); // 販売手数料は価格の10%
    const profit = inputValue - tax; // 利益は価格から販売手数料を差し引いた金額

    addTaxDom.innerHTML = tax.toLocaleString(); // 販売手数料を表示
    profitDom.innerHTML = profit.toLocaleString(); // 利益を表示
  });
}
window.addEventListener('turbo:load', calculateTaxAndProfit);
window.addEventListener('turbo:render', calculateTaxAndProfit);