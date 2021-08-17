## Chapter 12. 애플뮤직 스타일 음악 앱
- 카메라, 비디오, 음악 등 미디어 관련 앱은 'AVFoundation' Framework를 사용하여 제작
    - AVPlayer 객체는 미디어를 플레이해주는 역할: 재생, 정지 등
    - Dark Mode에도 대응 가능
    - CollectionReusableView (섹션헤더뷰 등)

- extension 키워드를 사용해 class에 들어갈 내용을 쪼개서 작성 및 기능을 확장 가능
- extension 안에서는 Stored Property를 사용할 수 없음 (Computed Property/Method를 추가(확장)할 때 사용)
- 'Section Insets'는 아이템을 표기하기 위한 상하좌우 여백(마진)들을 표현
- App(Local)에 있는 파일에 접근하고자 할 때 'Bundle' 사용
- 스토리보드에서 'Collection Reusable View'를 추가해 header나 footer를 구현
- '싱글톤 객체'는 앱 내에서 하나만 필요하며, 필요한 곳에서 호출하여 사용하는 경우에 사용
    - static let shared = ClassName()
    - 'UIApplication' 객체를 사용해 앱 내부 정보에 접근하는 것과 비슷
- 'CMTime'은 'Core Media Time'의 약자 - 기준(seconds)을 원하는 만큼으로 나눠(preferredTimescale) 표현