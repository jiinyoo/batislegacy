<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <form method="post" action="updateOk">
  <input type="hidden" name="id" value="${mdto.id}">
  <input type="hidden" name="page" value="${page}">
  <input type="hidden" name="rec" value="${rec}">
  <table width="700" align="center">
    <caption> <h3> 게시판 글쓰기 </h3></caption>
    <tr>
      <td> 제 목 </td>
      <td> <input type="text" name="title" id="title" value="${mdto.title}"> </td>
    </tr>
    <tr>
      <td> 작성자 </td>
      <td> <input type="text" name="name" id="name" value="${mdto.name}"> </td>
    </tr>
    <tr>
      <td> 비밀번호 </td>
      <td>
        <input type="password" name="pwd" id="pwd"> 
      <c:if test="${err==1}">
        <span style="color:red;font-size:12px"> 
          비밀번호가 일치하지 않습니다.
        </span>
      </c:if>
      </td>
    </tr>
    <tr>
      <td> 내 용 </td>
      <td> <textarea name="content" id="content">${mdto.content}</textarea> </td>
    </tr>
    <tr align="center">
      <td colspan="2"> <input type="submit" value="글수정" id="submit"> </td>
    </tr>
  </table>
 </form>
</body>
</html>