# Roadruwa <여행 경로 가이드북 홈페이지>

#### 회원가입을 해야만 게시글을 볼 수 있기 때문에 이미 가입 시켜 놓은 ID로 접속 후 보실 수 있습니다 
#### (ID: cyshim / PW: cyshim) http://dayoung.skycows.pe.kr/

프로젝트 소개
--------
이프로젝트는 여행 계획 수립시간이 부족하거나 많은 여행정보의 선택에 어려움이 있는 사람을 위한 여행 경로 공유 홈페이지입니다. 저 또한 여행하기 전에 어디로 가야 할지, 뭘 할지 선택에 어려움이 있어 주제로 선정하게 되었습니다.

구현 기술
--------
- 사용(개발) 언어 : JAVA
- 사용(개발)  툴 : ECLIPSE
- DB : MY-SQL
- 기술: JAVASCRIPT, JQUERY, HTML5, CSS, 

수행 조직
--------
- 팀장 심다영 /  팀원 3명 (총 4명)
- 팀장: 데이터베이스 구축과 주요 기능 구현, 전체 구성원의 R&R을 정의, 과제 진척을 관리
- 팀원2명: 각자 화면 구성 및 기능 개발을 담당
- 팀원1명: 포토샵 및 ppt작성
- 주요 기능 테스트 및 품질 검토: 팀장, 교수님

주요 기능
------
- 회원가입
- 검색 (검색별 / 카테고리별)
- 게시글 (카카오API 지도 / 우편 / 에디터(Summernote))
- 쪽지 (사용자와 사용자 / 관리자와 사용자)
- 댓글 (별점부여)


상세설명
------


<h3> 1. 회원가입

<img src="https://user-images.githubusercontent.com/59246146/74509213-4576b780-4f44-11ea-8ced-9cdfe7419ef3.png" width="200px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74509252-5f17ff00-4f44-11ea-913c-d5d15e736a47.png" width="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74509009-ce412380-4f43-11ea-9463-fdef4057102a.png" width="180px">&nbsp;&nbsp;

<h4>ㄱ. 설명 </h4>

> 로그인 / 아이디, 비밀번호 찾기가능 <br>
> 회원가입시 500포인트가 지급. 
 
 <h3> 2. 검색<br>
 
<img src="https://user-images.githubusercontent.com/59246146/74509941-06e1fc80-4f46-11ea-87ad-d96adc359fe7.png" width="400px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74509841-c8e4d880-4f45-11ea-9bff-8154fd692744.png" width="400px">

<h4>ㄱ. 설명 </h4>
 
> 관리자의 승인처리가 되지 않은 게시물은 검색불가<br>
> 지역, 여행일수, 교통, 경비, 테마 별로 검색

<h3> 3. 게시글(작성)<br>
 
<img src="https://user-images.githubusercontent.com/59246146/74937497-87fe2f80-542f-11ea-97ff-cb2fce48e0a8.png" width="400px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74937504-8b91b680-542f-11ea-859e-1ac151ebd31b.png" width="400px">

<h4>ㄱ. 설명 </h4>

> 작성할 여행 경로의 일수에 따라 게시글 양식이 동적으로 생성<br>
> 여행 일수별로 여행비, 식비, 교통비, 숙박비를 입력가능<br>
> 여행 일수별로 Summernote라는 에디터를 사용하여 유연성 있는 게시글을 작성<br>
> 여행 일수별로 가장 추천하는 여행지의 주소를 입력하여 주소의 지도로 볼 수 있음

<h3> 3. 게시글(view)<br>

<img src="https://user-images.githubusercontent.com/59246146/75622365-9b08c080-5be2-11ea-98a8-dd80725278ca.png" width="400px" height="350px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/75622366-9cd28400-5be2-11ea-94d6-3382f9543f9b.png" width="400px" height="350px">
 
 <h4>ㄱ. 설명 </h4>
 
