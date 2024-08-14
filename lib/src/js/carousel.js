
class JasprUICarousel {
    constructor() {
        this._index = 0;
    }
    
    //GEt and set index
    get index() {
        return this._index;
    }

    set index(value) {
        this._index = value;
    }

    navigateToRight = () => {
        const carousel = document.querySelector('.jaspr_ui_carousel');
        const width = carousel.querySelector('.jaspr_ui_carousel_item').offsetWidth;

        //Do not use scrollLeft, it is not supported in IE
        carousel.scrollBy(width, 0);
    }

    updateCarousel() {
        const carousel = document.querySelector('.jaspr_ui_carousel');
        const slides = carousel.querySelectorAll('.jaspr_ui_carousel_item');

        const offset = -this._index * 100;
        slides.style.width = `translateX{${offset}}%`;
    }

    moveToRight = () => {
        const slideCount = document.querySelectorAll('.jaspr_ui_carousel_item').length;
        this._index = (this._index + 1) % slideCount;
        updateCarousel();
    }

    moveToLeft = () => {
        const slideCount = document.querySelectorAll('.jaspr_ui_carousel_item').length;
        this._index = (this._index - 1 + slideCount) % slideCount;
        updateCarousel();
    }

    navigateToLeft = () => {
        const carousel = document.querySelector('.jaspr_ui_carousel');
        const width = carousel.querySelector('.jaspr_ui_carousel_item').offsetWidth;

        //Do not use scrollLeft, it is not supported in IE
        carousel.scrollBy(-width, 0);
    }

    init() {
        console.log('Jasper UI Carousel Ready');

        const right = document.querySelector(".jaspr_ui_carousel_icon_right");
        const left = document.querySelector(".jaspr_ui_carousel_icon_left");

        left.addEventListener('click', this.moveToLeft);
        right.addEventListener('click', this.moveToRight);
    }
}

window.JasprUICarousel = JasprUICarousel;