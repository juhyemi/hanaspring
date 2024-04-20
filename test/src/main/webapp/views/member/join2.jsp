<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="<c:url value="/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/member/join.css"/>">
<div class="commonSection1">
    <div class="commonContent1">
        <img src='<c:url value="/img/member/sub-visual02.jpg"/>' style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <p><img src='<c:url value="/img/icon-home.png"/>'> > 회원가입</p>
            </div>
        </div>
    </div>
</div>

<!-- 메인 -->
<!-- 회원가입 -->
<div class="joinForm container">
    <div class="joinSection1">
        <div><h3>회원가입</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="wellcome">
        <h3>OOO사이트에 오신 것을 환영합니다.</h3>
        <h5>-이름과 이메일을 입력해 주시면 가입여부를 확인 후 회원가입 절차가 이루어집니다.</h5>
    </div>
    <br><br>
    <div class="contents">
        <h3>회원가입을 위해서 아래의 양식에 있는 내용을 입력해 주셔야 합니다.</h3>
        <h5>-회원님의 개인정보를 신중하게 보호하고 있으며 회원님의 동의 없이는 기재하신 회원정보가 누출되지 않습니다.
            자세한 내용은 개인정보보호정책에서 확인하세요.</h5>
    </div>
    <!-- 입력폼 -->
    <form id="joinform">
        <div>기본정보</div>
        <table>
            <tr>
                <td>아이디</td>
                <td>
                    <input type="text" id="memberId" name="memberId">
                    <img src='<c:url value="/img/member/btn_iddupl.gif"/>' id="btn_check">
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" id="memberPw" name="memberPw">
                    4자리 이상 사용가능합니다.
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" id="memberPwChk" name="memberPwChk"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input id="memberName" name="memberName" type="text"></td>
            </tr>
            <tr>
                <td>이메일</td>
<%--                <td><input type="text">@<input type="text"></td>--%>
                <td><input type="email" name="memberEmail" id="memberEmail" pattern=".+@example\.com" size="30" /></td>
            </tr>
            <tr>
                <td>이메일 수신여부</td>
                <td><input type="radio" value="1" name="memberEmailReceive" >수신
                    <input type="radio" value="0" name="memberEmailReceive">수신안함</td>
            </tr>
            <tr>
                <td>비밀번호 확인시 질문</td>
                <td>
                    <select class="size" name="memberPwQuestion" id="memberPwQuestion">
                        <option value="0">========선택========</option>
                        <option value="1">기억에 남는 추억의 장소는?</option>
                        <option value="2">자신의 인생 좌우명은?</option>
                        <option value="3">자신의 보물 제1호는?</option>
                        <option value="4">가장 기억에 남는 선생님 성함은?</option>
                        <option value="5">내가 좋아하는 캐릭터는?</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인시 답변</td>
                <td><input type="text" id="memberPwAnswer" name="memberPwAnswer" value=""></td>
            </tr>
            <tr>
                <td>성별</td>
                <td><input name="memberGender" value="male" type="radio">남자<input name="memberGender" value="femail" type="radio">여자</td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>
                    <input type="date" name="memberBirthDate" id="memberBirthDate" max="2024-04-20">
                </td>
            </tr>
        </table>
    </form>
    </div>
    <div class="Information2">부가정보</div>
    <div class="imageBtn2">
        <input type="image" src='<c:url value="/img/member/btn_confirm.gif"/>' id="btn_register">
        <input type="image" src='<c:url value="/img/member/btn_cancel.gif"/>'>
    </div>
</div>
<script>
    let join = {
        init: function () {
            let idcheck = false;
            $('#btn_check').click(()=>{
                let id = $('#memberId').val();
                if(id==''||id==null){
                    alert('ID를 입력 하세요');
                    return;
                }
                $.ajax({
                    url:'<c:url value="/member/registercheckid"/>',
                    data:{
                        "id":id
                    },
                    success:(result)=>{
                        let msg='사용 불가능 합니다.';
                        if(result=='1'){
                            msg = '사용 가능 합니다.';
                            $("#memberId").attr("readonly",true);
                            idcheck=true;
                        }
                        alert(msg);
                    }
                })
            });
            $('#btn_register').click(function(){
                let memberId = $('#memberId').val();
                let memberPw = $('#memberPw').val();
                let memberPwChk = $('#memberPwChk').val();
                let memberName = $('#memberName').val();
                let memberEmail = $('#memberEmail').val();
                let memberEmailReceive =  $('input[name=memberEmailReceive]:checked').val();
                let memberPwQuestion = $("#memberPwQuestion").val();
                let memberPwAnswer = $('#memberPwAnswer').val();
                let memberGender =  $('input[name=memberGender]:checked').val();
                let memberBirthDate = $('#memberBirthDate').val();
                if(memberId==''||memberId==null){
                    alert('ID를 입력 하세요');
                    $('#memberId').focus();
                    return;
                }
                if(!idcheck){
                    alert("id 중복체크를 해주세요");
                    return;
                }
                if(memberPw==''||memberPw==null){
                    alert('비밀번호를 입력 하세요');
                    $('#memberPw').focus();
                    return;
                }
                if(memberPw.length<4){
                    alert('비밀번호는 4자리 이상이어야 합니다.');
                    return;
                }
                if(memberPwChk==''||memberPwChk==null){
                    alert('비밀번호 확인을 입력 하세요');
                    $('#memberPwChk').focus();
                    return;
                }
                if(memberPw!=memberPwChk){
                    alert('비밀번호와 비밀번호 확인이 다릅니다');
                    return;
                }
                if(memberName==''||memberName==null){
                    alert('이름을 입력 하세요');
                    $('#memberName').focus();
                    return;
                }
                if(memberEmail==''||memberEmail==null){
                    alert('이메일을 입력 하세요');
                    $('#memberEmail').focus();
                    return;
                }
                if(memberEmailReceive==''||memberEmailReceive==null){
                    alert('이메일 수신여부를 선택 하세요');
                    return;
                }
                if(memberPwQuestion==''||memberPwQuestion==null||memberPwQuestion==0){
                    alert('비밀번호 확인시 질문을 선택하세요');
                    return;
                }
                if(memberPwAnswer==''||memberPwAnswer==null){
                    alert('비밀번호 확인시 답변을 입력 하세요');
                    $('#memberPwAnswer').focus();
                    return;
                }
                if(memberGender==''||memberGender==null){
                    alert('성별을 선택 하세요');
                    return;
                }
                if(memberBirthDate==''||memberBirthDate==null){
                    alert('생년월일을 선택 하세요');
                    return;
                }
                join.send();
            });
        },
        send:function(){
            $('#joinform').attr({
                'method':'post',
                'action':'<c:url value="/member/join"/>'
            });
            $('#joinform').submit();
        }
    };
    $(function () {
        join.init();
    });
</script>