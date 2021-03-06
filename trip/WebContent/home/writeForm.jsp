<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<link rel="stylesheet" href="assets/css/summernote.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css">
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/wf.css" />
<link rel="stylesheet" href="assets/css/writeForm.css" />
<link rel="stylesheet"
	href="assets/bootstrap-4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/circleimage.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
<link rel="stylesheet" 
  href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"><jsp:include page="header.jsp" flush="false" />
<style>
body {
	font-size: 1.5rem;
}

</style>

    function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('file', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '/Upload.jsp',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
           $(el).summernote('editor.insertImage', url);
          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>'); 
        }
      });
    }
</script>


<div class="container">

	<br>
	<div class="form-group row">
		<div>
			<h2>
				<b>글쓰기</b>
			</h2>
		</div>
		<div class="ss">나의 여행기록을 공유해보세요:)</div>
	</div>
	<!--    enctype="multipart/form-data"  -->
	<form method="post" name="writeform" 
		action="insertBoardPro.jsp"
		enctype="multipart/form-data" id="wf"><br>
		<div class="form-group row">
			<label for="b_title" class="col-sm-1 col-form-label" style="padding-top: 1.1rem;">제목</label>
			<div class="col-sm-4">
				<input type="text" style="width:500px;" maxlength="50" name="b_title"
					required="required">
					
			</div>
		</div><br><br>
		<h2>*여행의 핵심의 사진 세장을 등록해주세요.*</h2><br>
		<div class="row">
			<div class="col-sm-3" style="padding-left:135px;">
				<div id="profile-upload">
					<div class="hvr-profile-img">
					
						<input type="file" name="b_pic1" id="output" class="upload w180" 
							title="Dimensions 180 X 180" id="imag" onchange="loadFile(event)">
					</div>
				</div>
			</div>
			<div class="col-sm-3" style="padding-left:135px;">
				<div id="profile-upload2">
					<div class="hvr-profile-img">
						<input type="file" name="b_pic2" id="output2" class="upload w180"
							title="Dimensions 180 X 180" id="imag"
							onchange="loadFile2(event)">
					</div>
				</div>
			</div>
			<div class="col-sm-3" style="padding-left:135px;">
				<div id="profile-upload3">
					<div class="hvr-profile-img">
						<input type="file" name="b_pic3" id="output3" class="upload w180"
							title="Dimensions 180 X 180" id="imag"
							onchange="loadFile3(event)">
					</div>
				</div>
			</div>
		</div>
		<br>
		<script>
         var loadFile = function(event) {
            var reader = new FileReader();
            reader.onload = function() {
               var output = document.getElementById('output');
               output.src = reader.result;
               document.getElementById('profile-upload').style.backgroundImage = "url("
                     + reader.result + ")";
            };
            reader.readAsDataURL(event.target.files[0]);
         };

         var loadFile2 = function(event) {
            var reader = new FileReader();
            reader.onload = function() {
               var output = document.getElementById('output2');
               output.src = reader.result;
               document.getElementById('profile-upload2').style.backgroundImage = "url("
                     + reader.result + ")";
            };
            reader.readAsDataURL(event.target.files[0]);
         };

         var loadFile3 = function(event) {
            var reader = new FileReader();
            reader.onload = function() {
               var output = document.getElementById('output3');
               output.src = reader.result;
               document.getElementById('profile-upload3').style.backgroundImage = "url("
                     + reader.result + ")";
            };
            reader.readAsDataURL(event.target.files[0]);
         };
         </script>

		<br>
		<div class="form-group row">
			<label for="b_cate" class="col-sm-2 col-form-label" style="padding-top: 1.1rem;">카테고리</label>
			<div class="col-sm-2">
				<select name="b_cate">
					<option value="먹방">먹방</option>
					<option value="관광지">관광지</option>
					<option value="문화재/역사">문화재/역사</option>
					<option value="호캉스">호캉스</option>
					<option value="액티비티">액티비티</option>
				</select>
			</div>
		</div>
