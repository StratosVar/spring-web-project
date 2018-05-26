<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="/js/myscript.js"></script>
</head>
<body>

<div class="container">
  <h2>Basic Table</h2>
  <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>            
  <table class="table" id="messages">
    <thead>
      <tr>
        <th>Message id</th>
        <th>text</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
    </tbody>
  </table>
</div>
	<form action=#>
		text:<br> <input type="text" name="text" id="text">
		<!-- to id diavazei to ajax -->
		<input type="submit" value="Submit" id="add-message">
	</form>

<p><span><b>Second form</span></p>
	<form action=#>
		First name:<br> <input type="text" id="text_update" value="" > <br> 
		Last name:<br> <input type="text"  id="id"> <br><br> 
		<button type="Submit" id="update-message">Submit</button>
	</form>



</body>
</html>
