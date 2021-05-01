<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="paging">
    <c:if test="${sessionScope.pageSupport.totalPageCount > 1}">
        <div class="tabbar">
            <c:choose>
                <c:when test="${sessionScope.pageSupport.currentPageNo <= 1}">
                    <span class="one-page inactive">首页</span>
                    <span class="back inactive">上一页</span>
                </c:when>
                <c:otherwise>
                    <span onclick="page_nav(1)" class="one-page">首页</span>
                    <span onclick="page_nav(${sessionScope.pageSupport.currentPageNo - 1 })"  class="back">上一页</span>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${sessionScope.pageSupport.currentPageNo >= sessionScope.pageSupport.totalPageCount}">
                    <span class="next inactive">下一页</span>
                    <span class="end-page inactive">尾页</span>
                </c:when>
                <c:otherwise>
                    <span onclick="page_nav(${sessionScope.pageSupport.currentPageNo + 1})" class="next">下一页</span>
                    <span onclick="page_nav(${sessionScope.pageSupport.totalPageCount})" class="end-page">尾页</span>
                </c:otherwise>
            </c:choose>
            <span style="color: #888888;">第 ${sessionScope.pageSupport.currentPageNo} 页，共 ${sessionScope.pageSupport.totalPageCount} 页</span>
        </div>
        <div class="goto">
            <select id="selIndex">
                <option value="0">页码</option>
                <c:forEach begin="1" end="${sessionScope.pageSupport.totalPageCount}" var="pageNo">
                    <option value="${pageNo}">${pageNo}</option>
                </c:forEach>
            </select>
            <button onclick="jump_to()">GO</button>
        </div>
    </c:if>
</div>