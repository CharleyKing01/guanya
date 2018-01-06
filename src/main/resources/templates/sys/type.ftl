<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>类别管理</title>
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

            $('#typeDg').datagrid({
                url:'/sys/type/list-data.json'
            });

            $('#dlg').dialog({
                width: 400,
                height: 390,
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
                        $('#typeDg').datagrid('reload');
                        $('#dlg').dialog('close');
                    }else if(2 == data){
                        $.messager.alert('提示信息', "操作失败！【已经存在此分类了】", 'error');
                    }else if(0 == data){
                        $.messager.alert('提示信息', "操作失败！", 'error');
                    }
                },
                error: function(msg){
                    $.messager.alert('Info', msg, 'info');
                }
            });

        });

        //新增分类
        function addType(){
            $('#ff').attr("action", "/sys/type/add-data.do");
            $('#dlg').dialog('open').dialog("setTitle", "新增分类");
        }

        //删除分类
        function deleteType(){
            var selectRow = $('#typeDg').datagrid('getSelected');
            if(null == selectRow){
                $.messager.alert('Info', "请选择一行！", 'info');
                return ;
            }
            if(confirm("确定要删除该分类！")){
                $.ajax({
                    url:"/sys/type/delete-data.do",
                    dataType : "json",
                    data: {id: selectRow.id},
                    cache: false,
                    type: "POST",
                    success : function(data){
                        if(1 == data){
                            $('#typeDg').datagrid('reload');
                        } else if(0 == data){
                            $.messager.alert('提示信息', "删除失败！", 'error');
                        }
                    }
                });
            }
        }

        //修改分类
        function updateType(){
            var selectRow = $('#typeDg').datagrid('getSelected');
            if(null == selectRow){
                $.messager.alert('Info', "请选择一行！", 'info');
                return ;
            }
            $('#id').textbox('setValue',selectRow.id);
            $('#sort').textbox('setValue',selectRow.sort);
            $('#enName').textbox('setValue',selectRow.enName);
            $('#name').textbox('setValue',selectRow.name);
            $('#url').textbox('setValue',selectRow.url);

            $('#ff').attr("action", "/sys/type/update-data.do");
            $('#dlg').dialog('open').dialog("setTitle", "修改分类");
        }

        //查询分类
        function searchType(){
            $('#typeDg').datagrid('reload', {name: $("#searchName").textbox('getText')});
        }

    </script>
</head>
<body>
<table id="typeDg" class="easyui-datagrid" title=""
       data-options="pagination:true, rownumbers:true,fitColumns:true, fit:true,nowrap: false, singleSelect:true, border: false,method:'post',toolbar:'#tb'">
    <thead>
    <tr>
        <th data-options="field:'id',width:110, align:'center'">编号</th>
        <th data-options="field:'sort',width:110, align:'center'">类型</th>
        <th data-options="field:'enName',width:110, align:'center'">英文名称</th>
        <th data-options="field:'name',width:110, align:'center'">中文名称</th>
        <th data-options="field:'url',width:110, align:'center'">链接地址</th>
    </tr>
    </thead>
</table>
<div id="tb" style="padding:10px 5px 10px;">
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="addType()">新增</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="deleteType()">删除</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updateType()">修改</a>
    <div style="width:550px; float: right;">
        中文名称: <input id="searchName" class="easyui-textbox" type="text" name="searchName"></input>
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchType()">查询</a>
    </div>
</div>

<div id="dlg" style="padding-top:10px">
    <form id="ff" method="post" enctype="multipart/form-data">
        <input id="id" class="easyui-textbox" name="id" type="hidden">
        <table style="margin: 0 auto;">
            <tr>
                <td>类型:</td>
                <td><input id="sort" class="easyui-textbox" type="text" name="sort" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td>英文名称:</td>
                <td><input id="enName" class="easyui-textbox" type="text" name="enName" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td>中文名称:</td>
                <td><input id="name" class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td>链接地址:</td>
                <td><input id="url" class="easyui-textbox" type="text" name="url" data-options="required:false"></input></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>