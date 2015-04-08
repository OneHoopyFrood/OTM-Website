$(function () {
	var selector = '.otm-border-left.expander';
	var inSpeed = 250;
	var outSpeed = 550;

	var shrink = function (ele) {
		$(ele).animate({ padding: '5px 10px;' }, inSpeed, 'easeOutBack', function() { 
			ele.otmEasingFlag = false; 
		});
	}
	var grow = function (ele) {
		$(ele).animate({ padding: '10px 10px;' }, outSpeed, 'easeInOutQuad', function() {
	 		ele.otmEasingFlag = false;
	 	});
	}
	$(selector).mouseenter(function(){
		if (this.otmEasingFlag != true) {
			this.otmEasingFlag = true;
			grow(this);
		}
		else {
			$(this).stop();
			grow(this);
		}
	});
	$(selector).mouseleave(function(){
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