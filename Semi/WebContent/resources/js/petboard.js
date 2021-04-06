let modal;
let previes;
let original
let thisImg;

let infinityNumber = 16;



window.onload = function() {
	// 모달창 흑백화면
	modal = document.querySelector(".modal1");
	// 이미지들
	previews = document.querySelectorAll(".photo-gallery img");
	// 나오는 창
	original = document.querySelector(".full-img");
	// 원래 이미지 파일
	thisImg = document.querySelector(".thisImg");

	console.log(modal);
	console.log(previews);
	console.log(original);
}

window.onscroll = async function() {
	if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		await request(infinityNumber);
		infinityNumber += 6;
		console.log("infinityNumber : " + infinityNumber)
	}
}

async function request(infinityNumber) {
	const response = await fetch('infinitContent.do?infinityNumber=' + infinityNumber, { method: 'GET', }).then((res)=>{return res.text()});
	console.log(response);
	/*let savedata = document.createElement('div');
	savedata.innerHTML = savedata.innerHTML + response;*/

	document.getElementById('photo-gallery').innerHTML = document.getElementById('photo-gallery').innerHTML + response;

}


function clicks(e) {
	// modal 과 origianl 에 open class 를 추가한다.
	modal.classList.add("open");
	original.classList.add("open");
	let ArticleNo = e.getAttribute('articleNo');
	console.log(ArticleNo);
	document.getElementById('TextArticleNo').value = ArticleNo;

	requestData(ArticleNo);

	const originalSrc = e.getAttribute("data-original");
	if (e.hasAttribute('chk')) {
		// 입양대기일 경우 입양신청 버튼 on / 이미지 경로 수정
		// 오리지날 속성을 가지고 오고 클릭한 이미지의 를 오리지날 속성 이미지로 변경한다.
		document.getElementById('apply').style.display = "inline";
		thisImg.src = `resources/saveFile/${originalSrc}`;
	} else {
		// 입양후기일 경우 입양신청 버튼 off / 이미지 경로 수정
		// 오리지날 속성을 가지고 오고 클릭한 이미지의 를 오리지날 속성 이미지로 변경한다.
		document.getElementById('apply').style.display = "none";
		thisImg.src = `savefile/${originalSrc}`;
	}

}

function CloseModal(e) {
	if (e.classList.contains('modal1')) {
		e.classList.remove("open");
		//original.classList.add("open");
	}
}


/*function start(){	
	// 모달창 흑백화면
	const modal = document.querySelector(".modal1");
	// 이미지들
	const previews = document.querySelectorAll(".photo-gallery img");
	// 나오는 창
	const original = document.querySelector(".full-img");
	// 원래 이미지 파일
	const thisImg = document.querySelector(".thisImg");

	

	previews.forEach(preview => {
		preview.addEventListener('click', function(){
			// modal 과 origianl 에 open class 를 추가한다.
			modal.classList.add("open");
			original.classList.add("open");
			let ArticleNo = preview.getAttribute('articleNo');
			console.log(ArticleNo);
			document.getElementById('TextArticleNo').value=ArticleNo;
			requestData(ArticleNo);
			const originalSrc = preview.getAttribute("data-original");
			if(preview.hasAttribute('chk')){
				// 입양대기일 경우 입양신청 버튼 on / 이미지 경로 수정
				document.getElementById('apply').style.display="inline";
				thisImg.src = `resources/saveFile/${originalSrc}`;
			} else{
				// 입양후기일 경우 입양신청 버튼 off / 이미지 경로 수정
				document.getElementById('apply').style.display="none";
				thisImg.src = `savefile/${originalSrc}`;
			}
			// 오리지날 속성을 가지고 오고 클릭한 이미지의 를 오리지날 속성 이미지로 변경한다.
		})
	})
	//흑백 화면 삭제시 class remove 작동
	modal.addEventListener("click", (e) => {
		if (e.target.classList.contains('modal1')) {
			modal.classList.remove("open");
			//original.classList.add("open");
		}
	})
}*/

// 누른 이미지 번호에 따른 data 요청
async function requestData(ArticleNo) {
	let data = await fetch("pet.do?command=titleContent&ArticleNo=" + ArticleNo).then(function(res) {
		return res.json();
	});
	console.log("data : " + data);
	let title = data.title;
	console.log("title : " + title);
	document.getElementById('title').innerHTML = data.title;
	let content = data.content;
	console.log("content :" + content);
	document.getElementById('content').innerHTML = data.content;
}

// 글 삭제
function deleteData() {
	let ArticleNo = document.getElementById('TextArticleNo').value;
	location.href = "pet.do?command=delete&ArticleNo=" + ArticleNo;
}

// 글 업데이트
function updateData() {
	let ArticleNo = document.getElementById('TextArticleNo').value;
	location.href = "pet.do?command=updateform&ArticleNo=" + ArticleNo
}

function applyData() {
	let ArticleNo = document.getElementById('TextArticleNo').value;
	location.href = "petboard_adopt_info.jsp";
}
