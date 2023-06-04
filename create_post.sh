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

# 1. 개요
---
개요본문

# 2. 내용
---
## 2.1 내용하위제목
내용본문

END

echo -e "${Green}${bold}File was successfully created!
❯${ColorReset}${normal} ${POSTS_DIR}${FILENAME}"