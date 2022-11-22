<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<script>
	
	
	
	$(function(){
		
		let emailCode = 0;
		
		$('#btnEmailAuth').click(function(){
			
			let email = $('input[name=email]').val();
			
			$.ajax({
				url: '/Jboard2/user/emailAuth.do',
				method: 'get',
				data: {"email":email},
				dataType: 'json',
				success: function(data){
					//console.log(data);
					if(data.status == 1){
						// 메일 발송 성공
						emailCode = data.code;
						
						$('.emailResult').text('인증코드를 전송 했습니다. 이메일을 확인 하세요.');
						$('.auth').show();
					}else{
						// 메일 발송 실패
						$('.emailResult').text('이메일을 실패했습니다. 이메일을 확인 후 다시 하시기 바랍니다.');
						
					}
					
					
				}
			});
		});
		
		
		// 이메일 인증코드 확인
		$('#btnEmailConfirm').click(function(){
			
			let code = $('input[name=auth]').val();
			
			if(code == emailCode){
				$('.emailResult').text('이메일이 인증 되었습니다.');
			}
			
		});
		
		
	});
</script>
<main id="user">
    <section class="register">

        <form action="#">
            <table border="1">
                <caption>사이트 이용정보 입력</caption>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="uid" placeholder="아이디 입력"/>
                        <button type="button"><img src="../img/chk_id.gif" alt="중복확인"/></button>
                        <span class="uidResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pass1" placeholder="비밀번호 입력"/></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="pass2" placeholder="비밀번호 입력 확인"/></td>
                </tr>
            </table>

            <table border="1">
                <caption>개인정보 입력</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" placeholder="이름 입력"/>                        
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" placeholder="별명 입력"/>
                        <button type="button"><img src="../img/chk_id.gif" alt="중복확인"/></button>
                        <span class="nickResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        
                        <input type="email" name="email" placeholder="이메일 입력"/>
                        <span class="emailResult"></span>
                        <button type="button" id="btnEmailAuth"><img src="../img/chk_auth.gif" alt="인증번호 받기"/></button>
                        <div class="auth">
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button" id="btnEmailConfirm"><img src="../img/chk_confirm.gif" alt="확인"/></button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="hp" placeholder="휴대폰 입력"/></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="zip" placeholder="우편번호"/>
                        <button type="button"><img src="../img/chk_post.gif" alt="우편번호찾기"/></button>
                        <input type="text" name="addr1" placeholder="주소 검색"/>
                        <input type="text" name="addr2" placeholder="상세주소 입력"/>
                    </td>
                </tr>
            </table>

            <div>
                <a href="/Jboard2/user/login.do" class="btn btnCancel">취소</a>
                <input type="submit" value="회원가입" class="btn btnRegister"/>
            </div>

        </form>

    </section>
</main>
<jsp:include page="./_footer.jsp"/>