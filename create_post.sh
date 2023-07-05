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
read -rp "${bold}Date${normal}(NULL==today): " -a DATE
if [ -z "${DATE[*]}" ]; then
  DATE=$(date +%Y-%m-%d)
fi

# Post extension
EXT='.md'

# File name should be lowercase
FILENAME=$(echo "$TITLE" | tr ' ' '_')
DIRNAME=${DATE}-${FILENAME}
FILENAME=${DATE}-${FILENAME}${EXT}

mkdir -p ./images/${DIRNAME}
# Go to _posts and create a file
cd ${POSTS_DIR}
touch ${FILENAME}


# Add YAML front matter and excerpt space
# (해당부분은 각자의 Jekyll 테마에 맞추어 변경이 필요하다)
tee -a $FILENAME >/dev/null <<END   
---
layout: post
title: ${TITLE}
image: ${DIRNAME}/banner.png
date: ${DATE}
tags: 
categories:
---
# ${TITLE}

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