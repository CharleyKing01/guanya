<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>参数管理</title>
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

            $('#codeTableDg').datagrid({
                url:'/sys/codeTable/list-data.json'
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
                        $('#codeTableDg').datagrid('reload');
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
        function addCodeTable(){
            $('#ff').attr("action", "/sys/codeTable/add-data.do");
            $('#dlg').dialog('open').dialog("setTitle", "新增新闻");
        }

        //删除新闻
        function deleteCodeTable(){
            var selectRow = $('#codeTableDg').datagrid('getSelected');
            if(null == selectRow){
                $.messager.alert('Info', "请选择一行！", 'info');
                return ;
            }
            if(confirm("确定要删除该新闻！")){
                $.ajax({
                    url:"/sys/codeTable/delete-data.do",
                    dataType : "json",
                    data: {id: selectRow.id},
                    cache: false,
                    type: "POST",
                    success : function(data){
                        if(1 == data){
                            $('#codeTableDg').datagrid('reload');
                        } else if(0 == data){
                            $.messager.alert('提示信息', "删除失败！", 'error');
                        }
                    }
                });
            }
        }

        //修改新闻
        function updateCodeTable(){
            var selectRow = $('#codeTableDg').datagrid('getSelected');
            if(null == selectRow){
                $.messager.alert('Info', "请选择一行！", 'info');
                return ;
            }
            $('#id').textbox('setValue',selectRow.id);
            $('#codeType').textbox('setValue',selectRow.codeType);
            $('#codeKey').textbox('setValue',selectRow.codeKey);
            $('#codeValue').textbox('setValue',selectRow.codeValue);
            $('#codeName').textbox('setValue',selectRow.codeName);
            $('#orderNum').textbox('setValue',selectRow.orderNum);
            $('#remark').textbox('setValue',selectRow.remark);
            $('#ff').attr("action", "/sys/codeTable/update-data.do");
            $('#dlg').dialog('open').dialog("setTitle", "修改参数");
        }

        //查询新闻
        function searchCodeTable(){
            $('#codeTableDg').datagrid('reload', {title: $("#searchName").textbox('getText')});
        }

    </script>
</head>
<body>
<table id="codeTableDg" class="easyui-datagrid" title=""
       data-options="pagination:true, rownumbers:true,fitColumns:true, fit:true,nowrap: false, singleSelect:true, border: false,method:'post',toolbar:'#tb'">
    <thead>
    <tr>
        <th data-options="field:'id',width:110, align:'center'">编号</th>
        <th data-options="field:'codeType',width:110, align:'center'">类型</th>
        <th data-options="field:'codeKey',width:110, align:'center'">参数键</th>
        <th data-options="field:'codeValue',width:110, align:'center'">参数值</th>
        <th data-options="field:'codeName',width:110, align:'center'">参数名称</th>
        <th data-options="field:'orderNum',width:110, align:'center'">排序</th>
        <th data-options="field:'remark',width:110, align:'center'">备注</th>
    </tr>
    </thead>
</table>
<div id="tb" style="padding:10px 5px 10px;">
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="addCodeTable()">新增</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="deleteCodeTable()">删除</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updateCodeTable()">修改</a>
    <div style="width:550px; float: right;">
        标题: <input id="searchName" class="easyui-textbox" type="text" name="searchName"></input>
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchCodeTable()">查询</a>
    </div>
</div>

<div id="dlg" style="padding-top:5px;">
    <form id="ff" method="post" enctype="multipart/form-data">
        <input id="id" class="easyui-textbox" name="id" type="hidden">
        <table style="margin: 0 auto;">
            <tr>
                <td style="line-height: 40px">类型:</td>
                <td><input id="codeType" class="easyui-textbox" type="text" name="codeType" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td style="line-height: 40px">参数键:</td>
                <td><input id="codeKey" class="easyui-textbox" type="text" name="codeKey" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td style="line-height: 40px">参数值:</td>
                <td><input id="codeValue" class="easyui-textbox" type="text" name="codeValue" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td style="line-height: 40px">参数名称:</td>
                <td><input id="codeName" class="easyui-textbox" type="text" name="codeName" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td style="line-height: 40px">排序:</td>
                <td><input id="orderNum" class="easyui-textbox" type="text" name="orderNum" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td style="line-height: 40px">备注:</td>
                <td><input id="remark" class="easyui-textbox" type="text" name="remark" data-options="multiline:true" style="height:80px;"></input></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>