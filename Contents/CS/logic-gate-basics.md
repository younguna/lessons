# 논리게이트

## 스스로 확인할 사항
- 4비트나 16비트도 같은 함수로 한꺼번에 처리 가능한가?
	- 큰 비트가 우측으로 배치되어 있고 좌측부터 하나하나 루프를 돌아 비트를 처리하여 접근하기 때문에 두 배열이 같은 비트를 가지고 있다면 처리하는것에 문제가 없다.

- byteA와 byteB 배열의 크기가 다르면 어떻게 처리 가능할까?
```js
// 길이가 다른 비트 덧셈기
function byteadderForDiffLen(byteA, byteB){
    let _sum = false;
    let carry = false;
    const resultArr = [];
    const iteratingByte = (byteA.length >= byteB.length) ? byteA : byteB;

    for (let i in iteratingByte) {
        let a = (byteA[i] === undefined ) ? false : Boolean(byteA[i]);
        let b = (byteB[i] === undefined ) ? false : Boolean(byteB[i]);
        [_sum, carry] = fulladder(a, b, carry);
        resultArr.push(+_sum);
    }
    resultArr.push(+carry);
    return resultArr;
}
```
- 위를 구현하여 소스에 첨부하였다.
- 위의 소스는 더 길이가 큰 배열의 비트배열을 선택하여 루프를 돌며 길이가 짧은 배열의 끝에서 부터 undefined를 꺼낼 때마다 그것을 잡아서 false로 바꾸어 처리하면 기존의 로직으로도 문제 없이 작동한다.

## 다같이 확인할 사항
- 바이트 순서를 큰 비트(Most Significant Bit)를 좌측으로 배치하는 것과 우측으로 배치하는 방식이 구현할 때 어떤 장점이 있나?
	- 우선적으로 carry 비트를 추가해야 할 때 배열의 첫번째로 넣지 않아도 되고 push를 통해 마지막으로 넣을 수 있다.
	- n진수를 처리할 때 각각의 자리의 수를 Math.pow(n, index)를 통하여 처리할 수 있어 편리하다.

- 같은 방식으로 2진수를 16진법으로 변환하는 함수를 만든다면 어떤 구조가 될까
	- 2진수 배열을 4개씩 쪼갤 수 있도록 부족한 개수를 0으로 채운다.
	- 배열을 4개씩 쪼갠다
	- 4개의 원소로 이루어진 배열을 기존의 bin2dec() 함수를 사용하여 각각 10진수로 변환한다.
	- 변환된 각각의 십진수를 10 미만의 것들은 그대로 표기해주고 그 이상의 것들은 숫자와 알파벳을 키와 값으로 유지하는 객체를 통해 변환한다.
	- 십진수처럼 왼쪽이 큰값이 오도록 배열을 역행하여 join한다.
- 같은 방식으로 16진수를 2진법으로 변환하는 함수를 만든다면 어떤 구조가 될까
	- 16진수가 큰값이 좌측에 있다는 가정하에 스트링을 잘라 배열로 만든다.
	- 각각의 digit을 십진수화 한다.
	- 각각의 십지수를 dec2bin을 통해 이진수화 한다.
	- 좌측이 작은 값이 오도록하기 위해 이진수 배열들을 포함하는 배열을 역행한 후 reduce를 통해 배열안의 배열을 1차원 배열로 만든다.
	
```js
// 2진수 에서 16진수로 변환하는 함수
function bin2hex(bin) {
    const zerosToConcat = Array(bin.length % 4).fill(0);
    bin = bin.concat(zerosToConcat);
    let sizeFourChunks = [];
    let hexadecimal = [];

    while (bin.length > 0) {
        sizeFourChunks.push(bin.splice(0, 4));
    }

    sizeFourChunks.forEach((el) => {
        const decFromBin = bin2dec(el);
        const hexaDigit = (decFromBin < 10) ? decFromBin : hexAlphabet[decFromBin];
        hexadecimal.push(hexaDigit);
    });
    
    return hexadecimal.reverse().join("");
}


// 16진수에서 2진수로 변환하는 함수. 요구사항처럼 큰 값이 오른쪽으로 정렬된다.
function hex2bin(hex) {
    let hexArr = hex.split("");
    let decArr = hexArr.map((el)=>{
        const decDigit = (!isNaN(el)) ? el : getKeyByValue(hexAlphabet, el);
        return parseInt(decDigit);
    });
    let binArr = decArr.map((el)=>dec2bin(el));
    let revsersedBinArr =  binArr.reverse();
    return revsersedBinArr.reduce((acc, val) => acc.concat(val), []);
}
```


