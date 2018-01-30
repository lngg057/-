// JavaScript Document
$.extend({
    basePath: '',
    include: function(file)
    {
        var files = typeof file == "string" ? [file] : file;
        for (var i = 0; i < files.length; i++)
        {
            var name = files[i].replace(/^\s|\s$/g, "");
            var att = name.split('.');
            var ext = att[att.length - 1].toLowerCase();
            var isCSS = ext == "css";
            var tag = isCSS ? "link" : "script";
            var attr = isCSS ? " type='text/css' rel='stylesheet' " : " language='javascript' type='text/javascript' ";
            var link = (isCSS ? "href" : "src") + "='" + $.basePath + name+"?"+ Math.random(1000)*10000 + "'";
            if ($(tag + "[" + link + "]").length == 0) document.write("<" + tag + attr + link + "></" + tag + ">");
        }
    }
});
var skinType="MMS";
//加载jquery easyui 插件
$.include(["../theme/"+"/default/"+"/css/easyui.css","../theme/"+"/default/"+"/css/icon.css","../js/jquery.easyui.min.js"])
//加载系统样式
$.include(["../theme/"+"/default/"+"/css/style.css"])
//加载图表控件
$.include(["../js/highcharts.js"])
