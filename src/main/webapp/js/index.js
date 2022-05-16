let sum = 0;
function getVAT(s) {
	if (s > 200) {
		return s * 0.1;
	} else if (s > 150) {
		return s * 0.08;
	}
	else if (s > 100) {
		return s * 0.05;
	}
	else if (s > 50) {
		return s * 0.03;
	} else {
		return s * 0;
	}
}
function printBill(s) {
	document.getElementById('vat').innerHTML = Math.round(getVAT(s) * 100) / 100;
	document.getElementById('tien').innerHTML = s;
	document.getElementById('tongcong').innerHTML = s + getVAT(s);
}

function updateStatusSame(stt, id) {
	document.getElementById('plus' + id).disabled = stt;
	document.getElementById('sub' + id).disabled = stt;
}

function updateStatusDif(amount, max, id) {
	if (amount == 1) {
		document.getElementById('sub' + id).disabled = true;
	} else {
		document.getElementById('sub' + id).disabled = false;
	}
	if (amount == max) {
		document.getElementById('plus' + id).disabled = true;
	} else {
		document.getElementById('plus' + id).disabled = false;
	}
}
function cartChange(id, e, max) {
	let price = document.getElementById('price' + id).textContent * 1;
	let amount = document.getElementById('amount' + id).value;

	if (e == "plus") {
		sum = sum + price * 1;
		printBill(sum);
		amount++;
		document.getElementById('amount' + id).value++;
		document.getElementById('sumPrice' + id).innerHTML = price * amount;
		updateStatusDif(amount, max, id);
	} else {
		sum = sum - price * 1;
		printBill(sum);
		amount--;
		document.getElementById('amount' + id).value--;
		document.getElementById('sumPrice' + id).innerHTML = price * amount;
		updateStatusDif(amount, max, id);
	}

}

function enableTr(id, max) {
	let price = document.getElementById('price' + id).textContent * 1;
	let amount = document.getElementById('amount' + id).value;
		console.log(amount)
	if (document.getElementById('check' + id).checked) {
		updateStatusSame(false, id);
		updateStatusDif(amount, max, id);
		sum = sum + (price * 1) * (amount * 1);
		printBill(sum);
	} else {
		updateStatusSame(true, id);
		sum = sum - price * amount;
		printBill(sum);
	}
}


