# JavaScript Array Methods

## forEach
- 이 메소드는 단순히 배열의 모든 원소에 대해 콜백함수를 실행합니다.
- forEach의 콜백함수는 다음의 파라미터를 다룬다.
	- currentValue 현재 원소
	- index 현재 원소의 인덱스
	- array 원 배열
	- thisArg 콜백을 실행할 때 this로 사용됨
#### 코드예제
```javascript
const items = ['item1', 'item2', 'item3'];
const copy = [];
// for iteration
for (let i=0; i<items.length; i++) {
  copy.push(items[i]);
}
// same operation with forEach
items.forEach(function(item){
  copy.push(item);
});
```
> 위의 코드를 실행하면 item의 원소들은 각각 콜백함수로 넘어가 콜백함수 안에 구현된 행위를 한다. 위의 경우에는 전역의 copy배열에 각각의 원소를 push하는 행위를 하게 된다. 특별히 반환되는 것은 없고 undefined가 반환된다.

## map
- 이 메소드는 배열의 모든 원소에 대해 콜백함수를 적용하여 그 결과를 새로운 배열에 push에 넣어 리턴하는 JavaScript Array의 메소드다.
- reduce와 함께 활용도가 매우높다.
- map의 콜백함수가 다루는 파라미터는 forEach와 동일하다.
	- currentValue, index, array, thisArg
- 최종적으로 배열이 리턴된다.
#### 코드예제
```javascript
const numbers = [1, 4, 9];
const doubles = numbers.map(function(num) {return num * 2;});
// >>> [2,8,18]
```
> 위의 코드를 실행하면 배열의 각원소마다 콜백함수가 실행되고 그 리턴값을 배열에 넣는다. 모든 원소들이 이 행위를 마치고 리턴값들이 모인 배열을 최종적으로 리턴한다.


## filter
- 이 메소드는 배열의 모든 원소에 대해 콜백함수를 적용하여 boolean을 받아 true인 경우의 원소만을 모아 배열에 넣어 리턴하는 JavaScript Array 메소드다.
- filter의 콜백 함수는 true나 false를 반환해야 filter가 제대로 작동할 수 있다.
	- currentValue, index, array, thisArg의 파라미터들을 filter의 콜백함수가 사용하며 map과 동일한 기능을 한다.
#### 코드예제
```javascript
function isBiggerThanTen(value) {return value > 10}
let filtered = [10, 11, 112, 5, 8, 130, 44].filter(isBiggerThanTen);
// filtered = [11, 112, 130, 44]
```
> 위의 코드를 실행하면 10은 콜백함수에서 false를, 11은 콜백함수에서 true를 리턴할 것이다. 이러한 행위를 모든 원소에 적용하면 `false, true, true, false, true, true`가 계산될 것이다. 여기서 true의 값을 리턴한 `11, 112, 130, 44`만 `filtered`변수에 반환될 것이다.


## reduce
- 이 메소드는 배열의 각 원소마다 reducer라고 불리우는 콜백함수를 진행하고 마지막엔 하나의 결과를 반환하는 JavaScirpt Array의 메소드이다.
- 배열 메소드 중 매우 활용도가 높다고 불려진다.
- 위의 reducer는 네 개의 파라미터를 다룬다.
	- accumulator, currentValue, currentIndex, originalArray
- reducer가 실행될때마다 결과값은 accumulator에 할당된다.
#### 코드예제
```javascript
[0, 1, 2, 3, 4].reduce(function(accumulator, currentValue, currentIndex, array) {
  return accumulator + currentValue;
});
```
> 위의 코드를 실행하면 배열의 각 원소마다 reducer가 실행되고 reducer가 리턴하는 accumulator + currentValue값이 다음 번의 reducer실행에서 accumulator로 할당되어 실행된다. 제일 마지막에 accumulator의 값이 최종적으로 리턴된다.

