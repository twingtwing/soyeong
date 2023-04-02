# 🏨 Soyeong Hotel
> **숙소 공유 플랫폼 서비스**  
> 사용자들끼리 숙소를 공유할 수 있는 공유플랫폼 서비스

</br>

## 1. 제작 기간 & 참여 인원
- 2022년 2월 08일 ~ 3월 22일
- 팀 프로젝트 (4명)

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 11
  - Spring 5.3
  - Maven
  - My Batis
  - Oracle DB
#### `Front-end`
  - Javascript
  - jQuery
  - JSP
  - Bootstrap 4

</br>

## 3. ERD 설계

![ERD](https://user-images.githubusercontent.com/86578586/226563408-48610667-818f-4d0f-8496-88df24ae87f6.png)

## 4. 핵심 기능
이 서비스의 핵심 기능은 숙소 등록 기능입니다.  
호스트는 숙소이미지, 숙소 설명을 입력하기만 하면 됩니다.
이 단순한 기능의 흐름을 보면, 서비스가 어떻게 동작하는지 알 수 있습니다.  

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![전체흐름도](https://user-images.githubusercontent.com/86578586/226786355-dec96cc5-41fc-404b-9dca-9ec492029d87.png)

### 4.2. 사용자 요청 :pushpin: [코드 확인](https://github.com/twingtwing/soyeong/blob/master/src/main/webapp/WEB-INF/views/host/hostInsertForm.jsp)
![image](https://user-images.githubusercontent.com/86578586/226788889-77a43bf2-4d55-4a3d-beab-fa60a192fd81.png)

- **유효성 체크 / 등록 요청** : 사용자가 등록한 정보를 모두 확인한 후, 숙소 등록 요청을 POST로 보냅니다.

### 4.3. Controller :pushpin: [코드 확인](https://github.com/twingtwing/soyeong/blob/master/src/main/java/co/kids/prj/lodging/web/LodgingController.java)

![Controller](https://user-images.githubusercontent.com/86578586/226790346-3ad9d92e-5484-4356-b895-38ffb611e1ae.png)

- **다중 파일 저장** : 다중 파일을 저장하기 위해 MultipartFile 매개변수를 이용하여 저장하였습니다.

- **요청처리** : Controller에서는 요청을 화면단에서 넘어온 요청을 받고, Service 계층에 로직 처리를 위임합니다.

### 4.4. Mapper :pushpin: [코드 확인](https://github.com/twingtwing/soyeong/blob/master/src/main/java/co/kids/prj/lodging/service/lodging-map.xml)

![Mapper](https://user-images.githubusercontent.com/86578586/226791023-bbe116e4-94d4-4725-8953-de700dd4a72a.png)

- **숙소 저장** : 유효성 체크 후에 저장된 데이터는 다시 Repository - Service - Controller를 거쳐 화면단에 송출됩니다.

</div>
</details> 
