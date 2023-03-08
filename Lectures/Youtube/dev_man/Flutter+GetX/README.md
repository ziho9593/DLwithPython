# Flutter+GetX
**Fast, Stable, Extra-light and Powerful Flutter Framework**

## 01. GetX?
- Flutter 개발을 위한 매우 가볍고 강력한 라이브러리
- 단순 상태 관리 뿐만 아니라 여러 모듈을 제공
- 이에 어떤 사람들은 미니 프레임워크라고 부를 정도로 플러터 프로젝트를 효과적인 관리가 가능하게 해줌
- 3가지 기본 원칙
    - 생산성: 어떻게 빠르고 효율적으로 개발하는지
    - 성능: 퍼포먼스 성능 뿐만 아니라, 시스템적으로 메모리 최적화 등을 고려
    - 조직화: 화면, 로직 등 각각 필요한 부분만을 전문적으로 제공 (클린 코드)
```dart
# 플러터 기본 소스
void main() => runApp(MaterialApp(home: Home()));

# GetX 사용 소스
void main() => runApp(GetMaterialApp(home: Home()));
```
- 3가지 주요 기능
    - 상태 관리, 라우트 관리, 종속성 관리
    - 상태 관리로만 사용할 때보다는, 라우트 관리와 종속성 관리를 위해 Get을 사용