class JasprUIHorizontalSlider {
  constructor() { }

  scrollToRight = () => {
    const carousel = document.querySelector('.jaspr_ui_horizontal_slider');
    const width = carousel.querySelector('.jaspr_ui_horizontal_slider_item').offsetWidth;

    carousel.scrollLeft = carousel.scrollLeft + width;
  }

  scrollToLeft() {
    const carousel = document.querySelector('.jaspr_ui_horizontal_slider');
    const width = carousel.querySelector('.jaspr_ui_horizontal_slider_item').offsetWidth;

    carousel.scrollLeft = carousel.scrollLeft - width;
  }
  
  
   printLeft() {
    console.log('left');
  }
  
   printRight() {
    console.log('right');
  }
  
   init() {
    console.log('Jasper UI Horizontal Slider Ready');

    const right = document.querySelector(".jaspr_ui_horizontal_slider_icon_right");
    const left = document.querySelector(".jaspr_ui_horizontal_slider_icon_left");

    left.addEventListener('click', this.scrollToLeft);
    right.addEventListener('click', this.scrollToRight);
  }
}

window.JasprUIHorizontalSlider = JasprUIHorizontalSlider;