---
layout: post
title: SQL Basic Grammar
image: 2023-06-26-SQL_Basic_Grammar/banner.png
date: 2023-06-26
tags: [SQL Query]
categories: DB
---

# SQL 기초 문법

<br>

# 1. SQL사용시 기초

---

## 1.1 Hello world

SQL Query는 주어진 DB에서 원하는 데이터만 불러오기 위한 질의문(조건? 형식? 언어?)이다.  
스키마 ⊃ 테이블 ⊃ 컬럼(열, Column)로 속해있다고 보면 된다.  
모든 작명 및 명령어는 대문자로 이루어진다.

문법을 통해 특정 테이블로 불러오더라도,  
보여지지 않는 조건으로 정렬하거나 할 수 있다.

SQL Query는 DB에서 **어떤 데이터를 선택** 하고,  
어떤 데이터를 DB에서 추가/제거할지 결정하는 문법이라고 보면 된다.
<br>

# 2. SQL기초 문법

SQL문법을 조작하는 내용에 따라 조작어/정의어/제어어로 나눈다고 하는데,  
전체 문법수가 그리 많지 않으므로 따로 구분하지는 않으나, 순서대로 서술한다.  
문법의 구분기준을 간단히 보자면 다음과 같다.

> **데이터 조작어** : 데이터베이스에서 필요한 데이터를 추출하기 위해 가공하는 문법
>
> - SELECT, INSERT, UPDATE, DELETE

> **데이터 정의어** : 데이터베이스 <U>테이블</U>을 구성, 변경할때 사용하는 문법
>
> - CREATE, ALTER, DROP, RENAME

> **데이터 제어어** : 데이터의 검사, 보안, 무결성 등 관리/검사 목적으로 사용하는 문법
>
> - GRANT, REVOKE

## 2.1 SELECT & FROM

{%highlight sql%}
SELECT *
FROM ALPHABET abc 
{%endhighlight%}
필요한 내용들(컬럼 이름)을 선택하고, `SELECT`  
ALPHABET이라는 이름을 가진 테이블에서 불러온다는 의미`FROM ALPHABET`  
여기서, `*`는 전체 컬럼을 불러온다는 의미이므로,  
해당 질의어는 ALPHABET테이블 전체를 불러오게 된다.
abc는 ALPHABET테이블의 별칭으로 같은 의미를 가진다. 아래의 `AS`구문과 동일

### 2.1.1 ORDER BY

정렬기준을 선택할 수 있다.
**ASC**(순차정렬)과 **DESC**(역정렬)로 정렬할 수 있으며,  
정렬조건이 여러개라면 뒤의것부터 정렬한 뒤에 앞에것을 정렬한다.
다중정렬의 구분은 ```,(콤마)```로 한다.

{%highlight sql%}

> SELECT ANIMAL_ID, NAME, DATETIME  
> FROM ANIMAL_INS ORDER BY NAME ASC, DATETIME DESC
{%endhighlight%}

해당코드는 데이터를 DATETIME기준으로 정렬후에, 이름으로 정렬한다.  
(최종적으로는 이름으로 순차정렬. 이름이 같은 경우에만 날짜로 역정렬)

### 2.1.2 WHERE

기초수식을 조건으로 둘 수 있다.  
프로그래밍과 다르게 등치기호를 `=` 하나만 쓴다.
기초적인 대소비교 및 특정 값과의 비교가 가능하다.
다중조건은 ```AND```나 ```OR```로 묶어줘야 한다.

### 2.1.3 LIMIT

정렬갯수에 제한을 걸고싶을 때 사용
`LIMIT 10` 과 같이 사용하면 된다

### 2.1.4 AS & DISTINCT

**AS** : 컬럼명을 변경하고 싶을 때 사용.  
**DISTINCT** : 중복된 값을 제거하고 싶을 때.

{%highlight sql%}
SELECT COUNT(DISTINCT NAME) AS nameNum
FROM TABLE
{%endhighlight%}

중복된 ```NAME```을 제거한 개수를 nameNum 컬럼으로 제공

| count |
| :---: |
|  96   |

<br>

### 2.1.4 IFNULL   

해당 값이 NULL일때, 대체하여 입력할 값   
{%highlight sql%}
SELECT PT_NAME, PT_NO, GEND_CD, AGE, IFNULL(TLNO, 'NONE') AS TLNO
FROM PATIENT WHERE AGE <= 12 AND GEND_CD = "W" ORDER BY AGE DESC, PT_NAME ASC 
{%endhighlight%}

TLNO가 NULL일때, "NONE" 출력

*추가로, NULL값을 판단할때는 `=`가 아닌 IS를 사용해야 한다.

### 2.1.5 DATE_FORMAT

DATE_FORMAT(입력값, 출력형식 or 출력 TEXT)
출력형식은 "%Y-%M-%D", "%y/%m/%d", "%y년 %m월 %d일" 등으로 표기할 수 있다.   
해당 출력형식은 대소문자를 구분한다.   

### 2.2 JOIN
결합구문은 여러 테이블의 레코드를 조합하여, 하나로 표현할 수 있게 해준다.   
기본적으로 아래 네가지 결합을 규정한다.   
> INNER JOIN
> OUTER JOIN
> LEFT JOIN
> RIGHT JOIN

#### 2.2.1 CROSS JOIN   

교차조인은 곱집합을 반환한다.   
A 테이블의 각 행과 B 테이블의 각 행을 곱연산한 결과값을 반환한다.   
따라서, 결과 테이블의 행은 (A행 수*B행 수)가 된다.   

#### 2.2.2 INNER JOIN   

내부조인은 가장 흔한 결합방식으로, A와 B테이블에 일치하는 결과를 가진 것만 반환한다.   
{% highlight sql %}
SELECT *
FROM A INNER JOIN B
ON A.ID = B.ID;
{% endhighlight %}
A테이블의 ID와 B테이블의 ID가 일치하는 내용만 반환   
(일치하지 않으면 제외된다)   
> 테이블 1 INNER JOIN 테이블 2
> ON 일치조건(AND로 결합)
<br>
   
#### 2.2.3 OUTER JOIN

**LEFT JOIN & RIGHT JOIN**

왼쪽/오른쪽 조인은 외부조인의 종류로서, 해당하는 방향의 테이블을 최소 1번씩은 출력한다.   

**FULL OUTER JOIN**

완전 외부 조인은, 양측 테이블의 내용을 모두 최소 한번씩은 출력하게 하는 외부조인이다.   
모든 결과값을 반환하는 방식.(CROSS JOIN과는 다르다)   
일치하는 결과값이 없더라도, 해당 데이터는 NULL로 반환된다.   
결과 테이블의 행은, (A행 수 + B행 수 - 겹치는갯수)가 된다.

#### 2.2.4 GROUP BY

##### HAVING 조건문
HAVING은 SUM, COUNT등과 결합하여 GROUP된 집합에서 필터링 조건을 추가한다.

# 3. 참고자료

1. [PostgreSQL 키워드](https://www.postgresql.kr/docs/10/sql-keywords-appendix.html)
2. [MySQL 키워드](https://dev.mysql.com/doc/refman/8.0/en/keywords.html)
3. [Oracle 키워드](https://docs.oracle.com/cd/A97630_01/appdev.920/a42525/apb.htm)