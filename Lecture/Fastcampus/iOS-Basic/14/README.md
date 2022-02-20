## Chapter 14. Networking

- iOS에서는 URLSession 클래스를 통해 Networking을 작업
- Concurrency(동시성)을 주지 못하면 사용자는 불편을 느낌
- App + Concurrency -> 'GCD' & 'Operations'을 통해 관리

### HTTP(HyperText Transfer Protocol)
- 서버와 앱 사이에 데이터를 주고받는 방법: 'HTTP'로 'REST' API를 이용해 'JSON' 데이터를 주고 받음
- 기본적으로 서버와 클라이언트는 메시지를 주고 받는 형식으로 의사소통
    1. 클라이언트가 서버에게 'Request'
    2. 서버가 클라이언트에게 'Response'
- HTTP Request Method
    1. POST: Create
    2. GET: Read
    3. UPDATE: Update
    4. DELETE: Delete
- URL(Uniform Resource Locator): 웹에 해당하는 리소스의 주소
- Response의 Body부분 중 Content-Type은 어떤 포멧의 데이터가 전달될 것인지를 표시
    - text/html, application/json, image/png, video/mpeg ...
- HLS(HTTP Live Streaming): 대부분의 스트리밍 서비스에서 사용하는 중
- 'Postman'이라는 tool을 사용하면 네트워킹 하는 모습을 확인해볼 수 있음