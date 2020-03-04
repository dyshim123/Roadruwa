# Roadruwa <여행 경로 가이드북 홈페이지>

#### 회원가입을 해야만 게시글을 볼 수 있기 때문에 이미 가입 시켜 놓은 ID로 접속 후 보실 수 있습니다 
#### (ID: cyshim / PW: cyshim) http://dayoung.skycows.pe.kr/

프로젝트 소개
--------
학교 졸업작품으로 계획을 짤 시간이 없거나, 많고 다양한 여행정보에 어려움을 느끼는 사람들을 위한 여행 경로 공유 홈페이지입니다. 요즘 현대인들이 바쁜 삶을 살고 있어 여행을 갈 시간이 생겨도 어떤 여행을 해야할지, 어디를 가야할지 시간을 내서 알아 볼 수 없는 사람들이 많습니다. 또한 시간이 많아도 결정을 할 수 없거나 여행에 대해 잘 알지못해 어디로 가야할지 고민인 사람들이 많습니다. 이런 사람들을 위한 여행 경로 가이드북이 있으면 좋겠다고 생각해 결정하게 되었습니다. 

프로젝트 설계 및 계획
--------
- 팀장 심다영 /  팀원 3명 (총 4명)
- 팀장: 데이터베이스 구축과 주요 기능 구현, 전체 구성원의 R&R을 정의, 과제 진척을 관리
- 팀원2명: 각자 화면 구성 및 기능 개발을 담당
- 팀원1명: 포토샵 및 ppt작성
- 주요 기능 테스트 및 품질 검토: 팀장, 교수님

주요 기능 설명
------

- 로그인<br>


<img src="https://user-images.githubusercontent.com/59246146/74509213-4576b780-4f44-11ea-8ced-9cdfe7419ef3.png" width="200px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74509252-5f17ff00-4f44-11ea-913c-d5d15e736a47.png" width="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74509009-ce412380-4f43-11ea-9463-fdef4057102a.png" width="180px">&nbsp;&nbsp;


 > 로그인 모달창에서 회원 로그인과 아이디, 비밀번호 찾기가 가능합니다.<br>
 > 회원 아이디와 핸드폰 번호를 입력하면 비밀번호를 찾을 수 있습니다.<br>
 > 계정이 없을시 회원가입을 통해 계정을 만들 수 있습니다.<br>
 
 
 - 검색<br>
 
 <검색창을 통한 검색>
 
<img src="https://user-images.githubusercontent.com/59246146/74509941-06e1fc80-4f46-11ea-87ad-d96adc359fe7.png" width="400px">&nbsp;

> 검색창에 검색어를 입력해 관련된 게시물을 찾을 수 있습니다.<br>
> 관리자의 승인처리가 되지 않은 게시물은 볼 수 없습니다.<br>

<카테고리를 통한 검색>

<img src="https://user-images.githubusercontent.com/59246146/74509841-c8e4d880-4f45-11ea-9bff-8154fd692744.png" width="400px">&nbsp;

> 지역, 여행일수, 교통, 경비, 테마 별로 검색을 할 수 있습니다.<br>
> 사용자가 원하는 정보를 좀 더 자세하게 검색 할 수 있습니다.<br>
> 관리자의 승인처리가 되지 않은 게시물은 볼 수 없습니다.

- 게시글 작성<br>
(경로: 로그인 후 -> 마이페이지 -> 글쓰기)<br>

<img src="https://user-images.githubusercontent.com/59246146/74511628-bec4d900-4f49-11ea-9529-10c911025790.png" width="400px">&nbsp;

> 작성할 경로의 제목, 여행을 대표할 사진3개를 입력해 여행지의 핵심을 알 수 있습니다.<br>
> Selectbox를 사용한 카테고리 선택, 지역, 교통을 입력할 수 있습니다.


<img src="https://user-images.githubusercontent.com/59246146/74937497-87fe2f80-542f-11ea-97ff-cb2fce48e0a8.png" width="400px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74937504-8b91b680-542f-11ea-859e-1ac151ebd31b.png" width="400px">

> 작성할 여행 경로의 일수에 따라 게시글 양식이 동적으로 생성됩니다.<br>
> 여행 일수별로 여행비, 식비, 교통비, 숙박비를 입력할 수 있습니다.<br>
> 여행 일수별로 Summernote라는 에디터를 사용하여 유연성 있는 게시글을 작성할 수 있습니다.<br>
> 여행 일수별로 가장 추천하는 여행지의 주소를 입력하여 주소의 지도로 볼 수 있습니다.


- 게시글<br>

 <img src="https://user-images.githubusercontent.com/59246146/75603689-3da63e00-5b14-11ea-96f3-05ff2c8fb2a4.png" width="500px">&nbsp;
 
 > 여행을 대표할 사진3개와 카테고리, 제목, 작성자, 별점, 총 비용 등 여행에 대한 기본정보를 알 수 있습니다.<br><br>


