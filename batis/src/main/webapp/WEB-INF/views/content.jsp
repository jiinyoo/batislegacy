<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         

 <table width="700" align="center">
     <caption> <h3> 게시판 내용 </h3></caption>
     <tr>
       <td> 제 목 </td>
       <td colspan="3"> ${mdto.title} </td>
     </tr>
     <tr>
       <td width="100"> 작성자 </td>
       <td width="250"> ${mdto.name} </td>
       <td width="100"> 조회수 </td>
       <td width="250"> ${mdto.readnum} </td>
     </tr>
     <tr>
       <td> 작성일 </td>
       <td colspan="3"> ${mdto.writeday} </td>
     </tr>
     <tr height="200">
       <td> 내 용 </td>
       <td colspan="3"> ${mdto.content} </td>
     </tr>
     <tr>
       <td colspan="4" align="center">
        <a href="list?page=${page}&rec=${rec}" id="btn1"> 목록 </a>
        <a href="update?id=${mdto.id}&page=${page}&rec=${rec}" id="btn2"> 수정 </a>
        <a href="javascript:viewform()" id="btn3"> 삭제 </a>
       </td>
     </tr>
   <c:if test="${err==1}">     
     <tr id="errView">
       <td colspan="4" align="center">
         <span style="color:red;font-size:12px">
           입력하신 비밀번호가 일치하지 않습니다.
         </span>
       </td>
     </tr>
   </c:if>
     <tr id="delform">
       <td colspan="4" align="center">
         <form method="post" action="delete">
           <input type="hidden" name="id" value="${mdto.id}">
           <input type="hidden" name="page" value="${page}">
           <input type="hidden" name="rec" value="${rec}">
           비밀번호 <input type="password" name="pwd">
           <input type="submit" value="삭제">
         </form>
       </td>
     </tr>
   </table>

  <script>
    function viewform() // 숨어있는 id="delform"요소를 보이게 하기
    {
    	// id="errView"를 숨겨라
    	if(document.getElementById("errView")!=null)
    	{
    		document.getElementById("errView").style.display="none";
    	}	
         	
    	document.getElementById("delform").style.display="table-row";
    }
  </script>
  <style>
   #delform {
      display:none;
      /* visibility:hidden; */
   }
  </style>
</body>
</html>