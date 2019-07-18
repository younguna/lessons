# JavaScript Number() VS parseInt()

```javascript
const numbers = [1, 2, "a", [], '1']

a.forEach(function(el){
    var pi = parseInt(el)
    var nu = Number(el)
    console.log("original:    ", el)
    console.log("parseInt(): ", pi)
    console.log("Number():   ", nu)
    console.log("=====================")
})
```
### 결과
```
original:    1
parseInt():  1
Number():    1
=====================
original:    2
parseInt():  2
Number():    2
=====================
original:    a
parseInt():  NaN
Number():    NaN
=====================
original:    []
parseInt():  NaN
Number():    0
=====================
original:    1
parseInt():  1
Number():    1
=====================
```