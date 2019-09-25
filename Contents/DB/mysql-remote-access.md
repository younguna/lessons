# MySQL 외부로 3306 포트 노출하기

> 절대로 사용하면 안되는 방법이나 MySQL를 이해하는데 조금 도움을 줄 수는 있음

가정1: cloud 서버에 MySQL이 작동중

1. Cloud 서버의 보안그룹과 같은 설정에서 3306을 원하는 혹은 모든 IP에서의 inbound 접근을 허용한다.
2. `/etc/mysql/mysql.conf.d/mysqld.cnf`을 다음과 같이 수정한다.
	- `bind-address = 127.0.0.1` 이부분을 `bind-address = 0.0.0.0`으로 수정한다.
3. `sudo systemctl restart mysql.service`로 mysql을 재시작한다.
4. MySQL 클라이언트로 ssh 프로토콜로 접속한다.
5. MySQL의 root계정은 외부에서 접근이 절대로 불가하므로 새로운 계정을 생성하여 외부 접속 권한을 준다.
	1. `CREATE USER ‘newusername’@‘%’ IDENTIFIED BY ‘newpassword’;` 
	2. `GRANT ALL PRIVILEGES ON *.* TO ‘newusername’@‘%’` 모든 DB의 모든 TABLE 허용
	3. `GRANT ALL PRIVILEGES ON database.table TO ‘newusername’@‘%’` database라는 이름의 DB의 table이라는 TABLE 허용
	4.  `GRANT ALL PRIVILEGES ON database.* TO ‘newusername’@‘%’` database라는 DB의 모든 TABLE 허용
