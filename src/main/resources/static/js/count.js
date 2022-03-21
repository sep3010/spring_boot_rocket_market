function count(type) {

  // 결과를 표시할 element
  const resultElement = document.getElementById("amount_result");
  const totalPriceElement = document.getElementById("result_sum");
  const discountPriceElement = document.getElementById("discount");

  let discount = discountPriceElement.innerText.replace(",", "");


  // 현재 화면에 표시된 값
  let number = resultElement.innerText;


  // 더하기/빼기
  if (type === "plus") {
    number = parseInt(number) + 1;
  } else if (type === "minus") {
    number = parseInt(number) - 1;

    if (number < 1) {
      number++;
    }
  }
  // 결과 출력
  resultElement.innerText = number;
  // totalPriceElement.innerText = Number(number) * Number(discount);
  let price = Number(number) * Number(discount);
  totalPriceElement.innerText = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}




