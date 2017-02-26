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
	<table id="dg" title="期刊" class="easyui-datagrid" style="width:800px;height:500px"
        url="../JournalServlet"
        toolbar="#toolbar"
        method="get"
        pagination="true"
        rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
        <tr>
            <th field="id" width="50">id</th>
            <th field="journalName" width="50">期刊名</th>
            <th field="intro" width="50">介绍</th>
            <th field="journalCover" width="50" formatter="coverFormatter">图片</th>
            <th field="journalStyle" width="50">风格</th>
            <th field="journalDate" width="50">创建时间</th>
            <th field="journalAuthor" width="50">作者</th>
            <th field="commentCount" width="50">评论数</th>
        </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
</div>
<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
        closed="true" buttons="#dlg-buttons">
    <div class="ftitle">期刊</div>
    
    <form id="fm" method="post" action="../JournalServlet" ajax="true" enctype="multipart/form-data">
    	<input name="id" type="hidden">
        <div class="fitem">
            <label>期刊名:</label>
            <input name="journalName" class="easyui-textbox" required="true">
        </div>
        <div class="fitem">
            <label>图片:</label>
            <input name="journalCover" class="easyui-filebox" required="true">
        </div>
        <div class="fitem">
            <label>介绍:</label>
            <input name="intro" multiline="true" class="easyui-textbox" required="true">
        </div>
        <div class="fitem">
            <label>风格:</label>
            <input name="journalStyle" class="easyui-textbox" required="true">
        </div>
        <div class="fitem">
            <label>作者:</label>
            <input name="journalAuthor" class="easyui-textbox" required="true">
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
function newUser(){
    $('#dlg').dialog('open').dialog('setTitle','添加期刊');
    $('#fm').form('clear');
}
function saveJournal(){
	$('#fm').form('submit');
	$('#dg').datagrid('reload');
}
function editUser(){
	var row = $('#dg').datagrid('getSelected');
	if (row){
	    $('#dlg').dialog('open').dialog('setTitle','编辑期刊');
	    $('#fm').form('load',row);
	}
}
function destroyUser(){
    var row = $('#dg').datagrid('getSelected');
    if (row){
        $.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){
            if (r){
                $.ajax({
                	url:'../JournalServlet?id='+row.id,
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