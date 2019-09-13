# isNaN() isArray() 동작


```javascript
const testInputs = [0, 1, 2, "1", "2",[1], ["a"], [], [1,"a"], [1,2,3], undefined, null]

testInputs.forEach((el)=>{
    console.log("original: ", el);
    console.log("!isNaN:   ", !isNaN(el));
    console.log("isArray:  ", isNaN(el));
    console.log("========================")
})
```
### 결과
```js
original:  0
!isNaN:    true
isArray:   false
========================
original:  1
!isNaN:    true
isArray:   false
========================
original:  2
!isNaN:    true
isArray:   false
========================
original:  1
!isNaN:    true
isArray:   false
========================
original:  2
!isNaN:    true
isArray:   false
========================
original:  [ 1 ]
!isNaN:    true
isArray:   false
========================
original:  [ 'a' ]
!isNaN:    false
isArray:   true
========================
original:  []
!isNaN:    true
isArray:   false
========================
original:  [ 1, 'a' ]
!isNaN:    false
isArray:   true
========================
original:  [ 1, 2, 3 ]
!isNaN:    false
isArray:   true
========================
original:  undefined
!isNaN:    false
isArray:   true
========================
original:  null
!isNaN:    true
isArray:   false
========================
```