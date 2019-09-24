
# Python Basics

1. 리스트와 튜플의 다른점
	- 리스트는 mutable 객체이다.
	- 튜플은 immutable 객체이다.
	- 리스트보다 튜플을 사용하여 처리하는 것이 더 빠르다.
2. 파이썬의 핵심 기능
	- 인터프리터를 사용하는 언어이다.
	- 변수를 할당할때 타입을 선언할 필요가 없다.
	- 객체지향프로그래밍에 적절한 언어이다.
	- 함수는 일급 객체이다. 이말은 함수는 변수에 할당이 가능하며 다른 함수로부터 반환이 가능하고 다른 함수로 전달이 가능하다는 것이다.
3. 파이썬은 프로그래밍 언어일까요 스크립팅 언어일까요?
	- 파이썬은 스크립팅이 가능하나 일반적으로 다목적 프로그래밍언어로 여겨진다.
4. PEP8 이란?
	- PEP는 Python Enhancement Proposal을 의미하며 그 중 8번째로 파이썬 코드 스타일에 대해 제안하고 있다.

5. 파이썬에서는 메모리가 어떻게 관리되는가?
	- Memoery management in python is managed by **Python Private Heap space**. All Python objects and data structures are located in a private heap. The programmer does not have access to this private heap. The python interpreter takes care of this instead.
	- The allocation of heap space for Python objects is done by **Python's memory manager**. The core API gives access to some tools for the programmer to code.
	- Python also has an inbuilt garbage collector, which recycles all the unused memory and so that it can be made available to the heap space.

6. 파이썬에서 네임스페이스란?
	- 네임스페이스는 이름을 짓는 시스템으로서 이름들이 항상 유니크하여 네이밍 문제를 피할 수 있게 해주는 시스템이다.
	- 프로그래밍 언어에서 특정한 객체를 이름에 따라 구분할 수 있는 범위를 의미한다. 파이썬 내부의 모든 것은 객체로 구성되며 이들 각각은 특정 이름과의 매핑 관계를 갖게 되는데 이 매핑을 포함하고 있는 공간을 네임스페이스라고한다.
	- 네임스페이스가 필요한 이유는 다음과 같다. 프로그래밍을 수행하다보면 모든 변수 이름과 함수 이름을 정하는 것이 중요한데 이들 모두를 겹치지 않게 정하는 것은 사실상 불가능하다. 따라서 프로그래밍언어에서는 네임 스페이스라는 개념을 도입하여, 특정한 하나의 이름이 통용될 수 있는 범위를 제한한다. 즉 소속된 네임스페이스가 다르다면 같은 이름이 다른 객체를 가르키도록 하는 것이 가능해진다.
	- 파이썬의 네임스페이스는 3가지로 분류할 수 있다.
		- Built-in Namespace: 기본 내장 함수 및 기본 예외들의 이름들이 소속된다. 파이썬으로 작성된 모든 코드 범위가 포함된다.
		- Module: Global Namespace: 모듈별로 존재하며, 모듈 전체에서 통용될 수 있는 이름들이 소속된다.
		- Function: Local Namespace: 함수 및 메서드 별로 존재하며, 함수 내의 지역 변수들의 이름이 소속된다.
7. PYTHONPATH?
- 모듈이 임포트 될때 해당 모듈이 존재하는지 찾아보는 디렉토리들의 집합이다.

8. 파이썬 모듈이란 무엇인가? 자주 쓰이는 빌트인 파이썬 모듈은 무엇이 있는가?
- 파이썬 모듈은 파이썬 코드를 포함하고 있는 파일들을 일컫는다. 이 코드들은 함수, 클래스, 변수들을 포함한다. 파이썬 모듈은 .py로 끝난다.
- os, sys, math, random, datetime, json

9. 지역변수와 전역변수는 무엇인가?
- 전역 공간이나 함수 밖에 선언된 변수들을 전역변수라고 일컫는다. 이 변수들은 모든 함수에서 접근이 가능하다.
- 함수내에 선언된 모든 변수들을 지역 변수라고 일컫는다. 전역 공간에서 접근이 불가하다.

10. 파이썬은 case sensitive 한가?
- 그렇다 파이썬은 대문자와 소문자를 모두 따진다.

11. indentation은 필수인가?
- 파이썬에서 들여쓰기는 필수이다. 코드 블록을 구분하는데 사용되며 루프, 클래스, 함수 등을 구분한다. 주로 네개의 스페이스로 구분한다.

12. Python array와 list의 차이점은 무엇인가?

- array는 한가지 타입의 데이터만 저장할 수 있는 차이가 있으며 array가 데이터를 적게 사용하는 이득이 있다.

13. What is a lambda function?

- 익명함수를 의미하며 매개변수를 얼마든지 가질 수 있지만 한줄로만 작성이 가능하다.

14. 파이썬에서 self란?

- self는 클래스에서 인스턴스나 객체 자신을 의미한다. 클래스의 모든 메소드에서 언제나 제일 첫번째 매개변수이다.

15. break, continue, pass?

- BREAK: 특정 조건이 충족될 시 루프를 이탈하여 다음 코드를 실행하도록 한다.
- Continue: 특정 조건이 충족될 시 한번의 루프를 생략할 수 있도록 한다.
- Pass: 아무것도 하지 않고 넘길 수 있도록한다.

16. `[::-1]`는 무엇을 수행하는가?

- array나 list를 거꾸로 뒤집어 리턴한다.


