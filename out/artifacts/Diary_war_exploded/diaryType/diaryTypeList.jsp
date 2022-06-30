<%--
  Created by IntelliJ IDEA.
  User: yangehao
  Date: 2021/12/12
  Time: 10:21 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
    .data_list .data_list_title .diaryType_add{
        float: right;
        margin-right: 20px;
    }
</style>
<script type="text/javascript">
    function diaryTypeDelete(diaryTypeId){
        if(confirm("您确定要删除这个日志类别吗？")){
            window.location="diaryType?action=delete&diaryTypeId="+diaryTypeId;
        }
    }
</script>
<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/images/list_icon.png"/>
        日记类别列表
        <span class="diaryType_add">
            <button type="button" class="btn btn-success btn-xs" onclick="javascript:window.location='diaryType?action=preSave'">添加日志类别</button>
        </span>
    </div>
    <div>
        <table class="table table-hover table-striped">
            <tr>
                <th>编号</th>
                <th>类别名称</th>
                <th>操作</th>
            </tr>
            <c:forEach var="diaryType" items="${diaryTypeList }">
                <tr>
                    <td>${diaryType.diaryTypeId }</td>
                    <td>${diaryType.typeName }</td>
                    <td><button type="button" class="btn btn-info btn-xs" onclick="javascript:window.location='diaryType?action=preSave&diaryTypeId=${diaryType.diaryTypeId }'">修改</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="diaryTypeDelete(${diaryType.diaryTypeId })">删除</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div align="center"><font color="red">${error }</font></div>
</div>

