---
layout: post
title: Jekyll Post Create ShellScript
image: 2023-06-05_01.png
date: 2023-06-05
tags: [Jekyll, Ruby, Git]
categories: Devlog
---
# ShellScript로 포스팅 만들기   
<br>

<!-- ![문서제목에 맞는 사진](../images/2023-06-05_01.png) -->

# 1. 개요
---
Jekyll을 사용하면, _post폴더 내에 일정한 양식대로 md(markdown)파일을 작성해야 한다.   
해당 반복작업을 줄이기 위해 ShellScript로 작성된 스크립트를 작성하였다.   
<br>

# 2. 내용   
---
## 2.1 ShellScript Code

<!-- 코드시작 -->
<details>
<summary>코드접기/펼치기</summary>
<div markdown="1">
{% highlight shell %}
#!/bin/bash

# Colors and styles
Green='\033[0;32m'
Blue='\033[0;34m'
ColorReset='\033[0m'
bold=$(tput bold)
normal=$(tput sgr0)

echo -e "${Blue}${bold}Script to create new Jekyll posts easily.${normal}${ColorReset}"

# The post directory
POSTS_DIR='./_posts/'

# Post title
# Trim leading spaces
read -rp "${bold}Title:${normal} " -a TITLE
TITLE="$(echo "${TITLE[@]}" | sed -e 's/^[ \t]*//')"

# Date
DATE=$(date +%Y-%m-%d)

# Post extension
EXT='.md'

# File name
# read -p "${bold}Filename:${normal} " FILENAME

# File name should be lowercase
FILENAME=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
FILENAME=${DATE}-${FILENAME}${EXT}

# Go to _posts and create a file
cd ${POSTS_DIR}
touch ${FILENAME}

# Add YAML front matter and excerpt space
# (해당부분은 각자의 Jekyll 테마에 맞추어 변경이 필요하다.)
tee -a $FILENAME >/dev/null <<END   
---
layout: post
title: ${TITLE}
image: ${DATE}
date: ${DATE}
tags: 
categories:
---
# ${TITLE}

![문서제목에 맞는 사진](${DATE})

<br>
# 1. 개요
---
개요본문   

<br>
# 2. 내용
---
## 2.1 내용하위제목   
내용본문   

END

echo -e "${Green}${bold}File was successfully created!
❯${ColorReset}${normal} ${POSTS_DIR}${FILENAME}"

{% endhighlight %}
<summary>코드접기/펼치기</summary>
</div>
</details>


<br>
## 2.2 **작업내용**
기존의 코드를 그대로 쓸수가 없었기 때문에 YMAL Front Matter와 본문의 구성을 테마에 맞추어 변경해주었다.   
또한, Title을 입력받아 그대로 파일이름으로 적용하도록 하였으며,   
BackSpace와 Space를 입력받았을 때 제대로 작동하지 않는 문제를 해결하였다. (정규화)   

한계점 : Sh에서는 기본적으로 정규화가 쉽지만, 한글을 입력받게되면 정규화가 어렵다.   
화살표키를 처리하지 못하는 문제가 있다.

<br>
# 3. **기타문서**
---
## 3.1 Reference
해당내용은 [Jay님의 블로그](https://otzslayer.github.io/%EA%B8%B0%ED%83%80/2021/11/15/jekyll-post-generator-script.html)의 코드를 베이스코드로 수정하였다.