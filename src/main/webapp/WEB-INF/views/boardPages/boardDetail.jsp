<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<div id="section">
  <table>
    <tr>
      <th>id</th>
      <td>${board.id}</td>
    <tr>
      <th>writer</th>
      <td>${board.boardWriter}</td>
    </tr>
    <tr>
      <th>date</th>
      <td>${board.createdAt}</td>
    </tr>
    <tr>
      <th>hits</th>
      <td>${board.boardHits}</td>
    </tr>
    <tr>
      <th>title</th>
      <td>${board.boardTitle}</td>
    </tr>
    <tr>
      <th>contents</th>
      <td>${board.boardContents}</td>
    </tr>
    <c:if test="${board.fileAttached == 1}">
      <tr>
        <th>image</th>
        <td>
          <c:forEach items="${boardFileList}" var="boardFile">
              <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                  alt="" width="100" height="100">
          </c:forEach>
        </td>
      </tr>
    </c:if>
  </table>
  <button onclick="board_list()">목록</button>
  <button onclick="board_update()">수정</button>
  <button onclick="board_delete()">삭제</button>

  <div id="pass-check" style="display: none;">
    <input type="text" id="board-pass" placeholder="비밀번호 입력하세요">
    <input type="button" onclick="pass_check()" value="확인">
  </div>
</div>
</body>
<script>
  const board_list = () => {
    location.href = "/board/";
  }
  const board_update = () => {
    const id = '${board.id}';
    location.href = "/board/update?id=" + id;
  }
  const board_delete = () => {
    const passArea = document.getElementById("pass-check");
    passArea.style.display = "block";
  }
  const pass_check = () => {
    const inputPass = document.getElementById("board-pass").value;
    const pass = '${board.boardPass}';
    const id = '${board.id}';
    if (inputPass == pass) {
      location.href = "/board/delete?id=" + id;
    } else {
      alert("비밀번호 불일치!");
    }
  }
</script>
</html>