> ex) 1박 2일의 여행 게시글<br>
> 등록된 여행 일수별로 작성<br>
> 처음에 1일 차로 초기화되어있으며 1일 차의 추천 여행지 주소, 지도, 종류별 비용, 게시글을 볼 수 있음<br>
> 2일 차를 클릭하면 2일 차의 추천 여행지 주소, 지도, 종류별 비용, 게시글을 볼 수 있음
 
<img src="https://user-images.githubusercontent.com/59246146/75603746-ddfc6280-5b14-11ea-96be-1ed309037085.png" width="400px" height="350px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/75603747-dfc62600-5b14-11ea-9e14-4e78584fb196.png" width="400px" height="350px">

 > 일수별 게시글을 볼 수 있음<br>


<h3> 4. 쪽지 <br>
  
 <게시글 작성자와 사용자>
  
<img src="https://user-images.githubusercontent.com/59246146/73817097-7f053f80-482d-11ea-8a33-a8ee93664250.png" width="200px" height="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/73816735-b6bfb780-482c-11ea-88ac-0fa7fba8453d.png" width="200px" height="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/73816941-2a61c480-482d-11ea-9c9c-39a6119cbe21.png" width="400px" height="250px">&nbsp;

<h4>ㄱ. 설명 </h4>

> 게시글에 대한 질문을 쪽지보내기<br>
> 쪽지를 작성 후 마이페이지에서 보낸 쪽지함을 통해 확인


<관리자와 사용자><br>

<img src="https://user-images.githubusercontent.com/59246146/75623584-bda0d680-5bee-11ea-870b-e168759f436a.png" width="400px" height="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/73817361-0e125780-482e-11ea-908d-9baa70e404aa.png" width="250px" height="250px">&nbsp;

<h4>ㄱ. 설명 </h4>

> 홈페이지에 대한 질문을 쪽지보내기<br>
> 관리자에게 보낸 후 마이페이지에서 보낸 쪽지함을 통해 확인

<h3> 5. 댓글(별점)<br>
 
<img src="https://user-images.githubusercontent.com/59246146/74009212-1b624a00-49c6-11ea-89b3-5bae0aea64a3.png" width="400px" height="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74009110-dc33f900-49c5-11ea-99c3-3ffefe368757.png" width="400px" height="250px">&nbsp;

<h4>ㄱ. 설명 </h4>

> 구매한 게시글의 후기와 질문을 댓글로 작성가능 (자신의 글만 수정/삭제)<br>
> 게시글의 작성자는 자신의 글에 댓글을 달 수 없음 (자신의 글에 댓글을 달아 글 가격 올림 방지)<br>

 - 별점<br>

<img src="https://user-images.githubusercontent.com/59246146/74009660-0afe9f00-49c7-11ea-871e-27576573e7e8.png" width="200px" height="150px">&nbsp;&nbsp;&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74009560-ce32a800-49c6-11ea-8bc0-d0c081b660fb.png" width="400px" height="300px">&nbsp;

> 글의 가격은 별점으로 측정<br>
> 글의 총 별점이 50개당 100원씩 증가<br>


마치며
------
학교에서 배운 과목들을 실질적으로 적용해 볼 기회였지만 DB 설계부터 모든 기능까지 직접 해야 하는 만큼 처음엔 막막하고 어려웠습니다. 또한, 조별 친구들과 함께해야 했기 때문에 팀워크도 필요했습니다. 각자 수준도, 생각도 다른 만큼 조율이 처음엔 힘들었지만 프로젝트를 끝낸 이 시점엔 서로에게 맞춰나가 좋은 팀워크를 이뤘고, Java, Javascript, SQL 문 작성, jQuery 등에 대한 이해와 활용 역량이 향상되었습니다. 또한, 팀장으로서 팀원들의 R&R 관리와 일정/진척관리의 중요성을 이해하는 계기가 되었습니다. 프로젝트를 통해 개발자라는 꿈에 한 걸음 나아갈 수 있었고 아직 많이 부족하지만 좀 더 나은 개발자가 되기 위해 노력하겠습니다.
