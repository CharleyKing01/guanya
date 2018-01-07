<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>冠亚集团</title>
    <link rel="stylesheet" type="text/css" href="/static/sys/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/static/sys/js/easyui/themes/icon.css">
    <script type="text/javascript" src="/static/sys/js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="/static/sys/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        $(function(){

            $('#typeManageTree').tree({
                data: [{
                    "id":1,
                    "text":"类别",
                    "attributes": "/sys/type/list.do"
                }
                ],
                onClick: function(node){
                    var item = {text: node.text, id: node.id, href: node.attributes}
                    addTab(item, true);
                }
            });
            $('#imageManageTree').tree({
                data: [{
                    "id":1,
                    "text":"图片",
                    "attributes": "/sys/image/list.do"
                }
                ],
                onClick: function(node){
                    var item = {text: node.text, id: node.id, href: node.attributes}
                    addTab(item, true);
                }
            });
            $('#newsManageTree').tree({
                data: [{
                    "id":1,
                    "text":"新闻",
                    "attributes": "/sys/news/list.do"
                }],
                onClick: function(node){
                    var item = {text: node.text, id: node.id, href: node.attributes}
                    addTab(item, true);
                }
            });
            $('#sysManageTree').tree({
                data: [{
                    "id":1,
                    "text":"用户",
                    "attributes": "/user/user.jsp"
                },
                    {
                        "id":2,
                        "text":"参数设置",
                        "attributes": "/sys/codeTable/list.do"
                    }
                ],
                onClick: function(node){
                    var item = {text: node.text, id: node.id, href: node.attributes}
                    addTab(item, true);
                }
            });
        })


    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'north'" style="height:80px; overflow: hidden;">
    <div style="text-align: right;">
        <center style="font-size: 30px; font-weight: bolder; line-height: 80px;vertical-align: middle;">冠亚集团</center>
        <a href="javascript:exit()"><p style="margin-top: -25px;margin-right: 100px;font-weight: bolder;">安全退出</p></a>
    </div>
</div>
<div data-options="region:'west',title:'功能菜单',split:true" style="width:180px;">
    <div id="menu" class="easyui-accordion" data-options="border: false, multiple: false, fit:false, width: 170, height: 250">
        <div title="类别管理">
            <ul id="typeManageTree">
            </ul>
        </div>
        <div title="图片管理">
            <ul id="imageManageTree">
            </ul>
        </div>
        <div title="新闻管理">
            <ul id="newsManageTree">
            </ul>
        </div>
        <div title="系统管理">
            <ul id="sysManageTree">
            </ul>
        </div>
    </div>
</div>
<div data-options="region:'center',title:''" style="background:#eee;">
    <div data-options="fit:true, border:false" id="tabs" class="easyui-tabs">

    </div>
</div>
<script type="text/javascript">

    function addTab(item, closable) {
        if ($('#tabs').tabs('exists', item.text)) {
            $('#tabs').tabs('select', item.text);//选中
        } else {
            var content = createFrame(item.href, item.id);
            $('#tabs').tabs('add', {
                title : item.text,
                content : content,
                closable : closable
            });
        }
        tabClose();
    }

    function createFrame(url, id) {
        var s = '<iframe id="iframe' + id + '" scrolling="no" frameborder="0"  src="' + url + '" style="width:100%;height:99%;"></iframe>';
        return s;
    }

    function tabClose() {
        /*双击关闭TAB选项卡*/
        $(".tabs-inner").dblclick(function() {
            var subtitle = $(this).children(".tabs-closable").text();
            $('#tabs').tabs('close', subtitle);
        });
    }

    function exit(){
        $.ajax({
            url:"/sysUser/exit.action",
            dataType : "json",
            type: "POST",
            success : function(data){
                if(data==1){
                    window.location.href="/login.jsp";
                } else {
                    alert("系统异常，请联系管理员！");
                }
            }
        });
    }
</script>
</body>
</html>