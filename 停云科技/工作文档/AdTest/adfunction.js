//调用UI相关接口
function openAdBlock(type, n, param1, param2){
	switch (type){
		case 1:
			if(n == 0){
                //当前webview跳转URl
				mapp.ui.openUrl({
					target: 0,
					url: param1
				});
			} else if(n==1){
                //新开一个webview跳转URl
				mapp.ui.openUrl({
					target: 1,
					style: 0,
					url: param1
				});
			} else {
                //调用浏览器进行跳转URl
				mapp.ui.openUrl({
					target: 2,
					url: param1
				});
			}
			break;
		case 2:
            //打开指定name的activity或者是viewController
			mapp.ui.openView({
				name: param1,
				options: {"title": param2},
				onclose: function(data){ alert(data) }
			});
			break;
	}
}