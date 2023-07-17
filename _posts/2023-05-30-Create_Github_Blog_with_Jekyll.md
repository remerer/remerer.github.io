---
layout: post
title: Github Pages를 이용한 Jekyll Blog
image: ./2023-05-30/banner.png
date: 2023-05-30
tags: [Jekyll, Ruby, Git]
categories: Devlog
---
# Github Blog 만들기 (w. Github pages, Jekyll)

<!-- ![문서제목에 맞는 사진](2023-06-05) -->

<br>
# 1. 개요
---
github pages에 Jekyll 테마를 적용하여 Blog 만들기

<br>
# 2. 과정
---
## 2.1 Github Pages개설   
Github에 접속하여, 새로운 Repository[이하 Repo]를 하나 생성한다.   
해당 사이트명은 github pages와 github.io도메인을 사용하기 위해서,   
{아이디}.github.io 의 이름으로 생성하는것을 추천한다.   
![]({{site.baseurl}}/images/2023-05-30/1.png)    
그 후, 해당 Repo의 Setting에서 Pages탭으로 들어가, 공개할 페이지의 브랜치를 선택한다.   
일반적으로 main브랜치를 많이 사용하지만, 다른 브랜치를 생성하더라도 무관하다.   
이후 로컬로 Repo를 Clone   

<br>
## 2.2 Ruby 다운로드
Jekyll[이하 지킬]을 사용하기위해 Ruby를 다운로드하여 설치한다.
[Ruby_Installer 다운로드][ruby-installer] 가급적 최신의 버전을 사용하기를 권장한다.
다만, 특정 테마와 호환되지 않을수 있으니 주의
설치 후 Ruby Installer 가 자동으로 실행되는데, 사용하고자 하는 테마가 어떤 확장을 사용할 지 모르니 권장하는데로 1,3번을 설치하였다.
![]({{site.baseurl}}/images/2023-05-30/2.png)
전부 설치되고 나면 다시한번 ENTER를 입력하여, 프로그램을 종료한다
   
VSCode 및 터미널을 한번 재시작한 후, 터미널에 gem을 입력하여 오류가 뜨지 않으면 성공   
   
<br>
## 2.3 Jekyll Library 다운로드
해당내용은 [지킬 공식 페이지][jekyll-publish]의 Quick-Start를 참고하면 된다
{% highlight bash %}
~ $ gem install bundler jekyll  #bundler와 Jekyll설치
{% endhighlight %}
   
<br>
## 2.3 Thema 선택하기
아래의 사이트들 중에서 다운로드, 혹은 개인이 원하는 테마의 Git Repo를 Clone하여 저장한다.
1. [jekyllthemes.org][http://jekyllthemes.org/]
2. [jekyllthemes.io][https://jekyllthemes.io/free]
3. [jekyll-themes.com][https://jekyll-themes.com/free]
4. [Github Topics][https://github.com/topics/jekyll-theme]   
이 외에도 수많은 무료/유료 테마들이 있으니 보고 원하는것을 선택한 뒤에   
둘 다 생성한 {아이디}.github.io 폴더를 루트로 하여 압축해제 or Clone하면된다.
   
<br>
## 2.4 사용된 Package설치 및 서버실행확인
로컬로 서버를 구동하는 코드
{% highlight bash %}
~ $ bundle exec jekyll serve
{% endhighlight %}   
(jekyll serve로도 실행되지만, github pages와 같은상황에서 실행할 수 있도록 하기위해)   
다만, 대부분의 테마의 경우 설치된 버전이 다르거나 하는 문제가 있을 수 있다.   
이경우 루트폴더의 Gemfile.lock을 삭제한 뒤 최신버전에 맞게 설치하는것으로 대부분의 문제를 해결할 수 있다.
{% highlight bash %}
~ $ bundle install
{% endhighlight %}
이후 다시 jekyll serve를 실행한 뒤, 브라우저로 [로컬호스트:포트4000][localhost]으로 접속하면 설치된 테마를 확인할 수 있다.   
해당서버는 Ctrl+C로 종료할 수 있다.

<br>
## 2.5 나에게 맞도록 초기 config세팅
대부분의 테마는 _config.yml파일을 참조하여, 초기세팅을 설정하도록 하고있다.   
다만 각각의 양식이 다르므로 해당파일의 주석과 실제 페이지에 나타난 정보들을 바탕으로,   
본인의 내용들로 바꾸어 주면된다.
![]({{site.baseurl}}/images/2023-05-30/3.png)
이 후 최종적으로 원격 Repo로 Push하게되면, 수 분 이내 서버가 구동된다.   
(해당 서버가 잘 Build되어 실행되는지는 해당 Repo의 Action탭에서 확인할 수 있다)   

[localhost]: http://127.0.0.1:4000
[jekyll-publish]: https://jekyllrb.com
[ruby-installer]: https://rubyinstaller.org/downloads/
[http://jekyllthemes.org/]: http://jekyllthemes.org/
[https://jekyllthemes.io/free]: https://jekyllthemes.io/free
[https://jekyll-themes.com/free]: https://jekyll-themes.com/free
[https://github.com/topics/jekyll-theme]: https://github.com/topics/jekyll-theme