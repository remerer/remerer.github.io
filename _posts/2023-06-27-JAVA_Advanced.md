---
layout: post
title: JAVA Advanced
image: 2023-06-27-JAVA_Advanced/banner.png
date: 2023-06-27
tags: JAVA
categories: Back-end
---
# JAVA Advanced

<br>
# 1. 개요

---

자바(JAVA)에서 다른언어를 배울 때 익히지 못하거나, 특별히 다른 개념/문법들 정리   
<br>   
<br>

# 2. 내용
---

## 2.1 Interface, Lambda, Generic, Stream, Optional

자바에서 다른 언어에는 없거나 조금 다르게 작동하는 개념들

### 2.1.1 Interface

자바에는 Class에서 다중상속을 지원하지 않는다. 이는 다이아몬드 상속문제의 모호함을 피하기 위함이다. 따라서 Interface(인터페이스)라는 추상형식을 사용해 프로그래밍에 유연함을 더한다. JAVA의 인터페이스는 다른 언어(C++)의 클래스와 같이 다중상속이 가능하지만, JAVA의 클래스는 다중상속을 지원하지 않는다.

**인터페이스의 특징**

1. **순수한 추상형식 (Pure Abstract)** : 인터페이스는 추상형식의 집합으로, 추상 메서드 들의 집합이다. 이는 인터페이스에서 메모리 할당이나 논리식과 같이 공간과 연산이 필요한 작업을 하지 않는다는 것을 의미한다.
2. **상수 선언** : 다만, 상수의 선언은 가능하다.
<details>
<summary> 인터페이스 예제코드 (GPT작성)</summary>    
{%highlight java%}
    // 다중 상속을 지원하는 인터페이스 정의
    interface Walkable {
        void walk();
    }
    
    interface Swimmable {
        void swim();
    }
    
    // 인터페이스를 구현한 클래스
    class Human implements Walkable, Swimmable {
        public void walk() {
            System.out.println("Walking...");
        }
        
        public void swim() {
            System.out.println("Swimming...");
        }
    }
    
    // 메인 클래스
    public class Main {
        public static void main(String[] args) {
            // 인터페이스를 구현한 객체 생성
            Human person = new Human();
            
            // 인터페이스를 통한 메서드 호출
            person.walk();
            person.swim();
        }
    }
{%endhighlight%}   
   
</details>   
<br>   

### 2.1.2 Lambda

Lambda(람다)식은 간단한 대소비교 식 등을 별도의 매소드(함수)작성없이 일회용 함수를 만들어 사용가능하게 한다. 코드의 가독성을 증가시키지만, for문이나 재귀함수같은 반복시 매번 함수를 생성해야하므로, 리소스의 낭비가 크다. 다른 언어의 람다함수작성법과 유사

### 2.1.3 Generic

Generic은 타입을 지정하지 않음으로서 매서드와 파라미터의 재사용성을 높이는 형식지정자(=타입 매개변수, 타입 파라미터)이다. 타입 매개변수명 **T**를 일반적으로 사용하며, Python이나 let과 같이 변수,매서드,클래스의 타입을 **알아서 지정해주는것이 아닌**, 명시적으로 선언하여 호출한 뒤 명시적으로 반환받는다.

<details>
<summary> 제네릭 예제코드 (GPT 작성) </summary>
    
{% highlight java %}
    // Generic 클래스 선언
    class Box<T> {
        private T item;
    
        public void setItem(T item) {
            this.item = item;
        }
    
        public T getItem() {
            return item;
        }
    }
    
    // Generic 메서드 사용
    class Main {
        public static <T> void printItem(Box<T> box) {
            T item = box.getItem();
            System.out.println("Item: " + item.toString());
        }
    
        public static void main(String[] args) {
            // Integer 타입을 갖는 Box 생성
            Box<Integer> integerBox = new Box<>();
            integerBox.setItem(123);
    
            // String 타입을 갖는 Box 생성
            Box<String> stringBox = new Box<>();
            stringBox.setItem("Hello, World!");
    
            // Generic 메서드 호출
            printItem(integerBox);
            printItem(stringBox);
        }
    }
{% endhighlight %}
    
    결과적으로, Box클래스를  Int타입과 Str타입 모두에서 사용할 수 있다.
</details> 
<br>

### 2.1.4 Stream

### 2.1.5 Optional
