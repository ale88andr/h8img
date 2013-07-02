function Slider (container, nav) {
    this.container = container;
    this.nav = nav;

    this.imgs = this.container.find('img');
    this.imageWidth = 800; //this.imgs[0].width;
    this.imgsQuantity = this.imgs.length;

    this.current = 0;
}

Slider.prototype.transition = function(coords) {
    this.container.animate({
        'margin-left': coords || -(this.current * this.imageWidth)
    });
};

Slider.prototype.setCurrent = function(dir) {
    var position = this.current;
    position += (~~(dir === 'next') || -1);
    this.current = (position < 0)?this.imgsQuantity - 1:position % this.imgsQuantity;
    console.log(this.current);
};
