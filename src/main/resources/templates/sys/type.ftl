<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>会员管理</title>
    <link rel="stylesheet" type="text/css" href="/static/sys/js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/static/sys/js/themes/icon.css">
    <style type="text/css">
        html,body{width:100%;height:100%;margin:0;padding:0  }
    </style>
    <script type="text/javascript" src="/static/sys/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="/static/sys/js/jquery.easyui.min.1.2.2.js"></script>
    <script type="text/javascript" src="/static/sys/js/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/static/sys/js/Validator.js"></script>

</head>

<body class="easyui-layout">
<div id="careRoadContentDiv" region="center" title="列表" border="false" style="overflow:hidden;">
    <table id="list"></table>
</div>

<div id="dlg" style="padding-top:10px">
    <form id="ff" method="post" enctype="multipart/form-data">
        <input id="id" class="easyui-textbox" name="id" type="hidden">
        <table style="margin: 0 auto;">
            <tr>
                <td>分类:</td>
                <td><input id="name" class="easyui-textbox" type="text" name="sort" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td>英文名称:</td>
                <td><input id="password" class="easyui-textbox" type="text" name="enName" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td>中文名称:</td>
                <td><input id="withdrawPass" class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td>链接地址:</td>
                <td><input id="realName" class="easyui-textbox" type="text" name="url" data-options="required:true"></input></td>
            </tr>
        </table>
    </form>
</div>


<script type="text/javascript">
    $(function(){
        $('#list').datagrid({
            width:600,
            height:600,
            nowrap: false,
            striped: true,
            fit: true,
            idField:'id',
            url:'/sys/type/list-data.json',
            columns:[[
                {field:'sort',title:'分类', align:'center',width:150},
                {field:'enName',title:'英文名称', align:'center',width:150},
                {field:'name',title:'中文名称', align:'center',width:150},
                {field:'url',title:'链接地址', align:'center',width:150},
                {field:'createUser',title:'创建人', align:'center',width:150},
                {field:'createTime',title:'创建时间', align:'center',width:150},
                {field:'updateUser',title:'修改人', align:'center',width:150},
                {field:'updateTime',title:'修改时间', align:'center',width:150},
                {field:'opt', title:'操作', width:160, align:'center', formatter:function(value, rec, index){
                        var c ='';
                        var e ='';
                        var d ='';
                        c='<a href="###" onclick="create()">新增</a>';
                        c += ' | ';
                        e='<a href="###" onclick="editRow('+rec.id+')">编辑</a>';
                        e += ' | ';
                        d='<a href="###" onclick="deleteRow('+rec.id+')">删除</a>';
                        d += ' | ';
                        var f = '<a href="###" onclick="showRow('+ rec.id +')">详情</a>';
                        return c+e+d+f;
                    }},
            ]],
            toolbar:'#jqueryToolbar',
            pagination:true,
            queryParams:{},
            onLoadSuccess:function(data){
                $('#list').datagrid('clearSelections');	//清除掉列表选中记录
                if(data.total==0){
                    $('.datagrid-body-inner').eq(0).addClass("l_elist");
                    $('.datagrid-body').eq(1).append('<div class="r_elist">无数据</div>');
                }else{
                    $('.datagrid-body-inner').eq(0).removeClass("l_elist");
                }
            }
        });

        //设置分页控件
        var p = $('#list').datagrid('getPager');
        $(p).pagination({
            pageSize: 10,//每页显示的记录条数，默认为
            pageList: [10,20,30,40,50],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示第 {from} 到 {to} 条记录   共 {total} 条记录'/*,
			onBeforeRefresh:function(){
				$(this).pagination('loading');
				alert('before refresh');
				$(this).pagination('loaded');
			}*/
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
                console.log("--->",data)
                $('#list').datagrid('reload');
                $('#dlg').dialog('close');
            },
            error: function(msg){
                $.messager.alert('Info', msg, 'info');
            }
        });
    })

    function create() {
        $('#ff').attr("action", "/sys/type/add-data.do");
        $('#dlg').dialog('open').dialog("setTitle", "新增列表");
    }

    function editRow(id) {

    }

    function showRow(id) {

    }

</script>
</body>
</html>