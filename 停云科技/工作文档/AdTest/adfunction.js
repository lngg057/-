//����UI��ؽӿ�
function openAdBlock(type, n, param1, param2){
	switch (type){
		case 1:
			if(n == 0){
                //��ǰwebview��תURl
				mapp.ui.openUrl({
					target: 0,
					url: param1
				});
			} else if(n==1){
                //�¿�һ��webview��תURl
				mapp.ui.openUrl({
					target: 1,
					style: 0,
					url: param1
				});
			} else {
                //���������������תURl
				mapp.ui.openUrl({
					target: 2,
					url: param1
				});
			}
			break;
		case 2:
            //��ָ��name��activity������viewController
			mapp.ui.openView({
				name: param1,
				options: {"title": param2},
				onclose: function(data){ alert(data) }
			});
			break;
	}
}