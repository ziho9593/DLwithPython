# Chapter 02. Flutter 실전 앱 제작

### 데이터베이스(DB)
- 앱 사용에 필요한 데이터를 저장하고 관리할 수 있는 기능
    - Table: 데이터를 저장하는 표(구조)
    - Column: 데이터 카테고리
    - Row: 데이터

### 패키지(Packages)
- 다른 개발자, 공식 개발팀들에 의해 개발된 코드로 직접 개발 없이 기능을 재사용할 수 있도록 제공
    - 플러터 패키지 모음 사이트: [pub.dev](https://pub.dev)
    - 사용 방법: pubspec.yaml 파일 내에 사용하는 패키지 이름과 버전을 명시

### 에셋(Asset)
- 애플리케이션 개발 내에서 사용하는 이미지 영상, 폰트 등 필요한 요소
- 사용 방법
    - pubspec.yaml 파일 내 'asset:' 항목에 필요한 파일 이름 입력
    - 특정 파일을 추가할 경우: asset/img/이미지.png
    - 폴더 내의 전체 에셋을 추가할 경우: asset/img (img 폴더 내 모든 에셋을 추가)

### OPEN API
- API(Application Programing Interface)
    - 소프트웨어 개발 및 통합에 사용되는 기능 집합체
    - API를 통해서 다른 소프트웨어에서 제작한 기능을 접근해 사용할 수 있음
    - 다른 앱에서 카카오톡의 메시지 전송하기, 로그인하기 기능을 사용할 수 있는 이유도 카카오에서 해당 기능을 API로 제공하기 때문
- Open API
    - 누구나 사용할 수 있도록 오픈한 API
    - 공공데이터 포털에서 제공하는 미세먼지, 날씨 예측 정보
    - 카카오톡, 페이스북, 인스타그램도 다양한 형태의 OPEN API를 제공
- RESTful API (Representational State Transfer)
    - HTTP METHOD(GET, POST, PUT, DELETE) 형태로 제공하는 API 형₩태
    - 웹페이지 호출을 통해 API를 제공함

### JSON(Javascript Object Notation)
- Key-Value 형태를 가진 데이터 형태
- 플러터의 Map과 유사함
- REST API 데이터에 사용

### Shared Preference
- 데이터베이스에 저장하지 않고 내부 다른 저장송 저장할 수 있는 기능
- 사용자 설정 정보를 저장하기 용이함
- 사용자 위치 정보를 저장할 때 사용할 수 있음