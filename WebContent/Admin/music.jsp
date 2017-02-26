<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/themes/default/easyui.css"/>
<link rel="stylesheet" href="../css/themes/icon.css"/>
<title>Insert title here</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui-lang-zh_CN.js"></script>
<body>
	<div class="header-h">
		<div><a href="<%=request.getContextPath() %>/Admin/index.jsp">期刊</a></div>
		<div><a href="<%=request.getContextPath() %>/Admin/music.jsp">音乐</a></div>
		<div><a href="<%=request.getContextPath() %>/Admin/user.jsp">用户</a></div>
	</div>
	<table id="dg" title="音乐" class="easyui-datagrid" style="width:1000px;height:500px"
        url="../musicServlet"
        toolbar="#toolbar"
        method="get"
        pagination="true"
        rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
        <tr>
            <th field="id" width="20">id</th>
            <th field="journalId" width="20">所属期刊</th>
            <th field="song" width="50">歌曲</th>
            <th field="singer" width="50">艺术家</th>
            <th field="musicStyle" width="50">风格</th>
            <th field="coverSrc" width="50" formatter="coverFormatter">封面</th>
            <th field="musicSrc" width="150">音乐位置</th>
            <th field="likeCnunt" width="50">赞数</th>
        </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newmusic()">添加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editmusic()">编辑</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
</div>
<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
        closed="true" buttons="#dlg-buttons">
    <div class="ftitle">音乐</div>
    
    <form id="fm" method="post" action="../musicServlet" ajax="true" enctype="multipart/form-data">
    	<input name="id" type="hidden">
        <div class="fitem">
            <label>所属期刊:</label>
            <input class="easyui-combobox" name="journalId"
    		data-options="valueField:'id',textField:'journalName',loader:function(param,success,error){
    			$.get('../JournalServlet',{rows:999999,page:1}).then(function(res){
    				success(res.rows);
    			});
    		}">
        </div>
        <div class="fitem">
            <label>歌名:</label>
            <input name="Song" class="easyui-textbox" required="true">
        </div>
        <div class="fitem">
            <label>艺术家:</label>
            <input name="Singer" multiline="true" class="easyui-textbox" required="true">
        </div>
        <div class="fitem">
            <label>风格:</label>
            <input name="musicStyle" multiline="true" class="easyui-textbox" required="true">
        </div>
        <div class="fitem">
            <label>音乐位置:</label>
            <input name="MusicSrc" class="easyui-filebox" required="true">
        </div>
        <div class="fitem">
            <label>封面位置:</label>
            <input name="coverSrc" class="easyui-filebox" required="true">
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveJournal()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>
<script>
var contentPath = "<%=request.getContextPath() %>";
function coverFormatter(value,row,index){
	return '<img src="'+contentPath + "/" + value+'" style="width:40px;height: 29px;"/>';
	//return value;
}
function newmusic(){
    $('#dlg').dialog('open').dialog('setTitle','添加音乐');
    $('#fm').form('clear');
}
function saveJournal(){
	$('#fm').form('submit');
	$('#dg').datagrid('reload');
}
function editmusic(){
	var row = $('#dg').datagrid('getSelected');
	if (row){
	    $('#dlg').dialog('open').dialog('setTitle','Edit Music');
	    $('#fm').form('load',row);
	}
}
function destroyUser(){
    var row = $('#dg').datagrid('getSelected');
    if (row){
        $.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){
            if (r){
                $.ajax({
                	url:'../musicServlet?id='+row.id,
                	type:'delete',
                	dataType: 'json',
                	success:function(result){
                        if (result.success){
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: 'Error',
                                msg: '删除失败！'
                            });
                        }
                    }
                });
            }
        });
    }
}
</script>
</body>
</html>