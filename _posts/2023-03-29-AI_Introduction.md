---
layout: post
title: AI Introduction
image: 2023-03-29/banner.png
date: 2023-03-29
tags: [AI, DeepLearning]
categories: AI
---

# 인공신경망(AI) 학습

# 학습사이트

---

주요개념,단어 설명 : [https://www.alsemy.com/post/loss-landscape를-여행하는-연구자를-위한-안내서](https://www.alsemy.com/post/loss-landscape%EB%A5%BC-%EC%97%AC%ED%96%89%ED%95%98%EB%8A%94-%EC%97%B0%EA%B5%AC%EC%9E%90%EB%A5%BC-%EC%9C%84%ED%95%9C-%EC%95%88%EB%82%B4%EC%84%9C)

학습과정 개론([링크](https://kunnys-mysterybox.blogspot.com/2023/03/stable-diffusion.html)) (Blog : Kenny’s Mystery Box)

학습과정 개론([링크](https://www.youtube.com/watch?v=dVjMiJsuR5o)) (Youtube) ****😕LoRA vs Dreambooth vs Textual Inversion vs Hypernetworks****

Hugging Face : 최대규모의 AI모델 공유 사이트. 관련 내용 [Docs](https://huggingface.co/docs)제공

- Diffusers : [https://huggingface.co/docs/diffusers/quicktour](https://huggingface.co/docs/diffusers/quicktour)
- Accelerate : [https://huggingface.co/docs/accelerate/usage_guides/deepspeed](https://huggingface.co/docs/accelerate/usage_guides/deepspeed)
- [Text2Img] Stable Diffusion v2.1([링크](https://huggingface.co/stabilityai/stable-diffusion-2-1)) / v1.5([링크](https://huggingface.co/runwayml/stable-diffusion-v1-5))

Riffusion : Stable Diffusion → Audio생성 ([링크](https://velog.io/@nellcome/Riffusion4))

폰트생성 ai ⇒ textual inversion (**font라는 단어 학습) ⇒ Dreambooth (font만 생성하는 ai로 전환) 

모델이 다른 모양 생성을 못하면 ⇒ 과적합

LoRA가중치 줄이거나, Total Steps를 줄이거나, 학습률 낮추어 학습량을 줄임

---

# Fine-Tuning (가중치 미세조정 = 추가학습)

이미 학습되어있는 모델의 파라미터를 조정하여, Loss를 줄임

보편화된 방법 : Dreambooth / Textual Inversion / LoRa / Hypernetworks

## Dreambooth

![Untitled](%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%80%E1%85%A9%E1%86%BC%E1%84%89%E1%85%B5%E1%86%AB%E1%84%80%E1%85%A7%E1%86%BC%E1%84%86%E1%85%A1%E1%86%BC(AI)%20%E1%84%92%E1%85%A1%E1%86%A8%E1%84%89%E1%85%B3%E1%86%B8%20b086703ea5d545fa962d6757f0e73e95/Untitled.png)

Dreambooth는 단 몇 장의 이미지로 이미 학습된 모델에 새로운 개념을 추가하는 가장 효과적인 방법입니다.

모델 전체의 가중치를 미세 조정합니다.

하지만 모델 전체를 수정하기 때문에 새로운 ckpt 파일이 만들어 집니다.

stable diffusion의 ckpt 파일의 크기는 약 2~7GB로 디스크 용량을 많이 차지하는 단점이 있습니다.

## **Textual Inversion**

![https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxnCocCfid34B-jEO7iFMjBAxq3IKl0LEzk2PGb2nUL8QTEX5AofGWqR1lTy3Cf8iDEn9pNZyrP0XsWXdQDAR2QQVLWGePhZHtCWX42hpWaTzE7gQr9Q29i8l4AFtNsH-Wvs0dl3crrRhctJLRDxzrPE_wah-wt-jG-an2fWTGkvjvDE6bCYw9MSNy/w640-h510/textual%20inversion.png](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhxnCocCfid34B-jEO7iFMjBAxq3IKl0LEzk2PGb2nUL8QTEX5AofGWqR1lTy3Cf8iDEn9pNZyrP0XsWXdQDAR2QQVLWGePhZHtCWX42hpWaTzE7gQr9Q29i8l4AFtNsH-Wvs0dl3crrRhctJLRDxzrPE_wah-wt-jG-an2fWTGkvjvDE6bCYw9MSNy/w640-h510/textual%20inversion.png)

Textual Inversion은 텍스트 임베딩 부분을 수정해서 새로운 키워드를 정의합니다.

![https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi0YprtkDT7ZhqEG1yNxtb626sStzIjrnwEmdvUBn2ue7o9pW-d7s04JqjBnq_w6ja1HJTBCJ2Rd2MJn-mdnlB4LQ5d8o03LAvFduT8FEiX5gD83OHnkeZemmhdtNz6C7S62yAGo8PjzVZrUBp4itD88IA0gNN9U69kERLGbK_aBTqe9jzLdH25UFsv/w640-h154/image-39.webp](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi0YprtkDT7ZhqEG1yNxtb626sStzIjrnwEmdvUBn2ue7o9pW-d7s04JqjBnq_w6ja1HJTBCJ2Rd2MJn-mdnlB4LQ5d8o03LAvFduT8FEiX5gD83OHnkeZemmhdtNz6C7S62yAGo8PjzVZrUBp4itD88IA0gNN9U69kERLGbK_aBTqe9jzLdH25UFsv/w640-h154/image-39.webp)

< 오브젝트 추가 예 >

![https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiT4QFwJvae1cTjlMeOFehfbExy52hYCgjp_hn0Vf9hhBiY4U7caXGFl0hH0IHIJnefwzgHznkt0JH4Mp-sBocHCfcyPK1dSVbAtnzRs5nNoRD4yZWXvYSqJ3CiwKdIkQb2AnSDYX2Em-LhmfgeB2kmTMYctTU7Oyt89DC59tFxpHNwZ0Grlkv_wKMJ/w640-h128/image-41.webp](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiT4QFwJvae1cTjlMeOFehfbExy52hYCgjp_hn0Vf9hhBiY4U7caXGFl0hH0IHIJnefwzgHznkt0JH4Mp-sBocHCfcyPK1dSVbAtnzRs5nNoRD4yZWXvYSqJ3CiwKdIkQb2AnSDYX2Em-LhmfgeB2kmTMYctTU7Oyt89DC59tFxpHNwZ0Grlkv_wKMJ/w640-h128/image-41.webp)

< 스타일 추가 예 >

모델을 변경하지 않고도 몇 장의 이미지 만으로 새로운 물체나 화풍을 추가 할 수 있습니다.

모델을 변경하지 않기 때문에 효과가 제한적 입니다.

임베딩 파일의 크기는 보통 100KB 미만으로 매우 작습니다.

## **LoRa**

![https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8KRUWtNPd6GIMXMPspfrUTmYtiAnLcfLf54eBEo8mavdR6yR9DV-1IQGBlWPWn8muTJrVTYDzupuCqJiWX4BNVG1lM5oYuoiX4zhgO4Ba49SkLVrAmIOtTMSm02sz5-Enhu1-7eOKieILonynaYKrGYVOLfMCvwrePcsg9CvoDCtYtNAQhmv2d2yG/w640-h510/lora.png](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8KRUWtNPd6GIMXMPspfrUTmYtiAnLcfLf54eBEo8mavdR6yR9DV-1IQGBlWPWn8muTJrVTYDzupuCqJiWX4BNVG1lM5oYuoiX4zhgO4Ba49SkLVrAmIOtTMSm02sz5-Enhu1-7eOKieILonynaYKrGYVOLfMCvwrePcsg9CvoDCtYtNAQhmv2d2yG/w640-h510/lora.png)

lora는 모델에서 가장 중요한 부분인 프롬프트와 이미지가 만나는 부분을 수정합니다.

모델 전체를 수정할 때 보다는 못하지만 작은 변화로 큰 효과를 볼 수 있습니다.

모델을 직접 수정하기 때문에 Textual Inversion보다 훨씬 뛰어납니다.

수정된 부분만 별도의 파일로 저장하며, ckpt 파일과 함께 사용해야 합니다.

파일의 크기는 2~200MB 입니다.

## **Hypernetworks**

![https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhLU11kAdgIuko6w0gi89YpMb3m6c9XfpNzxac0zcY44SDBBYFAKAADFfdzORDC0N85uAJ0iCAvVVsXuNo4D3P60-6X8TCANlMMQK7RL8irgB1QDNG7W96yeoYpgCLrllDvZ4wBVo_auvOV7haFPfs1cvtalzEXstqb7sp3ovJtCpsspDP9YjmjLtsE/w640-h510/hypernetworks.png](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhLU11kAdgIuko6w0gi89YpMb3m6c9XfpNzxac0zcY44SDBBYFAKAADFfdzORDC0N85uAJ0iCAvVVsXuNo4D3P60-6X8TCANlMMQK7RL8irgB1QDNG7W96yeoYpgCLrllDvZ4wBVo_auvOV7haFPfs1cvtalzEXstqb7sp3ovJtCpsspDP9YjmjLtsE/w640-h510/hypernetworks.png)

Hypernetworks는 모델의 노이즈 제거 U-Net에 연결되는 추가 네트워크입니다.

모델을 변경하지 않고 모델을 미세 조정하는 것이 목적입니다.

모델을 변경하지 않기 때문에 효과가 제한적입니다.

파일 크기는 일반적으로 약 5~200MB입니다.

---

FNN : 입력층 → 은닉층 → 출력층

LSTM : 입력게이트 → 삭제게이트 → 출력게이트 → (출력+새 입력) →입력게이트

신뢰도는 Softmax함수를 이용

<aside>
❓ - 순방향신경망(FNN)의 학습데이터에 각각 시간을 넣어, 양방향신경망과 비슷하게 작동하면서도 시간적으로 우수한 알고리즘 동작이 가능할 수 있음(주식 등)
- 신경망 구조를 동적으로 구성하여, 동적신경망구조를 활용시에도 더욱 우수한 결과물이 나올 수 있음(혹은 동적 파라미터를 활용할 수도있음)
- LSTM은 상대적으로 느리지만 하드웨어의 발전에 따라 금새 FNN을 대체할 수도 있음
{애초에 입력받는 데이터종류가 다르다고 생각할 수도 있지만(시퀀스-단일), 같은 데이터를 둘 다 입력받을수도 있다고 생각함}
- 머지않아 신경망(모델)을 설계하는 AI가 나올것이고, 그 AI의 조합들로 프로그램이 이루어질 수 있음(자동화 디자인이 아닌, 자연어→설계)

</aside>

데이터의 학습은 경사하강법으로 이루어짐

딥러닝 머신의 차이

> 근데 학습방법을 어떻게하는지
데이터를 존나늘렸다던지
강화학습을 추가로 적용했다든지
프롬프트엔지니어링을 얼마나 잘했는지
전처리를 얼마나 잘했는지
> 

강화학습 vs 파인튜닝

파인튜닝 : 사전학습모델 - 트랜스포머

다른점 : 학습방법

트랜스포머 : 인코더 - 디코더

인코더 : NLU를 잘함 (기반 : BERT)

디코더 : NLG (기반 : GPT)

BERT : 트랜스포머(인코더기반) - MLM / NSP로 학습 (사전학습과정)

MLM : 빈칸추론

NSP : 다음문장추론

모델 : 사전학습 - input text + label로 학습

(내가 타겟으로 하는 task를 풀게 미세조정 → fine tuning)

GPT는 language modeling이라는 loss사용 (현재토큰 → 다음토큰 추론)

여기서 Loss함수는 이전토큰을 현재토큰으로 추론해서 실제현재토큰과 같은지 비교하여 점수로 학습시킴

GPT는 사람 답변을 HumanFeedback으로 쓰고 GPT가 그걸 다시 사용해서 학습

LSTM은 과거데이터를 잘 기억못함

RNN해결하려고 -LSTM나오고 - Attention나오고-Transformer나옴

NLP과정 학부생들 털림(OpenAI한테 돈으로)

모델 인퍼런스하는 과정이 힘듦(리소스)

---

# 3.1 참고자료
## 3.1.1 Font Generating

[Youtube - SD Text효과](https://www.youtube.com/watch?v=TBq1bhY8BOc)   
   
## 3.1.2 Diffusiers   
<br>   

## 3.1.3 기타 토론   
<br>   

### DeepLerning for Strecth1

퍼셉트론 → nand → 인공신경망

신경망 구조(입력, 은닉 출력) 그림

(?) 활성화 되지않는 노드를 비활성화하고 다른 노드를 추가하여 모델의 크기를 줄이고 효율을 높임 = h()의 약할

![Untitled](%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%80%E1%85%A9%E1%86%BC%E1%84%89%E1%85%B5%E1%86%AB%E1%84%80%E1%85%A7%E1%86%BC%E1%84%86%E1%85%A1%E1%86%BC(AI)%20%E1%84%92%E1%85%A1%E1%86%A8%E1%84%89%E1%85%B3%E1%86%B8%20b086703ea5d545fa962d6757f0e73e95/Untitled%201.png)