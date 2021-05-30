## Chapter 09. 현상금 랭킹 앱

### UITableView
- 여러 아이템을 리스트 형태로 보여주기 위한 뷰
- 컬럼을 1개만 가지며, 데이터를 여러 행에 걸쳐 보여줌
- 각 데이터는 TableView cell을 통해 다양한 스타일로 표현
- Recycle cell: TableView는 cell을 재활용하여 데이터를 보여줌

### TableView를 위한 Protocol
- 테이블 뷰를 이용해 리스트를 표현하고자 할 때, 테이블 뷰가 질문을 함
    - '테이블 뷰 셀 몇 개?', '어떻게 보여줄까?' '클릭하면?' 등
    - 테이블 뷰는 다양한 상황에 어떻게 대응할지 물어보는 것이 많음
    - 테이블 뷰의 질문에 모두 답할 필요는 없지만, 최소 요건으로 '몇 개의 셀?'과 '어떻게 보여줄지?'는 필수로 답을 해줘야 함
- Protocol: 어떤 서비스를 이용하기 위해 해야할 일들의 목록
- 테이블 뷰 서비스를 사용하기 위해 해야할 일
    - 테이블 뷰의 질문들에 코드로 답해줘야 함
    - class ViewControllerName: UIViewcontroller, UITableViewDataSource, UITableViewDelegate { }
    - UITableViewDataSource: 테이블 뷰 셀 몇 개?, 어떻게 보여줄지?
    - UUITableViewDelegate: 테이블 뷰 클릭하면? 등 (필수 2개를 제외한 나머지 질문)
    - tableView.dequeueReusableCell: 셀 재사용 설정 가능

### Custom Cell
- 실제 앱을 만들 때, 기본적으로 제공하는 것만으로는 한계가 있음 -> Custom Cell 사용
- UITableViewCell을 상속받은 클래스로 작성, 원하는 cell의 custom class를 작성한 class 이름으로 변경
- UITableViewDataSource에 코드를 작성하여 원하는대로 커스텀 가능

### Present ViewController
- 셀을 클릭했을 때, 디테일 뷰컨트롤러를 어떻게 띄울까?
- 디테일 뷰컨트롤러 파일을 만든 후, 스토리보드에 뷰컨트롤러를 하나 더 만들어 클래스 명을 변경
- Segue(세그웨이): 스토리보드에서 두 뷰컨트롤러를 연결시키는 방법
- 뷰컨트롤러 사이에는 여러 세그웨이가 존재할 수 있는데, id를 설정하여 특정 세그웨이만 지정할 수 있음

### 데이터 넘기기
- 세그웨이로 연결된 두 뷰컨트롤러 사이의 전환 시 데이터 넘기는 방법
- 세그웨이를 수행하기 직전에 세그웨이 수행 준비를 하는 메소드 사용 -> func prepare(for segue:... ), sender로 값을 받아 힌트로 사용할 수 있음

### 코드 회고
- 회고는 스스로에 대한 배움, 성장
- 코딩을 하고 나서 회고를 하는 것은 아주 좋은 습관
- 동료들과 지속적으로 코드 리뷰를 진행
- 기술 부채를 최소화 시켜야 함 (코드 수정 및 재사용이 용이하도록)