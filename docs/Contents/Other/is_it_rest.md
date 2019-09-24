# "그런 REST API로 괜찮은가"를 보고
#### Deview 2017 발표자 토스 이응준님
> [네이버TV](https://tv.naver.com/v/2292653?query=%EA%B7%B8%EB%9F%B0+rest&plClips=false:2292653:9741132:8030262:4811659:883868:2239206:882165)  
> [YouTube](https://www.youtube.com/watch?v=RP_f5dMoHFc)  
> [Slideshare](https://slides.com/eungjun/rest#/)

#### 주변에서 듣고 보는 REST API
- 개발자라면 모두 REST를 들어봤을 테지만 확실히는 잘 모르겠는 느낌이 많이 듬
> “그부분은 rest하지 않은거 같은데요?“  
> 이런식으로 이야기하지만 딱 rest가 뭔지 이야기 하기 어려움  

#### REpresentational State Transfer
- 풀네임을 읽어도 무슨 의미인지 알 수 없음
- 위키: 컴퓨터 시스템 간에 "**상호운용성**"을 제공하는 방법중에 하나

#### 시작은 WEB(1991) 
Q: 어떻게 인터넷에서 정보를 공유할 것인가?
A: 정보들을 하이퍼텍스트로 연결한다.
	- 표현 형식 HTML
	- 식별자 URL
	- 전송 방법 HTTP
를 만듬

#### Roy T. Fielding
HTTP/1.0(94-96)에 참여한 Roy T. Fielding이라는 사람이 작업에 참여하면서 고민을 하게됨 
> improve HTTP without breaking the web?  
- 어떻게 하면 웹을 망가트리지 않고 HTTP를 진보시킬 수 있을까 -> HTTP Object Model을 만듬
- 4년후  이것을 MS research(1998)에서 REST라는 이름으로 발표
- 2000년에 박사논문으로 발표
	- Architectural Styles and the Design of Network-based Software Architectures

#### 그 무렵 API라는 것이 만들어지기 시작함

- XML-RPC(1998) by MS -> SOAP이란 이름으로 바뀜
- Salesforce API (2000.2) 거의 인터넷 최초의 API 
	- SOAP으로 만듬
- 2004.8 flickr API에서는 SOAP과 REST 둘 다로 만듬
	- 이미 나온 이름이였지만 REST가 사람들은 새롭다고 느낌
	- 사람들이 SOAP과 비교했을 때 REST가 단순하고 규칙적고 쉽다는 느낌을 받음
- 2006년  AWS 자사 API의 85퍼센트가 REST임을 밝힘
- 2010 salesforce도 REST로 API를 제공하기 시작함
> REST의 승리?  

#### CMIS(2008)가 나타남
- CMS를 위한 표준
- EMC, IBM, MS등이 함께 작업
- REST 바인딩 직업
- 다른 사람들은 REST인것 같다고 말했지만
> Roy T. Fielding “No REST in CMIS”  

#### MS REST API Guidlines (2016)
MS가 REST API Guidline을 만듬
> Roy T. Fielding  “HTTP API”, “REST APIs must be hypertext-driven”,  
> “REST API를 위한 최고의 버저닝 전략은 버저닝을 안 하는 것”  

#### 도데체 문제는 무엇일까
- REST API -> REST 아키텍처를 따르는 API
- 로이필딩 : REST -> 분산 하이퍼미디어 시스템(예: 웹)을 위한 아키텍쳐 스타일
> 아키텍처 스타일  
> 제약조건의 집합을 의미  
> 즉, 제약조건을 모두 지켜야 REST 아키텍처를 따른다고 말할 수 있다.  

#### REST는 아키텍쳐 스타일임에 동시에 아키텍쳐 스타일의 집합임
- client-server
- stateless
- cache
- **uniform interface**
- layered system
- code-on-demand(optional) -> 서버에서 클라인트로 코드를 보내서 실행할 수 있음 (JS
> 대부분 만족할 수 있으나 Uniform Interface를 따르는 것이 어려움  

#### Uniform Interface의 제약조건
- identification of resources
- manipulation of resources through representations
- **self-descriptive messages**
- **hypermedia as the engine of application state(HATEOAS)**

#### Self-descriptive message?
- 메세지가 스스로를 설명해야함
```
GET / HTTP/1.1
```
이  요청 메세지는 host가 빠져있어서 self-descriptive하지 못함
```
Host: www.example.org
```
위 추가하면 self-descriptive 해짐
```
HTTP/1.1 200 OK
Content-Type : application/json

[{"op": "remove", "path"": "a/b/c"}]
```
위에서 Content-type이 빠지면 self-descriptive하지 않은 것임
	- 은 사실  사실이 아님
	- op가 무엇인지 등을 알 수 없음
`Content-Type: application/json-patch+json`
> 위를 추가하여야 함  
> patch-json의 명세를 찾아가서 이해한 다음에 메세지를 해석해야 올바르게 이해가 가능함  
> 메세지만으로 온전히 이해할 수 있어야 함  

#### HATEOAS(Hypermedia As The Engine Of Application State)
> 애플리케이션의 상태는 Hyperlink를 이용해 전이되어야 함  
- HTML에서는 만족하는 것이 어렵지 않음
- json에서도 만족할 수 있음
	- Link 헤더를 통해 이전과 다음 URI를 제공할 수 있음

### 도데체 왜 Uniform Interface를 만족해야 하는가
-  독립적 진화를 위해서임
	- 서버와 클라이언트가 각각 독립적으로 진화함
	- **서버의 기능이 변경되어도 클라이언트를 업데이트할 필요가 없음**
	- REST를 만들게 된 계기 : **How do I improve HTTP without breaking the web**

#### 웹 웹페이지는 REST를 매우 잘 만족하고 있다.
- 웹 페이지를 변경했다고 웹 브라우저를 업데이트 할 필요 없음
- 웹 브라우저를 업데이트했다고 웹 페이지를 변경할 필요도 없음
- HTTP 명세가 변경되어도 웹은 잘 동작하며 HTML명세가 변경되어도 웹은 잘 동작함
> 페이지가 깨질 수는 있지만 동작은 함  

#### 모바일 앱은 자주 업데이트가 일어난다.
> 엄밀히 말하면 앱클라이언트와 서버는 REST 아키텍처를 따르고 있지 않다는 결론에 다다름  

#### 웹은 어떻게 이렇게 할 수 있었을까?
- W3C Working group
- IETF Working groups
- 웹 브라우저 개발자들
- 웹 서버 개발자들
-> 이들이 엄청난 노력을 함
> HTML5 첫 초안에서 권고안 나오는데 6년  
> HTTP1.1 명세 개정판 작업하는데 7년 -> 기능 하나도 추가안됨 7년동안. 하위 호환성 깨트리지 않기 위해  

#### 상호운용성(interoperability)에 대한 집착이 있다.
- Referer 오타지만 안고침(25년전 오타)
- charset 잘못 지은 이름 안고침 -> encoding이라고 이름을 지었어야 함
- HTTP 상태 코드 416 포기함 (I’m a teapot) -> 라는 draft가 나와있음
	- 이런 놈들과라도 상호운용성을 지원해줘야 하기 때문
- HTTP/0.9 아직도 지원함
	- 0.9지원을 빼봤는데 몇몇 프록시에서 동작이 되지 않았다고 함

> 위의 노력들이 있는데 **왜 애플리케이션 개발자들**은 저런 상호운용성에 대한 집착이 없을까?  

#### REST가 웹의 독립적 진화에 도움을 주었을까?
- HTTP에  지속적으로 영향을 줌
- HOST 헤더 추가
- 길이 제한을 다루는 방법이 명시 (414 URI Too Long)
- URI에서 리소스의 정의가 추상적으로 변경됨
- HTTP/1.1 명세 최신판에서 REST에 대한 언급이 들어감
	- 하지만 로이필딩이 HTTP와 URI명세의 저자 중 한명임

#### REST는 성공했는가?
- REST는 웹의 독립적 진화를 위해 만들어 졌고 이는 성공했다.

#### REST API는 ?
- REST API는 REST 아키텍쳐 스타일을 따라야 하는데 잘 따라지지 않음

#### REST API는 다 저것을 따라야 하나?
- 로이필딩은 다 따라야 한다고 말함
>  REST가 단순하고 규칙 적고 쉬운줄 알았는데 사실 어렵다.  

#### 원격 API가 꼭 REST API일 필요는 없다.
- 로이필딩 - 시스템 전체를 통제할 수 있다고 생각하거나, 진화에 관심이 없다면, REST에 대해 따지느라 시간을 낭비하지 말라
- **진화** - 독립적 진화
- **시스템 전체를 통제가능** - 내가 다 바꿀 수 있다면 호환성 같은 것이 왜 필요하겠는가

#### 어떻게 할까?
- REST API를 구현하고 REST API라고 부름
- REST  API 구현을 포기하고 HTTP API라고 부름
- **현재양상** -> REST API가 아니지만 REST API라고 부름

#### 왜 API는 RETS가 잘 안되나?
- 웹페이지는 사람이 봄 Media type = HTML
- API는 기계가 봄 Media type = json
- HTML은 명세가 있기 때문에 self-descriptive  명세가 정의되어 있음
- JSON은 정의되어 있는 명세가 없음
- HTML 하이퍼링크 있고 JSON은 없음
- 그래서 API는 별도의 문서를 만들게 됨

#### Self-descriptive한 REST API
방법 1
- 미디어 타입을 하나 정의함
- 미디어 타입 문서를 작성함
	- 이 문서에 id가 뭐고 title이 뭔지 의미를 정의함
-  IANA 미디어 타입을 등록함
	- 이 때 만든 문서를 미디어 타입의 명세로 등록함
> 단점 : 매번 media type을 등록해야함  

방법 2
- 명세를 작성한다.
- Link 헤더에 profile  relation으로 해당 명세를 링크함
- 이런 형식으로 `Link: <https://example.com/doc/todos>; rel="profile"`
- 메세지를 보는 사람은 명세를 찾아갈 수 있으므로 이 문서의 의미를 온전이 해석 할 수 있음
> 단점 : 클라이언트가 Link 헤더와 profile을 이해해야 함  
> Content negotiation을 할 수 없음  

#### HATEOAS REST API
방법1
- data에  다양한 방법으로 하이퍼링크를 표현
> 단점 : 링크를 표현해야하는 방법을 표현해야 함  
- 혹은 JSON으로 하이퍼링크를 표현하는 방법을 정의하는 명세들을 활용함
	- JSON API, HAL, UBER, Siren, Collection+json
> 기존 API를 많이 고쳐야 한다.  

방법2
- Link, Location 등의 헤더로 표현함
> 단점 : 정의된 relation만 활용한다면 표혀에 한계가 있음  

#### 정리
- 오늘날 대부분의 REST API는 사실 REST를 따르지 않고 있음
- REST의 제약조건 중에 서 특히 self-descriptive와 HATEOAS를 만족하기 어려움
- REST는 긴 시간에 걸쳐 진화하는 웹 애플리케이션을 위한 것
- REST를 따를 것인지는  API를 설계하는 이들이 스스로 판단하여 결정
- REST를 따르겠다면, Self-descriptive와 HATEOAS를 만족해야함
	- self-descriptive는 custom media type이나 profile link relation 등으로 만족시킬 수 있음
	- HATEOAS는 HTTP 헤더나 본문에 링크를 담아 만족시킬 수 있다.
- REST를 따르지 안겠다면,  REST를 만족하지 않는 REST API를 뭐라고 부를지 결정해야 함
	- HTTP API라고 부를 수 도 있고
	- 그냥 REST API라고 부를 수 도 있음 (Roy Fielding이 권장하지 않음)