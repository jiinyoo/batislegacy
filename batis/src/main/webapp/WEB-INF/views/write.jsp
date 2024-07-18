<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="writeOk">
  <table width="700" align="center">
    <caption> <h3> 게시판 글쓰기 </h3></caption>
    <tr>
      <td> 제 목 </td>
      <td> <input type="text" name="title" id="title"> </td>
    </tr>
    <tr>
      <td> 작성자 </td>
      <td> <input type="text" name="name" id="name"> </td>
    </tr>
    <tr>
      <td> 비밀번호 </td>
      <td> <input type="password" name="pwd" id="pwd"> </td>
    </tr>
    <tr>
      <td> 내 용 </td>
      <td> <textarea name="content" id="content"></textarea> </td>
    </tr>
    <tr align="center">
      <td colspan="2"> <input type="submit" value="글저장" id="submit"> </td>
    </tr>
  </table>
</body>
</html>