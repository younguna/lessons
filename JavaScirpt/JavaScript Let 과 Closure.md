# JavaScript Let 과 Closure

```javascript
var list = document.querySelectorAll("li")

for (var i=0; i<list.length; i++) {
    list[i].addEventListener("click", function(){
        console.log(i);
    })
}
```
- 위의 상황에서 만약 `list.length`가 5라면 모든 `li`를 클릭한다면 5라는 값만 출력될 것이다.
- 분명히 의도한 상황은 첫번째 `li`는 0을 두번째 `li`는 1을 출력하도록 보이는 코드인데도 말이다.
- 그 이유는 `eventListner`가 등록하는 콜백은 나중에 실행이 되는데 그 콜백에서 `i`가 밖의 `i`의 참조를 유지하는 클로저가 생겨서 발생하는 문제다.

```javascript
var list = document.querySelectorAll("li")

for (let i=0; i<list.length; i++) {
    list[i].addEventListener("click", function(){
        console.log(i);
    })
}
```
- 간단하게 `var i`를 `let i`로 바꾸어주면 해결할 수 있다.
- `let`을 사용하면 블록스코프가 생겨서 지역변수화 되는 것처럼 콜백이 블록스코프의 변수를 기억하고 있다가 사용하게 된다.
- 각각의 `li`들은 차례대로 0, 1, 2 ... 를 출력하게 된다.