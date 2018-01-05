<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>新闻管理</title>
    <link rel="stylesheet" type="text/css" href="/static/sys/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/static/sys/js/easyui/themes/icon.css">
    <style type="text/css">
        html,body{width:100%;height:100%;margin:0;padding:0  }
    </style>
    <script type="text/javascript" src="/static/sys/js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="/static/sys/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/static/sys/js/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/static/sys/js/Validator.js"></script>
    <script type="text/javascript">
        $(function(){

            $('#newsDg').datagrid({
                url:'/sys/news/list-data.json'
            });

            $('#dlg').dialog({
                width: 900,
                height: 500,
                closed: true,
                cache: false,
                modal: true,
                onClose: function(){
                    $('#ff').form('clear');
                },
                buttons: [{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                        $('#ff').form('submit');
                    }
                },{
                    text:'取消',
                    handler:function(){
                        $('#dlg').dialog('close');
                    }
                }]
            });

            $('#ff').form({
                success:function(data){
                    data = eval('(' + data + ')');
                    if(1 == data){
                        $('#newsDg').datagrid('reload');
                        $('#dlg').dialog('close');
                    }else if(2 == data){
                        $.messager.alert('提示信息', "操作失败！【已经存在此新闻了】", 'error');
                    }else if(0 == data){
                        $.messager.alert('提示信息', "操作失败！", 'error');
                    }
                },
                error: function(msg){
                    $.messager.alert('Info', msg, 'info');
                }
            });

        });

        //新增新闻
        function addNews(){
            $('#ff').attr("action", "/sys/news/add-data.do");
            $('#dlg').dialog('open').dialog("setTitle", "新增新闻");
        }

        //删除新闻
        function deleteNews(){
            var selectRow = $('#newsDg').datagrid('getSelected');
            if(null == selectRow){
                $.messager.alert('Info', "请选择一行！", 'info');
                return ;
            }
            if(confirm("确定要删除该新闻！")){
                $.ajax({
                    url:"/sys/news/delete-data.do",
                    dataType : "json",
                    data: {id: selectRow.id},
                    cache: false,
                    type: "POST",
                    success : function(data){
                        if(1 == data){
                            $('#newsDg').datagrid('reload');
                        } else if(0 == data){
                            $.messager.alert('提示信息', "删除失败！", 'error');
                        }
                    }
                });
            }
        }

        //修改新闻
        function updateNews(){
            var selectRow = $('#newsDg').datagrid('getSelected');
            if(null == selectRow){
                $.messager.alert('Info', "请选择一行！", 'info');
                return ;
            }
            $('#id').textbox('setValue',selectRow.id);
            $('#type').combobox('setValue',selectRow.type);
            $('#title').textbox('setValue',selectRow.title);
            $('#author').textbox('setValue',selectRow.author);
            $('#content').textbox('setValue',selectRow.content);
            $('#keywords').textbox('setValue',selectRow.keywords);

            $('#ff').attr("action", "/sys/news/update-data.do");
            $('#dlg').dialog('open').dialog("setTitle", "修改新闻");
        }

        //查询新闻
        function searchNews(){
            $('#newsDg').datagrid('reload', {title: $("#searchName").textbox('getText')});
        }

    </script>
</head>
<body>
<table id="newsDg" class="easyui-datagrid" title=""
       data-options="pagination:true, rownumbers:true,fitColumns:true, fit:true,nowrap: false, singleSelect:true, border: false,method:'post',toolbar:'#tb'">
    <thead>
    <tr>
        <th data-options="field:'id',width:110, align:'center'">编号</th>
        <th data-options="field:'typeName',width:110, align:'center'">类型</th>
        <th data-options="field:'title',width:110, align:'center'">标题</th>
        <th data-options="field:'author',width:110, align:'center'">作者</th>
        <th data-options="field:'content',width:110, align:'center'">内容</th>
        <th data-options="field:'keywords',width:110, align:'center'">关键字</th>
    </tr>
    </thead>
</table>
<div id="tb" style="padding:10px 5px 10px;">
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="addNews()">新增</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="deleteNews()">删除</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updateNews()">修改</a>
    <div style="width:550px; float: right;">
        标题: <input id="searchName" class="easyui-textbox" type="text" name="searchName"></input>
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchNews()">查询</a>
    </div>
</div>

<div id="dlg" style="padding-top:5px;">
    <form id="ff" method="post" enctype="multipart/form-data">
        <input id="id" class="easyui-textbox" name="id" type="hidden">
        <table style="margin: 0 auto;">
            <tr>
                <td style="line-height: 40px">类型:</td>
                <td>
                    <select class="easyui-combobox" style="width:650px;" id="type" name="type">
                        <#list typeList as type>
                            <option value=${type.id}>${type.name}</option>
                        </#list>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="line-height: 40px">标题:</td>
                <td><input id="title" class="easyui-textbox" type="text" name="title" data-options="required:true" style="width: 650px"></input></td>
            </tr>
            <tr>
                <td style="line-height: 40px">作者:</td>
                <td><input id="author" class="easyui-textbox" type="text" name="author" data-options="required:true" style="width: 650px"></input></td>
            </tr>
            <tr>
                <td style="line-height: 40px">内容:</td>
                <td><input id="content" class="easyui-textbox" type="text" name="content" data-options="required:true" data-options="multiline:true" style="height:200px;width: 650px"></input></td>
            </tr>
            <tr>
                <td style="line-height: 40px">关键字:</td>
                <td><input id="keywords" class="easyui-textbox" type="text" name="keywords" data-options="required:true" style="width: 650px"></input></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>