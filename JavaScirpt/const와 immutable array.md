# const와 immutable array

- `const`로 선언된 array는 재할당은 불가능하지만 .push하는 것은 가능하다

- `const`를 사용해도 `array`와 `object`의 값을 변경하는 것은 가능하다

### immutable array
```javascript
const list = [1,2,3];
const list2 = [].concat(list, 4);

console.log(list === list2);
>>> false
```

- **immutalbe array**는 말대로 불변한 array를 말하는 것이 아니라 **불변하게 사용하는 array**를 말한다.
- 위의 코드에서 `list`와 `list2`는 다른 객체로 말하고 있다. 그 의미는 `list2`에서 값을 바꿔도 `list`가 참조하는 것이 다르기 때문에 `list`는 불변하게 된다.
