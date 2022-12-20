<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./_header.jsp"/>
<main id="board">
    <section class="list">                
        <form action="#">
            <input type="text" name="search" placeholder="제목 키워드, 글쓴이 검색">
            <input type="submit" value="검색">
        </form>
        
        <table border="0">
            <caption>글목록</caption>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>
            <c:forEach var="article" items="${articles}">
            	<c:set var="i" value="${i + 1}"/>
		            <tr>
		                <td>${vo.pageStartNum - i}</td>
		                <td><a href="/Jboard2/view.do?no=${article.no}&pg=${vo.currentPg}">${article.title}[${article.comment}]</a></td>
		                <td>${article.nick}</td>
		                <td>${article.rdate}</td>
		                <td>${article.hit}</td>
		            </tr>
            </c:forEach>
        </table>
		
        <div class="page">
        	<c:if test="${vo.pageGroupStart gt 1}">
           		<a href="/Jboard2/list.do?pg=${vo.pageGroupStart - 1}" class="prev">이전</a>
            </c:if>
            <c:forEach var="i" begin="${vo.pageGroupStart}" end="${vo.pageGroupEnd}">
            	<a href="/Jboard2/list.do?pg=${i}" class="num ${vo.currentPg eq i ? 'current':'off'}">${i}</a>
		    </c:forEach>
		    <c:if test="${vo.pageGroupEnd lt vo.lastPageNum}">
	            <a href="/Jboard2/list.do?pg=${vo.pageGroupEnd + 1}" class="next">다음</a>
            </c:if>
        </div>

        <a href="/Jboard2/write.do" class="btn btnWrite">글쓰기</a>
        
    </section>
</main>
<jsp:include page="./_footer.jsp"/>