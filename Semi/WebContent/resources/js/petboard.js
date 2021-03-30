window.onload = function() {
	const modal = document.querySelector(".modal1");
	const previews = document.querySelectorAll(".photo-gallery img");
	const original = document.querySelector(".full-img");


	console.log(modal);
	console.log(previews);
	console.log(original);

	previews.forEach(preview => {
		preview.addEventListener('click', () => {
			
			console.log("클릭");

			// modal 과 origianl 에 open class 를 추가한다.
			modal.classList.add("open");
			original.classList.add("open");

			// 오리지날 속성을 가지고 오고 클릭한 이미지의 를 오리지날 속성 이미지로 변경한다.
			const originalSrc = preview.getAttribute("data-original");
			original.src = `resources/TestImage/${originalSrc}`;
		})
	})

	modal.addEventListener("click", (e) => {
		if (e.target.classList.contains('modal1')) {
			modal.classList.remove("open");
			//original.classList.add("open");
		}
	})
}

