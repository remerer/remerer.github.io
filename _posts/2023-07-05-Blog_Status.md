---
layout: post
title: Blog 진행상황
image: 2023-07-05-Blog_Status/banner.png
date: 2023-07-05
tags: [Jekyll, Ruby, HTML]
categories: Blog
---
# Blog 진행상황

<br>

# 1. Blog 개발 중 문제점 발견
---

## 1.1 Git Bash 터미널 사용
powershell을 버리고 bash(정확히는 git bash)터미널로 통합하여 사용하려고 한다.   
과정 중 '''jekyll serve'''가 동작하지 않는 문제가 발견되었는데   
git bash에서의 PATH(경로 환경변수)가 제대로 지정되지 않은 듯 하다.   

## 1.2 Category작동문제   
localhost에서는 포스트 별로 정해진 카테고리가 잘 작동한다.   
하지만 github pages에서 작동하지 않는데, gemfile에 필요한 라이브러리가 제대로 정의되지 않은것인지 확인해야 할 듯 하다.   

# 2. Blog 추후 개선예정
---   
   
## 2.1 헤더 별 접기 기본제공   
나무위키처럼 단락별 헤더를 접을 수 있도록 할까 고민중... 장단점이 있을듯?   
위키문서와 블로그의 장점을 둘다 수용할 수 있는 방법이면 더 좋을듯하다.   

## 2.2 목차 개선   
TOC(Table of Contents)를 집어넣었는데, 현재 깔끔하지가 않다.   
상단에 표시되어도 되고, 우측 고정방식으로 표시해도 되는데 현재는 상단에 깨져서 나오는 중.   
가장 우선적으로 개선할 예정.