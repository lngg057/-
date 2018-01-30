requirejs.config({
	baseUrl:'',
	paths:{
		'jquery'	:	'jquery',
		'amazeui' 	: 	'amazeui',
		'jsbridge'  :	'LDJSBridge',
        'adfunction':   'adfunction'
		
	},
	urlArgs : "bust=20170122",
	waitSeconds: 0
})

require(['jquery', 'amazeui', 'jsbridge','adfunction'],function($, amazeui, jsbridge, adfunction){
	
});