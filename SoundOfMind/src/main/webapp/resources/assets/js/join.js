/**
 * 
 
 
 function checkId(){
        var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'./idCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{id:id},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                    $('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                    alert("아이디를 다시 입력해주세요");
                    $('#id').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
        };*/
        
        
var fields = document.querySelectorAll('.textb input');
var btn = document.querySelector('.btn');

function check() {
    if( (fields[0].value != '') && (fields[1].value != '') && (fields[2].value != '')) {
        btn.disabled = false;
    } else {
        btn.disabled = true;
    }
}
/* 아이디,비번, 이름 작성하면 회원가입 가능 (버튼 활성화/비활성화)*/
fields[0].addEventListener('keyup', check);
fields[1].addEventListener('keyup', check);
fields[2].addEventListener('keyup', check);



