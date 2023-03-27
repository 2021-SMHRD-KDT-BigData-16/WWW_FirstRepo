
// 첫번째
var slides3 = document.querySelector('#movie3 .slides'),
	slide3 = document.querySelectorAll('#movie3 .slides li'),
	currentIdx3 = 0,
	slideCount3 = slide3.length,
	slideWidth3 = 535,
	slideMargin3 = 0,
	prevBtn3 = document.querySelector('#movie3 .prev'),
	nextBtn3 = document.querySelector('#movie3 .next');

slides3.style.width = (slideWidth3 + slideMargin3) * slideCount3 - slideMargin3 + 'px';

function moveSlide3(num) {
	slides3.style.left = (slideWidth3 + slideMargin3) * -num + "px";
	currentIdx3 = num;
}
nextBtn3.addEventListener('click', function() {
	if (currentIdx3 < slideCount3 - 3) {
		moveSlide3(currentIdx3 + 1);
	}
});
prevBtn3.addEventListener('click', function() {
	if (currentIdx3 > 0) {
		moveSlide3(currentIdx3 - 1);
	}
});



// 두번째
var slides4 = document.querySelector('#movie4 .slides'),
    slide4 = document.querySelectorAll('#movie4 .slides li'),
    currentIdx4 = 0,
    slideCount4 = slide4.length,
    slideWidth4 = 535,
    slideMargin4 = 0,
    prevBtn4 = document.querySelector('#movie4 .prev'),
    nextBtn4 = document.querySelector('#movie4 .next');

slides4.style.width = (slideWidth4 + slideMargin4) * slideCount4 - slideMargin4 + 'px';

function moveSlide4(num) {
    slides4.style.left = (slideWidth4 + slideMargin4) * -num + "px";
    currentIdx4 = num;
}
nextBtn4.addEventListener('click', function () {
    if (currentIdx4 < slideCount4 - 3) {
        moveSlide4(currentIdx4 + 1);
    }
});
prevBtn4.addEventListener('click', function () {
    if (currentIdx4 > 0) {
        moveSlide4(currentIdx4 - 1);
    }
});


// 세번째꺼!!!!
var slides5 = document.querySelector('#movie5 .slides'),
    slide5 = document.querySelectorAll('#movie5 .slides li'),
    currentIdx5 = 0,
    slideCount5 = slide5.length,
    slideWidth5 = 535,
    slideMargin5 = 0,
    prevBtn5 = document.querySelector('#movie5 .prev'),
    nextBtn5 = document.querySelector('#movie5 .next');

slides5.style.width = (slideWidth5 + slideMargin5) * slideCount5 - slideMargin5 + 'px';

function moveSlide5(num) {
    slides5.style.left = (slideWidth5 + slideMargin5) * -num + "px";
    currentIdx5 = num;
}
nextBtn5.addEventListener('click', function () {
    if (currentIdx5 < slideCount5 - 3) {
        moveSlide5(currentIdx5 + 1);
    }
});
prevBtn5.addEventListener('click', function () {
    if (currentIdx5 > 0) {
        moveSlide5(currentIdx5 - 1);
    }
});