reduce를 자세히 보면 map과 비슷한 작동방식이 있다는 것을 알 수 있다. 밑은 mdn에서 예시로 보여주는 reduce로 만드는 map메소드다.
```javascript
if (!Array.prototype.mapUsingReduce) {
  Array.prototype.mapUsingReduce = function(callback, thisArg) {
    return this.reduce(function(mappedArray, currentValue, index, array) {
      mappedArray[index] = callback.call(thisArg, currentValue, index, array);
      return mappedArray;
    }, []);
  };
}
```
## some
- some 메소드는 배열의 각 원소가 콜백함수의 판별을 통과하는지 확인하고 만약 하나라도 통과하는 경우에는 최종적으로 true를 리턴하고 그렇지 않다면 false를 리턴한다.
- some의 콜백함수가 다루는 파라미터는 forEach와 동일하다.
	- currentValue, index, array, thisArg
### 코드예제
```javascript
[2, 5, 8, 1, 4].some(elem => elem > 10);  // false
[12, 5, 8, 1, 4].some(elem => elem > 10); // true
```
> 위의 코드는 배열의 각 원소가 10보다 큰 수인지 확인하여 true/false를 리턴하는 콜백함수를 통과한 후 하나라도 true값을 가지게된다면 최종적으로 true를 반환한다.

## every
- every 메소드는 some과 매우 흡사한 기능을 하지만 모든 원소가 콜백함수를 통해 true값을 가질때만 최종적으로 true를 리턴하고 나머지 경우엔 false를 리턴한다.
- 빈 배열에서 사용하면 무조건 true를 반환한다.
```javascript
[12, 5, 130, 44].every(elem => elem >= 10); // false
[12, 54, 18, 130, 44].every(elem => elem >= 10); // true
```
> 두 배열 중 위 배열에서 10보다 작은 5가 존재하므로 최종적으로 false를 리턴하고 밑의 배열은 모든 원소가 10보다 크므로 최종적으로 true를 반환한다.
<!-- ## Something to check
- 위의 배열의 메소드들은 매우 많이 사용된다. 배열이라는 자료구조가 많이 사용되기 때문이다. 그렇기 때문에 Array에 prototyping을 이용하여 메소드를 추가하여 사용하는 경우가 있다. 이때 주의할 점이 있다.
```javascript
// prototyping을 이용하여 메소드를 추가한다.
Array.prototype.myMethod = function myMethod() {...}

[1,2,3,4].map(x=>return x*2) //문제없이 작동된다.
[1,2,3,4].myMethod(x=>return x*2) // 작동되지 않는다.
```
> JavaScript코드를 읽는 인터프리터의 행동 때문이다. `[]`를 사용하여 배열을 생성하면 인터프리터에게 runtime 배열 생성한다고 지시하는 것이며 다른 특별한 프로세싱이 진행되지 않는다. 만약 Array()를 이용하여 배열을 생성한다면 실행 콘텍스트를 찾아서 constructor를 불러와 배열을 생성한다. 그래서 만약 Array()를 사용하여 배열을 만들고 바로 prototyping한 배열을 사용할 수 있다. 하지만 그런식으로 배열을 생성할 필요는 없고 `[]`를 사용하여 배열을 생성하되 변수에 할당한 후 prototyping한 메소드를 사용하면 문제없이 작동한다. -->
## 함수형 프로그래밍
- 안정적인 프로그램을 만들기 위해 입력과 출력이 철저히 통제된 순수 함수 및 부수 효과(Side-effect)를 최소화한 함수 위주의 프로그래밍
- 간결하고 가독성 높은 프로그램을 작성할 수 있으며 동시성 작업을 더 안전하게 구현할 수 있다.
- 함수를 특별하게 취급하지 않는 프로그래밍 패러다임
## 함수형 프로그래밍에서 forEach, map, filter
- 위에서의 언급처럼 함수형 프로그래밍은 입력과 출력이 철저히 통제되며 부수 효과를 최소화 해야한다. 이는 함수가 함수 밖의 컨텍스트를 만지는 일(부수 효과)가 최소화 되야 하는데 이는 map, filter, reduce같은 배열의 메소드의 특징과 잘 맞아 떨어진다고 볼 수 있다. 그 이유는 위의 메소드들은 배열을 처리하여 새로운 배열을 리턴하고 원 배열은 그대로 두기 때문이다. 반면 forEach는 원 배열을 반드시 바꿔야 하도록 강제하는 것은 전혀 없지만 map이나 reduce처럼 새 배열을 강제하지 않고 index를 이용하면 원배열을 변경하는 것이 가능하다.

### reference
https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array