<br>

		<div class="col-1"></div>
		<div class="form-group row">
			<label for="b_lo" class="col-sm-2 col-form-label">지역</label>
			<div class="w_col-sm-2">
				<div class="form-check">
					<label class="d_container" for="se"> <input type="checkbox"
						name="b_lo" id="se" class="aa" value="서울">서울 <span
						class="d_checkmark"></span>
					</label>
				</div>
				<div class="form-check">
					<label class="d_container" for="gg"> <input type="checkbox"
						name="b_lo" id="gg" value="경기/인천">경기/인천 <span class="d_checkmark"></span>
					</label>
				</div>
				<div class="form-check">
					<label class="d_container" for="ch"> <input type="checkbox"
						name="b_lo" id="ch" value="충청">충청 <span class="d_checkmark"></span>
					</label>
				</div>
				<div class="form-check">
					<label class="d_container" for="jr"> <input type="checkbox"
						name="b_lo" id="jr" value="전라">전라 <span class="d_checkmark"></span>
					</label>
				</div>
				<div class="form-check">
					<label class="d_container" for="gs"> <input type="checkbox"
						name="b_lo" id="gs" value="경상">경상 <span class="d_checkmark"></span>
					</label>
				</div>
				<div class="form-check">
					<label class="d_container" for="bs"> <input type="checkbox"
						name="b_lo" id="bs" value="부산">부산 <span class="d_checkmark"></span>
					</label>
				</div>
				<div class="form-check">
					<label class="d_container" for="jj"> <input type="checkbox"
						name="b_lo" id="jj" value="제주">제주 <span class="d_checkmark"></span>
					</label>
				</div>
			</div>
		</div><br>
		<div class="form-group row">
			<label for="b_tr" class="col-sm-2 col-form-label" style="padding-top: 1.1rem;">교통</label>
			<div class="col-sm-2">
				<select name="b_tr">
					<option value="자동차">자동차</option>
					<option value="대중교통">대중교통</option>
				</select>
			</div>
		</div><br>
		<h2>*확인버튼을 누르면 숫자대로 밑에 페이지가 생성됩니다*</h2><br>
		<div class="form-group row">
			<label for="b_day" class="col-sm-2 col-form-label" style="padding-top: 1.1rem;">예상 일 수</label>
			<div class="col-sm-1">
				<input type="text" size="50" maxlength="50" name="b_day1"
					id="b_day1" required="required">
			</div>
			<div class="pp">박</div>
			<div class="col-sm-1">
				<input type="text" size="50" maxlength="50" name="b_day2"
					id="b_day2" required="required">
			</div>
			<div class="col-sm-1">
			<div class="pp">일 </div></div>
			<div class="col-sm-2" style="padding-top:0.6rem;">
			<div class="form-check">
				<label class="d_container" for="one"> <input type="checkbox" 
					name="b_one" id="one" value="당일" onclick="toggle(this,'b_day1','b_day2')">당일치기
					<span class="d_checkmark"></span>
				</label>
				</div>
			</div>
				<div class="col-sm-1">
			<input type="button" value="확인" id="aa1" />
</div>
		</div>
		<br> <br>
		<script>
         function toggle(box, d1, d2) {
            if (document.getElementById) {
               var d1 = document.getElementById(d1);
               var d2 = document.getElementById(d2);
               if (box.checked) {
                  d1.value = "0";
                  d2.value = "1";

               } else {
                  d1.value = "";
                  d2.value = "";
               }
            }
         }
      </script>

		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode(idx) {
        // 현재 scroll 위치를 저장해놓는다.
        element_wrap = document.getElementById('wrap_'+idx);
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
              
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample3_postcode_'+idx).value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample3_address_'+idx).value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
		<script type="text/javascript">
		var divId = 1;
		
         $(document).ready(function() {      
            $("#aa1").click(function() {
               var count = document.all.b_day2.value;
               
               
               if (!isNaN(count)){   //숫자입력시
                  document.getElementById("rr").innerHTML = "";      //개체 생성 시 누적X
                  for (i = 0; i < count; i++) {
                	 var appendDiv =  $("#tmplt1").html();  
                	 
                	 appendDiv = appendDiv.replace(/{{idx}}/gi, divId+"");
                     $("#rr").append(appendDiv);

             		 $('#cont_'+divId).summernote({
        				height : 300,
        				minHeight : null,
        				maxHeight : null,
        				focus : true,
        				callbacks : {
        					onImageUpload : function(files, editor, welEditable) {
        						for (var i = files.length - 1; i >= 0; i--) {
        							//alert('upload image!!' + i);
        							sendFile(files[i], this);
        						}
        					}
        				}
        			 });
             		
             		 divId++;
                  }
               }
            });
         });   
         </script>
