# SQL Unique 제약

## 생성하기
```sql
CREATE TABLE Persons
(
    ID int NOT NULL,
    Name varchar(255) NOT NULL,
    CONSTRAINT uc_PersonID UNIQUE (ID)
)
```

## 업데이트로 설정
```sql
ALTER TABLE Persons
ADD CONSTRAINT uc_PersonID UNIQUE (ID)
```

## Uniqe 제약 제거
```sql
ALTER TABLE Persons
DROP CONSTRAINT uc_PersonID
```

> PRIMARY KEY 제약은 자동적으로 UNIQUE 제약이 설정됨
> UNIQUE 는 한 테이블에 여러개를 지정할 수 있음
> PRIMARY KEY 제약은 오로지 1개 만 지정할 수 있음