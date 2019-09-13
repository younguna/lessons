# JavaScript ES6 Basics


- `'${shape.toString()} : ${config.shapeErrorMsg}'`

> template literals : 내장된 표현식을 허용하는 문자열 리터럴로, 문자열과 문자 보간 기능을 사용할 수 있다.


- 여러 개의 전역변수를 선언할 때 하나의 객체 내에 선언해 주면 충돌을 어느정도 방지할 수 있다.



- == 와 ===의 차이
	> == : 자료형이 달라도 값이 같다면 true 
	>
	> === : 자료형이 같으면서 값이 같아야 true
- some()
	> array.some( ~~ ) 배열 내의 값 중 하나 이상 ~~의 조건을 만족한다면 true를 반환

- join()
 	> 배열 안의 요소들을 string으로 바꿔주며 인자를 전달할 시에는 배열을 출력할 때 사이에 인자를 함께 출력해준다

- 예외처리를 할 때, if문으로 예외를 throw하는 방법도 있지만 프로그램에서 기본적으로 throw하는 예외를 catch했을 때 처리하는 방법도 있다.

- 어떤 변수를 로컬변수로 사용할 때, var 보다는 let과 const로 선언하는 쪽이 좋다.
- var와 let의 스코프 차이

- 코드 내에서 동작하는 데에 영향은 없더라도 형식을 통일해 주는 것이 좋다.

	> ex ) "ㅇ" 와 'ㅇ' 를 같이 사용하는 것은 좋지 않다.



- 함수표현방법

	- 일반적 함수 표현

    ```js
    function test() { 
    console.log('ㅇ'); 
    }
	```

 	- 변수를 이용한 함수 표현

    ```js
    const printName = function() {
    return 'ㅇ';
    }
    ```
  	- arrow function

    ```js
    const getName = (name) => "Kim " + name;
    ```

- 순수함수

  - 동일한 인자를 주었을 때 항상 같은 값을 반환하는 함수
  - 함수가 자체적으로 외부 상태를 변경하지 않는다 ( 부수 효과가 없다 )
  - 장점
  	- 재사용성이 높다
    - 입력과 결과가 분리되어 있어서 어떻게 사용되는지 신경 쓸 필요가 없다.

- ES2015에서의 유용한 문법

  - 구조 분해 할당

    > ```js
    > let arr = [1, 2];
    > const [a, b] = arr;
    > ```
    >
    > - 위와 같은 구조로 저장된 값들을 다른 변수에 할당할 때 불필요한 코드를 줄이면서 간결하게 작성할 수 있다.
    >
    > - ```[arr[0], arr[1]] = [arr[1], arr[0]];``` 와 같이 swap도 가능

  - arrow function
  - template literals