<img src="https://user-images.githubusercontent.com/59246146/75622365-9b08c080-5be2-11ea-98a8-dd80725278ca.png" width="400px" height="350px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/75622366-9cd28400-5be2-11ea-94d6-3382f9543f9b.png" width="400px" height="350px">
 
 > ex) 1박 2일의 여행 게시글<br>
 > 등록된 여행 일수별로 작성된 글을 볼 수 있습니다.<br>
 > 처음에 1일차로 초기화 되어있으며 1일차의 추천 여행지 주소, 지도, 종류별 비용, 게시글을 볼 수 있습니다.<br>
 > 2일차를 클릭하면 2일차의 추천 여행지 주소, 지도, 종류별 비용, 게시글을 볼 수 있습니다.
 
 
 <img src="https://user-images.githubusercontent.com/59246146/75603746-ddfc6280-5b14-11ea-96be-1ed309037085.png" width="400px" height="350px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/75603747-dfc62600-5b14-11ea-9e14-4e78584fb196.png" width="400px" height="350px">

 > 일수별 게시글을 볼 수 있습니다.<br>
 > 일수별로 게시글을 나누어 보기가 간편하고 자세하게 볼 수 있습니다.


- 쪽지<br>
  
 <게시글 작성자와 사용자>
  
<img src="https://user-images.githubusercontent.com/59246146/73817097-7f053f80-482d-11ea-8a33-a8ee93664250.png" width="200px" height="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/73816735-b6bfb780-482c-11ea-88ac-0fa7fba8453d.png" width="200px" height="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/73816941-2a61c480-482d-11ea-9c9c-39a6119cbe21.png" width="400px" height="250px">&nbsp;


> 게시글에 대한 질문을 쪽지로 통해 게시글 작성자와 소통을 할 수 있습니다.<br>
> 쪽지를 작성 후 마이페이지에서 보낸쪽지함을 통해 확인 할 수 있습니다.


<관리자와 사용자>
(경로: 로그인 후 -> 마이페이지 -> 쪽지 -> 관리자에게 쪽지)

<img src="https://user-images.githubusercontent.com/59246146/75623584-bda0d680-5bee-11ea-870b-e168759f436a.png" width="400px" height="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/73817361-0e125780-482e-11ea-908d-9baa70e404aa.png" width="250px" height="250px">&nbsp;


> 홈페이지에 대한 질문을 쪽지로 통해 관리자와 소통할 수 있습니다.<br>
> 관리자에게 보낸 후 마이페이지에서 보낸쪽지함을 통해 확인할 수 있습니다.

 - 댓글<br>
 
<img src="https://user-images.githubusercontent.com/59246146/74009212-1b624a00-49c6-11ea-89b3-5bae0aea64a3.png" width="400px" height="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74009110-dc33f900-49c5-11ea-99c3-3ffefe368757.png" width="400px" height="250px">&nbsp;

> 구매한 게시글의 후기와 질문을 댓글로 작성할 수 있습니다.<br>
> 댓글의 내용, 첨부파일, 별점을 줄 수 있습니다.

 - 별점<br>
 
<img src="https://user-images.githubusercontent.com/59246146/74009612-ef939400-49c6-11ea-8fe3-8de4f2496fcc.png" width="400px" height="250px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74010223-51a0c900-49c8-11ea-81c0-c01c1027d441.png" width="400px" height="250px">&nbsp;

> 댓글 작성에서 별점을 줄 수 있습니다.<br>
> 별점은 1점부터 5점까지 줄 수 있습니다.<br>
> (자신의 글에 댓글을 달아 글 가격 올림 방지)


<img src="https://user-images.githubusercontent.com/59246146/74009660-0afe9f00-49c7-11ea-871e-27576573e7e8.png" width="200px" height="150px">&nbsp;&nbsp;&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74009560-ce32a800-49c6-11ea-8bc0-d0c081b660fb.png" width="400px" height="300px">&nbsp;

> 글의 가격은 별점으로 측정됩니다.<br>
> 글의 총 별점이 50개당 100원씩 증가합니다.<br>
> 예를 들어 글의 총 별점이 50개 미만 0원, 50개는 100원, 100개는 200원으로 측정됩니다.<br>
> 사용자들이 직접 읽고 별점으로 글의 가격을 매김으로써 글 가격이 합리적입니다.


마치며
------
학교에서 배운 과목들을 실질적으로 적용해 볼 수 있는 기회였지만 DB설계부터 모든 기능까지 직접 해야 하는만큼 처음엔 막막하고 어려웠습니다. 또한 조별 친구들과 함께 해야 했기 때문에 팀워크도 필요했습니다. 각자 수준도, 생각도 다른만큼 조율이 처음엔 힘들었지만 프로젝트를 끝낸 이 시점엔 서로에게 맞춰나가 좋은 팀워크를 이뤘고, Java, Javascript, sql문 작성, jquery 등에 대한 이해와 활용 역량이 향상되었습니다. 또한 팀장으로써 팀원들의 R&R 관리와 일정/진척관리의 중요성을 이해하는 계기가 되었습니다. 프로젝트를 통해 개발자라는 꿈에 한 걸음 나아갈 수 있었고 아직 많이 부족하지만 좀 더 나은 개발자가 되기 위해 노력하겠습니다.
