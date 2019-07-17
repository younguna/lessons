# git basics

## Init
- 새로운  git 저장소가 만들어짐

## Clone
- `git clone /로컬/저장소/경로`
  - 로컬 저장소(repo)를 복제(clone)
- `git clone username@host:/원격/저장소/경로`
  - 원격 서버의 저장소를 복제

## git 작업의 흐름
- 로컬 저장소는 git이 관리하는 세 가지로 구성되어 있다.
- 첫 번재는 작업 디렉토리 - 실제 파일들로 이루어져 있다.
- 두 번째는 인덱스(Index) - 준비 영역 (staging area) 역할을 한다.
- 세 번째는 HEAD - 최종 확정본(commit)을 나타낸다.

## Add & Commit
- `git add <파일이름>`
- `git add *` : 현 디렉토리 모두 추가
    - 위의 명령어로 변경된 파일을 인덱스에 추가할 수 있다.
- `git commit -m "이번 확정본에 대한 설명"`
  - git의 기본 작업 흐름에서 첫 단계에 해당한다.
  - 이 명령어를 내려 확정을 하면 변경된 파일이 HEAD에 반영된다.
  - 원격 저장소는 아직 반영되지 않음

## Push
- 위의 순서까지 진행했다면 로컬 저장소의 HEAD에만 변경 내용이 존재한다.
- `git push origin master`를 통해 로컬의 master 브랜치를 원격 저장소의 master 브랜치에 발행할 수 있다.
- 만약 기존의 원격 저장소에서 복제한 로컬 저장소가 아니라면 `git remote add origin <원격서버주소>`를 통해 git에게 알려줘야 한다.

## Branching
- 브랜치는 안전하게 격리된 상태에서 코딩을 할 때 사용한다.
- 저장소를 만들면 기본의 master 브랜치가 만들어진다.
- master 브랜치에서 다른 브랜치를 만들고 그 브랜치에서 작업을 진항하고 나중에 작업이 완료되면 master 가지로 돌아와 병합(merge)한다.
- `git checkout -b feature_x` feature_x라는 브랜치를 만들고 checkout 한다.
- `git checkout master`를 통해 master 브랜치를 다시 checkout한다.
- `git branch -d feature_x`를 통해 브랜치를 삭제할 수 있다.
- 새로 만든 브랜치는 원격 저장소로 전송하기 전까지는 다른사람들이 볼 수 없다.

## Merge
- `git pull`을 통해 로컬 저장소를 원격 저장소에 맞춰 갱신할 수 있다.
  - 로컬 작업 디렉토리에 받아지고(fetch), 병합(merge) 된다.
  
- 다른 브랜치에 있는 변경 내용을 현재 브랜치로 병합하려면 `git merge <브랜치명>`을 통해 병합할 수 있다.
- `git diff <원브랜치> <비교브랜치>`를 통해 merge전 어떻게 바뀌는지 비교해 볼 수 있다.

## Tag
- SW의 새 버전을 발표할 때마다 꼬리표를 달아놓으면 식별하기 편리하다.
- `git tag 1.0.0 1b2e1d63ff`같은 명령어를 사용하여 tag를 달 수 있으며 1.0.0이 태그이고 뒤의 부분은 태그가 가리킬 확정본 식별자 입니다.
- `git log` 명령어를 통해 확정본 식별자를 얻을 수 있다.
  
## 로컬 변경 내용 되돌리기
- `git checkout -- <파일 이름>` 명령어는 로컬의 변경 내용을 되돌릴 수 있습니다. 로컬의 변경 내용을 변경 전 상태(HEAD)로 되돌린다. 
  - 다만 이미 인덱스에 추가된 변경 내용과 새로 생성한 파일은 그대로 남는다.
- 로컬에 있는 모든 변경 내용과 확정본을 포기하려면 `git fetch origin || git reset --hard origin/master`으로 원격 저장소의 최신 이력을 가져오고 로컬 master 브랜치가 원격 저장소의 master 브랜치 이력을 가리킬 수 잇다.

## git fork to pull request
- origin remote repo에서 fork를 하여 자신의 remote repo에 복사한다.
  - 실제로 fork는 git에 존재하는 명령어가 아니며 github같은 원격저장소 내에서의 clone과 비슷하다고 볼 수 있다.
- 나의 원격 저장소에서 로컬로 git clone한다.
- 로컬에서 브랜치를 생성하여 작업 후 브랜치를 master로 merge후 master를 push 한다.
- 나의 remote repo의 master브랜치를 fork한 origin remote repo에 PR을 날린다.
- 물론 origin remote repo가 어떻게 브랜칭을 하느냐에 따라 위의 과정은 매우 달라질 수 있다.

## git fetch
- `git pull`을 실행하면 원격 저장소의 내용을 가져와 자동으로 병합 작업을 실행하게 됩니다.
- 단순히 원격 저장소의 내용을 확인만 하고 로컬 데이터와 병합은 하고 싶지 않은 경우에는 `git fetch` 명령어를 사용할 수 있습니다.
- fetch한 상태에서 원격 저장소의 내용을 로컬 저장소의 master 브랜치에 통합하고 싶은 경우에는, "FETCH_HEAD" 브랜치를 merge하면 됩니다. pull 명령어는 내부적으로 fetch + merge 입니다.

## github fork에서 pull request까지
- 원본 원격저장소에서 사용자의 원격저장소로 복사(fork) 함
	- 실질적으로 git clone. 원격 저장소내의 기능
- 사용자의 원격 저장소에서 사용자 개인 로컬저장소로 복사(clone) 함
- 로컬 저장소에서 작업 후 add 명령어를 이용해 stage에 올림
- commit 명령어로 stage에 올라간 변경사항을 확정
- push를 이용해 로컬 저장소에 commit된 변경사항을 원격 저장소에 반영
- pull request(PR)를 이용해 개인 원격저장소의 변경 사항을 원본 원격저장소에 반영요청
	- 이때 여러가지의 상황에 따라 브랜치간으로 이루어 질 수 있음
- 승인이 이루어지면 원격저장소에 변경 사항 반영

## git add 와 git commit 시 git의 내부
- `git add` 동작을 수행하면 index(스테이지) 에 object 이름과 실제 파일 이름이 추가되고, 오브젝트에 blob 타입으로 파일 내용이 추가됨
- blob 파일이란 바이너리 라지 오브젝트의 약자로, 대용량 데이터를 저장하기 위한 이진 데이터의 모임을 말함 
- `git commit` 동작을 수행하면 object에 commit 객체와 tree객체가 추가됨 
- tree 객체는 스테이지에 올라온 것들을 snapshot 을 찍어 저장하고, commit객체는 만들어진 tree 객체와 부가적인 정보를 저장함

## git-workflow 
- git-workflow가 필요한 이유는 안전한 개발을 위해서임
- 개발자가 자유롭고 안전하게 개발할 수 있어 개발 생산성을 향상시킴
- 대표적인 git-branch 전략은 master와 develop, feature, release, hotfix로 구분해서 필요에따라 생성해 작업하는 전략을 말함
- `develop` 브랜치의 경우 다음 출시 버전을 개발하는 브랜치
- `feature` 브랜치의 경우 기능을 개발하는 브랜치
- `release` 브랜치는 이전 출시 버전을 준비하는 브랜치
- `hotfix` 브랜치는 출시 버전에서 발생한 버그를 수정하는 브랜치
- 팀의 상황에 따라 여러가지로 branch를 유지할 수 있음