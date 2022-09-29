//현재 폰트 사이즈를 저장할 전역 변수
var currentFontSize;
//문서가 준비되었는지 이벤트를 걸어준다.
$(document).ready(init);
//초기화 
function init() {
	// 1. 크게, 작게 링크에 이벤트를 걸어줍니다.
	$("#fontControll li a").click(clickHandler);
}
//크게, 작게 링크가 클릭되었을때 처리하는 함수
function clickHandler(e) {
	//이벤트 전파를 막는다.
	e.preventDefault();
	//크게, 작게 중 어느것이 클릭되었는지 판별
	var whichClicked = $(this).attr("id");
	//현재의 폰트 사이즈를 전역 변수에 저장한다.
	currentFontSize = parseInt($(".article").css("font-size"));
	//클릭된 링크에 따라 폰트를 크게 혹은 작게 설정합니다.	
	switch (whichClicked) {
		case "larger":
			//1폰트 크게한다.	
			setFontSize(1);
			break;
		case "smaller":
			//1폰트 작게한다.	
			setFontSize(-1);
			break;
	}
}
function setFontSize($size) {
	var totalFontSize = currentFontSize + $size;
	$(".article").css({ "font-size": totalFontSize + "px" });
}
