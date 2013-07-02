var slider = new Slider($('div.slider ul'), $('div.slider-nav'));

slider.nav.show().find('button').on('click', function(){
	slider.setCurrent($(this).data('dir'));
	slider.transition();
})

	//console.log(slider.container);
	//console.log(slider.nav);
	//console.log(slider.imgs[0]);
	//console.log(slider.imageWidth);
	//console.log(slider.imgsQuantity);