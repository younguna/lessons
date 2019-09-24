# git fork 부터 이루어지는 오픈소스/프로젝트 git에 관하여

<img src="https://i.imgur.com/cU1Jbut.png" width="60%" style="margin:0 auto; display:block">


## Repository 설명

- original repository : 프로젝트 혹은 오픈소스의 원 원격 리포지토리, 오픈소스의 본 소스코드들이 브랜치와 함께 유지되고 있으며 현재 개인은 이 리포지토리에 권한이 전혀 없다.

- my remote repository : 나의 원격 리포지토리로써 original repository에서 fork해 온 것이다. fork는 github같은 원격 git 서비스 상에서 수행되는 git clone 이다. fork해온 나의 원격 리포지토리에 내가 작업하는 코드들을 push할 수 있다. 만약 이 원격 리포지토리에 같이 작업하는 팀원이 있다면 그가 push한 코드를 pull할 수 도 있다.

- local repository : 그림에서 가장 밑에 존재하는 리포지토리이며 내가 실제로 작업하는 컴퓨터에 존재한다. master 브랜치에서 브랜치를 파생하여 작업하며 그것을 push하면 my remote repository에도 그 브랜치가 생성된다. 작업한 이력을 남긴다.

## Flow
[1] : original repository에서 내 원격 remote repository(나의 github 계정 등)으로 git fork 해온다. public되어있는 오픈소스는 git fork하는데 전혀 영향이 없다. my remote repository에 나의 원격 리포지토리가 생성된다.
[2] :  my remote repository에 생성된 코드를 작업하기 위하여 local repsoitory로 git clone 해온다.
[3] :  그림에서는 working branch라는 이름으로 브랜치를 생성하여 작업한다. 본인이 원하는 브랜치명으로 브랜치를 파생하여 작업한다.
[4] : 여러 작업을 수행한 후 원격 저장소에 저장하기 위해 push를 수행한다.
[5] :  original repository에 개인은 권한이 없으므로 본인이 작업을 수행하고 my remote repository에 저장한 나의 코드를 github의 경우 Pull Request를 생성하여 무엇을 작업했는지 등등을 작성하고 요청을 보낸다. original repository의 주인이나 단체가 Pull request를 점검하고 해당 코드를 자신들의 original repository에 merge 할지 말지를 결정한다.
- Pull request가 거부되었을 시, 그에 대한 이유등을 알려주는 친절한 owner가 있는 반면 확인하지도 않는 owner도 있으며 아무 이유 없이 거부하는 owner도 있다.
