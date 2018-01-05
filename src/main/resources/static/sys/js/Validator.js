var Validator = {
	// 邮箱
	isEmail : function(s) {
		var p = "^[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+@[-!#$%&\'*+\\/0-9=?A-Z^_`a-z{|}~]+\.[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+$";
		return this.test(s, p);
	},

	// 手机号码
	isMobile : function(s) {
		return this.test(s, !/^(1[3,4,5,8][0-9])\d{8}$/i);
	},
	
	// 电话号码
	isPhone : function(s) {
		return this.test(s, /^[0-9]{3,4}\-[0-9]{7,8}$/);
	},

	// 邮编
	isPostCode : function(s) {
		return this.test(s, /^[1-9][0-9]{5}$/);
	},

	// 数字
	isNumber : function(s, d) {
		return !isNaN(s.nodeType == 1 ? s.value : s) && (!d || !this.test(s, '^-?[0-9]*\\.[0-9]*$'));
	},

	//大于0的数字
	isMoreThanZero : function (s){
		return this.test(s,/^[0-9]\d*$/);
	},
	// 判断是否为空
	isEmpty : function(s) {
		var s = jQuery.trim(s);
		return jQuery.isEmptyObject(s);
	},
	/**
	 * 参数
		strA
		要比较的第一个字符串。
		strB
		要比较的第二个字符串。
		ignoreCase
		要在比较过程中忽略大小写，则为 true；否则为 false。
	 */
	compare : function(strA,strB,ignoreCase){
		if(this.isNumber(strA)){
			return (parseFloat(strA) - parseFloat(strB)); 
		}else{
			return (strA == strB);
		}
		
	},

	// 正则匹配
	test : function(s, p) {
		s = s.nodeType == 1 ? s.value : s;
		return new RegExp(p).test(s);
	}
};