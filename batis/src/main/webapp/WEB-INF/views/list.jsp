<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function change(my)
{
	//document.pkc.submit();
	my.submit();		
}
//option value가 똑같은 옵션태그가 먼저 나온다.
//요즘 자바스크립트 책보면 value가 더 편해서 없다.
window.onload=function()
{
	document.pkc.rec.value=${rec};	
}



</script>
<body> <!-- list.jsp -->
<!-- 페이지당 레코드 갯수 모든 링크에 값을 전달해야 한다. -->
  <table width="800" align="center">
    <caption> <h3> 게시판 </h3> </caption>
    <tr>
    	<td colspan="4" align="right">
    	<form method="post" name="pkc" action="list">
    		<select name="rec" onchange="change(this.form)">
    		<!-- 혹시나 검색이 있다면 검색관려 값을 hidden으로 추가 -->
    			<option value="10">1페이지당 10</option>
    			<option value="20">1페이지당 20</option>
    			<option value="30">1페이지당 30</option>
    			<option value="50">1페이지당 50</option>
    		</select>
    	</form>
    </tr>
    <tr>
      <td> 작성자 </td>
      <td> 제목 </td>
      <td> 조회수 </td>
      <td> 작성일 </td>
    </tr>
   <c:forEach items="${list}" var="bdto">
    <tr>
      <td> ${bdto.name} </td>
      <td> <a href="readnum?id=${bdto.id}&page=${page}&rec=${rec}"> ${bdto.title} </a> </td>
      <td> ${bdto.readnum} </td>
      <td> ${bdto.writeday} </td>
    </tr>
   </c:forEach>
    <tr>
      <td colspan="4" align="right">
        <a href="write"> 글쓰기 </a>
      </td>
    </tr>
    
    
    
    
    
    
    
    
	<tr align="center">
	<td colspan="4">
	
		<c:if test="${pstart==1}">
			<<
		</c:if>
		<c:if test="${pstart!=1}">
			<a href="list?page=${pstart-1}&rec=${rec}"> << </a>
		</c:if>
		
	
	
	
	
	
		<c:if test="${page==1}">
			<
		</c:if>
		<c:if test="${page!=1}">
			<a href="list?page=${page-1}&rec=${rec}"> < </a>
		</c:if>
		
		
		
		
			<c:forEach begin="${pstart}" end="${pend}" var="i">
					<c:if test="${page==i}">
						<a href="list?page=${i}&rec=${rec}" style="color:red;">${i}</a>	
					</c:if>
					<c:if test="${page!=i}">
						<a href="list?page=${i}&rec=${rec}">${i}</a>	
					</c:if>			
			</c:forEach>
			
			
			
		<c:if test="${page==chong}">
			 > 
		</c:if>
				
			
			
		<c:if test="${page!=chong}">
			<a href="list?page=${page+1}&rec=${rec}"> > </a>
		</c:if>
		
		
		<c:if test="${pend==chong}">
			 >>
		</c:if>
				
			
			
		<c:if test="${page!=chong}">
			<a href="list?page=${pend+1}&rec=${rec}"> >> </a>
		</c:if>
			
		</td>
	</tr>  
  
  
  
  </table>
  
</body>
</html>




