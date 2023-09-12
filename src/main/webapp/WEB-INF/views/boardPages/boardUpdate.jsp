<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<div id="section">
  <form action="/board/update" method="post" name="updateForm">
    <input type="text" name="id" value="${board.id}"> <br>
    <input type="text" name="boardTitle" value="${board.boardTitle}" placeholder="제목을 입력하세요"> <br>
    <input type="text" name="boardWriter" value="${board.boardWriter}" placeholder="작성자를 입력하세요" readonly> <br>
    <input type="text" name="boardPass" id="board-pass" placeholder="비밀번호를 입력하세요"> <br>
    <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea> <br>
    <input type="button" value="수정" onclick="board_update()">
  </form>
</div>
</body>
<script>
  const board_update = () => {
    const pass = '${board.boardPass}';
    const inputPass = document.getElementById("board-pass").value;
    if (pass == inputPass) {
      document.updateForm.submit();
    } else {
      alert("비밀번호가 일치하지 않습니다!");
    }
  }
</script>
</html>