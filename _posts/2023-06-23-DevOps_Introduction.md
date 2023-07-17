---
layout: post
title: DevOps 개론
image: 
date: 2023-06-23
tags: 
categories: DevOps
---
# DevOps 개론
   
<br>   

# 1. 개요
---
DevOps는 개발+  운영의 합성어 이다. 하지만, 신속한 서비스의 출시를 위해 팀의 통합과 개발-배포 및 프로젝트 전반과정을 자동화, 안정화, 신속화하는 인프라(팀구조, 개발환경, 의사결정 과정 등) 전체를 구축하는 것을 의미

<!-- ![](https://d1.awsstatic.com/product-marketing/DevOps/DevOps_feedback-diagram.ff668bfc299abada00b2dcbdc9ce2389bd3dce3f.png) -->


<br>   

# 2. DevOps   
---   
## 2.1 DevOps Process  
![](https://engineering.linecorp.com/wp-content/uploads/2021/04/lineadsdevops1.png)
DevOps는 상기 7단계의 과정을 자동화되고 간략한 프로세스로 만드는 것을 목표로 한다. 각 과정은 다음과 같다.    

**기획(Plan)** : 서비스가 구상되기 위한 아이디어를 모으고, 개발하려는 서비스를 정의함    

**개발(Code)** : 필요한 서비스를 개발함. Git과 같은 버전관리시스템을 사용하여, 마스터/개발 브랜치를 나누고, 기능별로 브랜치를 나누어 각각 개발하여 배포함    

**빌드(Build)** : 적절하게 개발단계가 완료되어 테스트해 볼 상태가 되었다고 판단되면, 서비스가 실행가능하도록 하나의 브랜치로 모은 뒤 빌드    

**테스트(Test)** : 빌드된 서비스가 정상적으로 작동하는지 자동화된 테스트코드를 통과하는지 파악. 필요시 수동테스트 과정을 포함    

**적용(Release)** : 테스트에서 문제가 발견되지 않으면 마스터브랜치에 적용하고, 실 사용할 수 있도록 서비스 준비를 함     

**서비스/배포 & 운영(Deploy & Operate)** : 서버에서 구동(웹 서비스, API 등)하거나 파일을 배포(애플리케이션)하는 등 서비스 특성에 따라 사용자가 사용할 수 있도록 공개하고 안정적인 서비스를 제공 할 수 있도록 서버 제공 및 서비스 구동 

**모니터링(Monitor)** : 운영 중 예기치 못한 동작이나 버그가 없는지 파악하고, 문제가 있는경우 이슈를 열어 추가적인 개발 및 패치가 가능하도록 함 [개발로 연결]  

<br>

## 2.2 DevOps 장점   
   
**- 속도**
> 프로젝트의 개발, 배포속도가 빨라져 시장상황 및 주변환경에 더 잘 대처할 수 있다. 
>   

**- 신속성, 안정성**
> 프로세스 자동화를 통해, 신기능은 빠르게 배포되고, 결점 및 버그 또한 빠르게 패치될 수 있다. 이를 통해 서비스는 더욱 더 안정적으로 운영 될 수 있다.
>
 
**- 확장성**
> DevOps는 마이크로서비스 개념을 중요시 생각한다. 부분적으로 개발하여 전체 서비스를 완성시키는 방향으로, 기존에 개발된 서비스가 새로운 기능의 추가와 독립적으로 이루어 진다.
>    

<br>   

## 2.3 DevOps 주요개념
### CI/CD
지속적통합(Continuous Integration), 지속적배포(Continuous Delivery)를 의미하는 CI/CD는 DevOps의 핵심개념이다.  
개발된 내용을 Master에 Commit하면, 자동화를 통해 Test Code를 실행하여 결과를 확인하고 통과되면 배포하는 과정까지가 CI/CD이기 때문에 DevOps가 추구하는 방향성과 가장 밀접하다.   
   
CI, CD에 관한 내용은 다음 문서를 참고할 수 있다.   
   
[[AWS] 지속적 통합](https://aws.amazon.com/ko/devops/continuous-integration/)   
[[AWS] 지속적 배포](https://aws.amazon.com/ko/devops/continuous-delivery/)   
### Micro Service
### 코드형 인프라
### 모니터링 및 로깅
### 커뮤니케이션 및 협업

<br>


# 3. 참고문서
---
[[AWS] DevOps란 무엇입니까?](https://aws.amazon.com/ko/devops/what-is-devops/)  
[[LINE Engineering] LINE 광고 서버 개발 팀의 DevOps 문화](https://engineering.linecorp.com/ko/blog/line-ads-devops-culture)