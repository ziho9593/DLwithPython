## Chapter 11. CollectionView & Animation: 원피스 현상금 랭킹 앱을 더 풍부하게

<p align="center"><img src=https://user-images.githubusercontent.com/62165123/122205945-c7317900-cedb-11eb-93eb-5084fbcba349.gif width="24%"> <img src=https://user-images.githubusercontent.com/62165123/122206263-21323e80-cedc-11eb-996a-2d36ec65244c.gif width="24%"> </p>

### CollectionView
- 여러 개의 아이템을 보여주는 형식 (한 행에 여러 아이템 표현 가능)
- List를 표현하기 위해 사용하는 TableView의 한계 극복 (TableView는 하나의 열만 표현 가능)
- 각 데이터는 CollectionViewCell을 통해 표현
- UITableView에 비해 데이터의 나열이 자유롭기 때문에, 많은 아이템을 보여주기 위해서 CollectionView를 항상 고려
- CollectionView는 UICollectionViewLayout이라는 객체를 상속받아 커스텀하여 사용
- UICollectionViewFlowLayout은 기본적으로 제공해주는 레이아웃 객체
- Datasource & Delegate 프로토콜을 이용해 CollectionView 사용에 필요한 코드 작성
- Protocol은 어떤 서비스를 이용하기 위해서 해야할 일

### Animation
- 시간에 따라, 뷰의 값 또는 상태가 바뀌는 것
- 딱한 사용성 개선, 몰입도 향상 등의 효과를 가져올 수 있음
- Animaiton을 구성하는 3가지 요소: 시작, 끝, 시간
- Animation API  
    - UIView.animate(  
    &nbsp;&nbsp;&nbsp;&nbsp;    withDuration: 1.0,   
    &nbsp;&nbsp;&nbsp;&nbsp;    animations: {  
    &nbsp;&nbsp;&nbsp;&nbsp;        layoutIfNeeded()  
    &nbsp;&nbsp;&nbsp;&nbsp;    }  
    )
- 기본적으로 constraints를 이용해 애니며이션 효과를 만들 수 있음

### 뷰 속성을 이용한 Animation
- Animatable View Properties - 3 Categories
    - Position & Size: bounds, frame, center
    - Transformation: rotation, scale, translation
    - Appearance: backgroundColor, alpha
- autoLayout과 겹치지 않도록 주의하여 사용해야 함