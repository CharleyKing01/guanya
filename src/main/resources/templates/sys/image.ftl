<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>图片管理</title>
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

            $('#imageDg').datagrid({
                url:'/sys/image/list-data.json'
            });

            $('#dlg').dialog({
                width: 800,
                height: 450,
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

                    $('#imageDg').datagrid('reload');
                    $('#dlg').dialog('close');

                },
                error: function(msg){
                    $.messager.alert('Info', msg, 'info');
                }
            });

        });

        //新增图片
        function addPicture(){
            $('#ff').attr("action", "/sys/image/add-data.do");
            $('#dlg').dialog('open').dialog("setTitle", "图片新增");
        }

        //删除图片
        function deletePicture(){
            if(confirm("确定要删除吗？")){
                var selectRow = $('#imageDg').datagrid('getSelected');
                if(null == selectRow){
                    $.messager.alert('Info', "请选择一行！", 'info');
                    return ;
                }
                $.ajax({
                    url:"/sys/image/delete-data.do",
                    dataType : "json",
                    data: {id: selectRow.id},
                    cache: false,
                    type: "POST",
                    success : function(data){
                        if(1 == data){
                            $('#imageDg').datagrid('reload');
                        } else if(0 == data){
                            $.messager.alert('提示信息', "删除失败！", 'error');
                        }
                    }
                });
            }
        }

        //图片修改
        function editPicture(){
            var selectRow = $('#imageDg').datagrid('getSelected');
            if(null == selectRow){
                $.messager.alert('Info', "请选择一行！", 'info');
                return ;
            }
            $('#id').textbox('setValue',selectRow.id);
            $('#remark').val(selectRow.remark);
            $('#ff').attr("action", "/sys/image/update-data.do");
            $('#dlg').dialog('open').dialog("setTitle", "图片修改");
        }

        function imgFormatter(value,row,index){
            if('' != value && null != value)
                value = '<img style="width:100px; height:100px" src="' + value + '">';
            return  value;
        }
    </script>
</head>
<body>


<table id="imageDg" class="easyui-datagrid" title=""
       data-options="pagination:true, rownumbers:true,fitColumns:true, fit:true,
					singleSelect:true,
					border: false,
					nowrap: false,
					method:'post',
					toolbar:'#tb'">
    <thead>
    <tr>
        <th data-options="field:'typeName',width:150,align:'center'">类型</th>
        <th data-options="field:'name',width:150,align:'center'">名称</th>
        <th data-options="field:'remark',width:150,align:'center'">备注</th>
        <th data-options="field:'url',width:150,align:'center',formatter: imgFormatter">图片</th>
    </tr>
    </thead>
</table>

<div id="tb" style="padding:10px 5px 10px;">
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="deletePicture()">删除</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editPicture()">修改</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="addPicture()">新增</a>
</div>
<div id="dlg" style="padding-top:10px">
    <form id="ff" method="post" enctype="multipart/form-data">
        <input id="id" class="easyui-textbox" name="id" type="hidden">
        <table style="margin: 0 auto;">
            <tr>
                <td>类型:</td>
                <td>
                    <select class="easyui-combobox" id="type" name="type">
                        <#list typeList as type>
                            <option value=${type.id}>${type.name}</option>
                        </#list>
                    </select>
                </td>
            </tr>
            <tr>
                <td><div id="p1">上传图片:</div></td>
                <td><div id="p2"><input id="imgUrlUpload" class="easyui-filebox" name="imgUrlUpload" style="width: 170px" data-options="required:false"></input></div></td>
            </tr>
            <tr>
                <td style="line-height: 40px">备注:</td>
                <td><input id="remark" class="easyui-textbox" type="text" name="remark" data-options="required:false" data-options="multiline:true" style="height:100px;"></input></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>