<!-- <script>
var loadFile4 = function(event) {
    var reader = new FileReader();
    reader.onload = function() {
       var output = document.getElementById('output4');
       output.src = reader.result;
       document.getElementById('profile-upload4').style.backgroundImage = "url("
             + reader.result + ")";
    };
    reader.readAsDataURL(event.target.files[0]);
 };
</script> -->

		<div class="row">
			<div id="rr"></div>
		</div>
		<br>
		
		<div class="but" style="padding-left:390px;">
			<input type="submit"  class="button alt" value="등록" > 
			<a href="#" class="button alt">삭제</a>
		</div>
	</form>
</div>
<br>
<div id="tmplt1" style="display:none">
	<div class='col-sm-12'>
		<span> <h1>[ {{idx}}박의 내용을 입력해주세요 ]</h1></span><br><br>
		<div class="form-group row">
		<img class="col-sm-3" src="images/trav.png" style=" max-width:110px; max-height:70px; margin-right:95px; margin-left:55px;">
		<img class="col-sm-3" src="images/food.png" style=" max-width:110px; max-height:70px; margin-right:95px; margin-left:55px;">
		<img class="col-sm-3" src="images/trans.png" style=" max-width:110px; max-height:70px; margin-right:95px; margin-left:55px;">
		<img class="col-sm-3" src="images/stay.png" style=" max-width:110px; max-height:70px; margin-right:95px; margin-left:55px;">
		</div>
		<div class="form-group row">
		<label for="b_trav" class="col-sm-3 col-form-label" style="max-width:21%; margin-right:41px;"><h3 style="text-align:center;">여행비</h3>
		<input type="text" size="10" maxlength="20" name="b_trav"
					required="required" placeholder="여행비용을 입력하세요"></label>
		<label for="b_food" class="col-sm-3 col-form-label" style="max-width:21%; margin-right:41px;"><h3  style="text-align:center;">식비</h3>
		<input type="text" size="10" maxlength="20" name="b_food"
					required="required"  placeholder=" 식비를 입력하세요"></label>
		<label for="b_trans" class="col-sm-3 col-form-label" style="max-width:21%; margin-right:41px;"><h3  style="text-align:center;">교통비</h3>
		<input type="text" size="10" maxlength="20" name="b_trans"
					required="required"  placeholder=" 교통비를 입력하세요"></label>
	<label for="b_stay" class="col-sm-3 col-form-label" style="max-width:21%; margin-right:41px;"><h3  style="text-align:center;">숙박비</h3>
		<input type="text" size="10" maxlength="20" name="b_stay"
					required="required"  placeholder=" 숙박비를 입력하세요"></label>
		</div><br>
	</div>
	<div class='col-sm-12' style="margin-left:-15px;">
		<textarea rows='10' id='cont_{{idx}}' name="b_cont"></textarea>
		   <br><br><h2>*꼭 추천하는 여행지의 주소를 찍어주세요*</h2><br>
			<input type='text' 
				id='sample3_postcode_{{idx}}'
				placeholder='우편번호' style='width: 120px; display: inline;'> 
			<input type='button' 
			onclick='sample3_execDaumPostcode("{{idx}}")' 
			value='우편번호 찾기'
			style='width: 150px; text-align: center;'><br>
		<div id='wrap_{{idx}}'
			style='display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative'>
			<img src='//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png'
				id='btnFoldWrap' alt='접기 버튼'
				style='cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1'
				onclick='foldDaumPostcode()'>
		</div>
		<input type='text' name="b_post" id='sample3_address_{{idx}}' style="width:500px;"class='d_form large' placeholder='주소'><br><br>
	</div>
</div>



<br>
<br>
<br>
<br>


<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/writeForm.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="assets/bootstrap-4.1.0/js/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="assets/js/summernote.js"></script>

<jsp:include page="footer.jsp" flush="false" />