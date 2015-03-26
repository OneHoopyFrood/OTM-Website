$(function () {
	var shrink = function (ele) {
		$(ele).animate({ padding: '5px 10px;' }, 250, 'easeOutBack', function() { 
			ele.otmEasingFlag = false; 
		});
	}
	var grow = function (ele) {
		$(ele).animate({ padding: '15px 10px;' }, 550, 'easeInOutQuad', function() {
	 		ele.otmEasingFlag = false;
	 	});
	}
	$('.otm-border-left').mouseenter(function(){
		if (this.otmEasingFlag != true) {
			this.otmEasingFlag = true;
			grow(this);
		}
		else {
			$(this).stop();
			grow(this);
		}
	});
	$('.otm-border-left').mouseleave(function(){
		if (this.otmEasingFlag != true) {
			this.otmEasingFlag = true;
			shrink(this);
		}
		else {
			$(this).stop();
			shrink(this);
		}
	});
});