17. Python iterator?
- Iterable
  - iterable 객체 - 반복 가능한 객체
  - 대표적으로 iterable한 타입: list, dict, set, str, bytes, tuple, range
  - `isinstance(target, collections.Iterable)`로 확인 가능
- Iterator
	- iterator 객체 - 값을 차례대로 꺼낼 수 있는 객체
	- iterator는 iterable한 객체를 내장함수 또는 iterable객체의 메소드로 객체를 생성할 수 있습니다.
	- 파이썬 내장함수 `iter()`를 사용해 iterator 객체를 만들 수 있습니다.

```python
a = [1,2,3]
a_iter = iter(a)
type(a_iter)
>>> <class 'list_iterator'>

# iterable객체는 매직메소드 __iter__ 메소드를 가지고 있습니다. 이 메소드로 iterator를 만들어 보겠습니다.
b = {1,2,3}
type(b)
>>> <class 'set'>
b_iter = b.__iter__()
type(b_iter)
>>> <class 'set_iterator'>
# iterator는 값을 차례대로 꺼낼 수 있는 객체입니다.
# next 내장 함수를 사용할 때 마다 첫번째, 두번째, 세번째 값이 출력됩니다.
# 네번째 실행에서는 StopIteration 이라는 예외가 발생합니다.

next(a_iter)
>>> 1
next(a_iter)
>>> 2
next(a_iter)
>>> 3
next(a_iter)
>>> Traceback (most recent call last):
	File "<stdin>", line 1, in <module>
StopIteration
# iterator 매직 메소드 'next'를 통해 하나씩 값을 꺼내봅니다.
b_iter.__next__()
>>> 1
b_iter.__next__()
>>> 2
b_iter.__next__()
>>> 3
```

18. Python Generator
- Functions that return an iterable set of items are called generators.
- 제네레이터를 사용하여 iterator를 받아 긴 배열의 데이터를 처리하면 메모리와 시간적으로 굉장한 효율을 가질 수 있다.

19. is, not, in operator

- operator는 특별한 함수이다. 한 개나 한 개 이상의 값을 가지고 결과를 낸다.
- is는 메모리 위치를 비교한다.
- not은 boolean값을 뒤집는다.
- in은 어떤 값이 해당 배열에 존재하는지 확인한다.

20. Python이 끝나면 왜 메모리 할당을 끝내지 않을까?

- Whenever Python exits, especially those Python modules which are having circular references to other objects or the objects that are referenced from the global namespaces are not always de-allocated or freed.
- It is impossible to de-allocate those portions of memory that are reserved by the C library.
- On exit, because of having its own efficient clean up mechanism, Python would try to de-allocate/destroy every other object.
- 순환참조를 나중에 찾아내서 해제한다.

 
21. Python 패키지

- 다수의 모듈을 포함하는 네임스페이스다.

22. Numpy array VS Python list

- list는 vectorized operation이 불가능하며 원소 하나하나에 처리를 해줭야 한다.
- Numpy는 vectorized operation이 가능하며 훨씬 효율적이며 편리하다. 

23. deepcopy VS shallowcopy
- 리스트 슬라이싱과 copy 모듈의 copy 는 shallow copy이다.
	- a 리스트를 복사하여 b 변수에 할당하면 둘은 다른 메모리 주소를 가지고 있지만 만약 리스트의 인덱스 0 안에 mutable객체가 할당되어 있는 경우 `id(a[0]) == id(b[0])`의 경우가 발생해 버린다. a[0]의 값을 변경하면 b[0]의 값 또한 변경된다.
- copy 모듈의 deepcopy를 사용하면 위를 방지할 수 있다. 내부 객체들 까지 모두 새롭게 copy되어 다른 메모리 주소를 가지게 된다.

24. Multithreading in Python?

- 파이썬은 멀티쓰레딩 패키지가 존재하지만 속도를 향상시키기 위해 멀티쓰레드를 사용하는 것은 좋은 아이디가 아니다.
- 파이썬은 Global Interpreter Lock(GIL)을 
- GIL이 존재하는 이유: CPython에서의 GIL은 Python을 실행할 때 여러 쓰레드를 사용할 경우, 단 하나의 쓰레드만이 Python Object에 접근할 수 있도록 제한하는 mutex이다. 그리고 이 Lock이 필요한 이유는 CPython이 메모리를 관리하는 방법이 thread-safe하지 않기 때문이다.
- thread-safe하지 않다는 의미의 예)
	- 하나의 전역 변수 x에 두 개의 쓰레드가 동시에 접근해서 각자의 작업을 하면 어느 한쪽의 작업 결과가 씹히는 경우가 발생할 수 있다. 여러 쓰레드가 공유된 데이터를 변경함으로써 발생하는 문제를 race condition이라고 부른다.
- mutex (mutual exclusion)은 공유되는 메모리의 데이터를 여러 쓰레드가 동시에 사용할 수 없도록 잠그는 일을 mutex가 맡는다.


#### 쓰레드와 프로세스
- 운영체제가 생성하는 작업 단위를 프로세스라고 한다. 이 프로세스 안에서 공유되는 메모리를 바탕으로 여러 작업을 또 생성할 수 있는데, 이 때의 작업 단위를 쓰레드라고 한다. 따라서 각 쓰레드 마다 할당된 개인적인 메모리가 있으면서, 쓰레드가 속한 프로세스가 가지는 메모리에도 접근할 수 있다.


25. Python Inheritance

- reserved for later commit.

26. Polymorphism

- 자녀클래스는 부모클래스의 메서드 중 똑같은 이름의 메서드를 선언할 수 있다. 이것이 다형성(Polymorphism)을 의미한다.













































































