# Colors and styles
$Green = [System.ConsoleColor]::Green
$Blue = [System.ConsoleColor]::Blue
$White = [System.ConsoleColor]::White

Write-Host "`nScript to create new Jekyll posts easily." -ForegroundColor $Blue

# The post directory
$POSTS_DIR = './_posts/'

# Post title
$title = Read-Host -Prompt 'Title'

# Trim leading spaces
$title = $title.TrimStart()

# Date
$date = Get-Date -Format "yyyy-MM-dd"

# Post extension
$EXT = '.md'

# File name should be lowercase
$filename = $title.ToLower()
$filename = $filename.Replace(" ", "_")
$filename = "${date}-${filename}${EXT}"

# Go to _posts and create a file
Set-Location $POSTS_DIR
New-Item $filename -ItemType File

# Add YAML front matter and excerpt space
# (해당부분은 각자의 Jekyll 테마에 맞추어 변경이 필요하다.)
$yaml = @"
---
layout: post
title: ${title}
image: ${date}
date: ${date}
tags: 
categories:
---
# $title

![picture](${date})

<br>
# 1. Abstract
---
Summary   

<br>
# 2. Heading
---
## 2.1 Sub Heading   
Main Contents   

"@

$yaml | Out-File -FilePath $filename -Encoding utf8

Write-Host "File was successfully created!" -ForegroundColor $Green
Write-Host "❯ ${POSTS_DIR}${filename}" -ForegroundColor $White
Set-Location ..
