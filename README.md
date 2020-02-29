# Roadruwa <여행 경로 가이드북 홈페이지>

#### 회원가입을 해야만 게시글을 볼 수 있기 때문에 이미 가입 시켜 놓은 ID로 접속 후 보실 수 있습니다 
#### (ID: cyshim / PW: cyshim) http://dayoung.skycows.pe.kr/

프로젝트 소개
--------
학교 졸업작품으로 계획을 짤 시간이 없거나, 많고 다양한 여행정보에 어려움을 느끼는 사람들을 위한 여행 경로 공유 홈페이지입니다. 요즘 현대인들이 바쁜 삶을 살고 있어 여행을 갈 시간이 생겨도 어떤 여행을 해야할지, 어디를 가야하는지, 무슨 여행을 해야하는지 막막해하는 사람들이 많습니다. 또한 시간이 많아도 결정장애나 여행에 대해 잘 알지못해 어디로 가야할지 고민인 사람들이 많습니다. 이런 사람들을 위한 여행 경로 가이드북이 있으면 좋겠다고 생각해 결정하게 되었습니다. 

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

> 지역, 여행일수, 교통, 경비, 테마의 카테고리로 더 상세한 검색을 할 수 있습니다<br>
> 관리자의 승인처리가 되지 않은 게시물은 볼 수 없습니다.<br>

- 게시글 작성<br>

<img src="https://user-images.githubusercontent.com/59246146/74511628-bec4d900-4f49-11ea-9529-10c911025790.png" width="400px">&nbsp;

> 소개할 여행 경로의 제목, 여행지 대표사진 3장, 여행의 테마, 지역의 정보를 입력할 수 있습니다.<br>


<img src="https://user-images.githubusercontent.com/59246146/74937497-87fe2f80-542f-11ea-97ff-cb2fce48e0a8.png" width="400px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/74937504-8b91b680-542f-11ea-859e-1ac151ebd31b.png" width="400px">

> 작성할 여행 경로의 일수에 따라 게시글 양식이 동적으로 생성됩니다.<br>
> 여행 일수별로 여행비, 식비, 교통비, 숙박비를 입력할 수 있습니다.<br>
> 여행 일수별로 Summernote라는 에디터를 사용하여 유연성 있는 게시글을 작성할 수 있습니다.<br>
> 여행 일수별로 가장 추천하는 여행지의 주소를 입력하여 주소의 지도로 볼 수 있습니다.


- 게시글<br>

 <img src="https://user-images.githubusercontent.com/59246146/75603689-3da63e00-5b14-11ea-96f3-05ff2c8fb2a4.png" width="500px">&nbsp;
 
 > 여행을 대표할 사진3개와 카테고리, 제목, 작성자, 별점, 총 비용 등 여행에 대한 기본정보를 알 수 있습니다.<br><br>


<img src="https://user-images.githubusercontent.com/59246146/75603746-ddfc6280-5b14-11ea-96be-1ed309037085.png" width="400px" height="350px">&nbsp;
<img src="https://user-images.githubusercontent.com/59246146/75603747-dfc62600-5b14-11ea-9e14-4e78584fb196.png" width="400px" height="350px">
 
 > ex) 1박 2일의 여행 게시글<br>
 > 등록된 여행 일수별로 작성된 글을 볼 수 있습니다.<br>
 > 처음에 1일차로 초기화 되어있으며 1일차의 추천 여행지 주소, 지도, 종류별 비용, 게시글을 볼 수 있습니다.<br>
 > 2일차를 클릭하면 2일차의 추천 여행지 주소, 지도, 종류별 비용, 게시글을 볼 수 있습니다.
