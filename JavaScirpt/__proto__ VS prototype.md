# JavaScript  \_\_proto\_\_ VS prototype


> - 단순히 생성한 객체(ex. const a = {})에는 prototype객체가 없다.
> - prototype은 함수객체에만 존재한다.
> - prototype은 함수를 new 키워드와 함께 constructor로 사용하고 싶을때 쓴다.
> - __proto__는 모든 객체에 존재한다.
> - __proto__를 이용하여 prototype chain을 검사한다.


- 자바스크립트에서 함수는 객체이다.
```javascript
function person(){};
const person = new Function();
//같은것이다.
```
- 위의 함수를 선언하면 Person 객체와 Person's prototype이라는 두개의 객체가 생긴다. `(실제로는 Person's prototype이라고 불리지는 않지만 이 글에서는 Person객체의 prototype이 가리키는 prototype객체를 말한다.)`
- Person의 prototype속성은 Person's prototype을 가리키고 Person's prototype은 constructor 속성으로 Person 객체를 가리킨다.
```javascript
Person.prototype.returnName = function(){}
```
- 위까지 완료되면 객체를 찍어내는 공장인 Person이라는 Constructor function을 만든 것이다.
```javascript
const kim = new Person();
```
- 위의 코드가 실행되면 kim이라는 객체가 만들어지는데 이 객체는 __proto__속성이 생기는데 이 속성은 Person's prototype을 가리키게 된다.
- 즉 Person.prototype도 Person's Prototype을 가리키고 kim.__proto__도 Person's Prototype을 가리킨다.


<img src="https://imgur.com/pr7spGd.png"/>

- 위의 그림에서 new Person()이 kim의 역할을 나타낸다.
- kim의 __proto__는 kim을 생성한 Person의 prototype을 가리키고 그 prototype은 constructor 속성으로 다시 Person을 가리킨다.
- kim의 __proto__는 Person의 prototype을 가리킨다 했는데 사실 Person의 prototype도 __proto__속성으로 다른 prototype을 가리킬 것이다.
- 위의 그림에서는 Animal의 prototype을 가리키고 있다. 이는 JavaScirpt에서 상속의 기본 개념이다.
    - new Person인 kim객체는 Person의 인스턴스로써 Person의 Prototype의 returnName과 returnAge함수를 쓸 수 있는데 이것은 JavaScript가 kim객체의 prototype chain따라 Person의 prototype 객체에서 returnName과 returnAge를 찾아내었기 때문이다.
    - 이런식으로 JavaScript는 __proto__속성을 따라 kim객체가  Animal의 prototype객체안에서 makeSount()를 찾아서 사용할 수 있도록 해준다.
    - 이는 마치 Person이 Animal을 상속한 것과 같은 효과를 낸다.
    - 참고로 __proto__의 연결의 마지막에는 최상위 객체인 Object의 prototype 객체가 있으며 함수나 속성을 prototype chain을 모두 찾은 후 찾지 못한다면 속성의 경우 undefined을 리턴하고 함수의 경우 에러가 발생한다.





