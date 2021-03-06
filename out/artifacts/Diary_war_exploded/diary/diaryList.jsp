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

</style>
<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/images/list_icon.png"/>
        日记列表
    </div>
    <div class="diary_datas">
        <ul>
            <c:forEach var="diary" items="${diaryList }">
                <li>
                    『
                    <fmt:formatDate value="${diary.releaseDate }" type="date" pattern="yyyy-MM-dd"/>』<span>&nbsp;<a href="diary?action=show&diaryId=${diary.diaryId}">${diary.title }</a></span>
                </li>
            </c:forEach>
        </ul>
    </div>
    <nav aria-label="Page navigation" class="text-center">
        <ul class="pagination pagination-c">
            ${pageCode }
        </ul>
    </nav>
</div>

