<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<html>
<head>
<style>
input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit], button {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

html {
	background:
		url('file:///Users/parikshitnarang/eclipse-workspace/DBMS/WebContent/admin2.jpeg')
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	background-attachment: fixed;
	opacity: 0.8;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	position: absolute;
	z-index: -1;
}

h1, h3 {
	color: white;
}

div, code {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	opacity: 0.8
}

#container {
  width: 500px;
  margin: auto;
}

/*Neon*/
p {
  text-align: center;
  font-size: 2em;
  margin: 20px 0 20px 0;
}

a {
  text-decoration: none;
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  transition: all 0.5s;
}

p:nth-child(1) a {
  color: #fff;
  font-family: Monoton;
  -webkit-animation: neon1 1.5s ease-in-out infinite alternate;
  -moz-animation: neon1 1.5s ease-in-out infinite alternate;
  animation: neon1 1.5s ease-in-out infinite alternate;
}

p:nth-child(1) a:hover {
  color: #FF1177;
  -webkit-animation: none;
  -moz-animation: none;
  animation: none;
}

p:nth-child(2) a {
  font-size: 1.5em;
  color: #228DFF;
  font-family: Iceland;
}

p:nth-child(2) a:hover {
  -webkit-animation: neon2 1.5s ease-in-out infinite alternate;
  -moz-animation: neon2 1.5s ease-in-out infinite alternate;
  animation: neon2 1.5s ease-in-out infinite alternate;
}

p:nth-child(3) a {
  color: #FFDD1B;
  font-family: Pacifico;
}

p:nth-child(3) a:hover {
  -webkit-animation: neon3 1.5s ease-in-out infinite alternate;
  -moz-animation: neon3 1.5s ease-in-out infinite alternate;
  animation: neon3 1.5s ease-in-out infinite alternate;
}

p:nth-child(4) a {
  color: #B6FF00;
  font-family: "Press Start 2P";
  font-size: 0.8em;
}

p:nth-child(4) a:hover {
  -webkit-animation: neon4 1.5s ease-in-out infinite alternate;
  -moz-animation: neon4 1.5s ease-in-out infinite alternate;
  animation: neon4 1.5s ease-in-out infinite alternate;
}

p:nth-child(5) a {
  color: #FF9900;
  font-family: Audiowide;
}

p:nth-child(5) a:hover {
  -webkit-animation: neon5 1.5s ease-in-out infinite alternate;
  -moz-animation: neon5 1.5s ease-in-out infinite alternate;
  animation: neon5 1.5s ease-in-out infinite alternate;
}

p:nth-child(6) a {
  color: #BA01FF;
  font-family: Vampiro One;
}

p:nth-child(6) a:hover {
  -webkit-animation: neon6 1.5s ease-in-out infinite alternate;
  -moz-animation: neon6 1.5s ease-in-out infinite alternate;
  animation: neon6 1.5s ease-in-out infinite alternate;
}

p a:hover {
  color: #ffffff;
}
/*glow for webkit*/

@-webkit-keyframes neon1 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FF1177, 0 0 70px #FF1177, 0 0 80px #FF1177, 0 0 100px #FF1177, 0 0 150px #FF1177;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF1177, 0 0 35px #FF1177, 0 0 40px #FF1177, 0 0 50px #FF1177, 0 0 75px #FF1177;
  }
}

@-webkit-keyframes neon2 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #228DFF, 0 0 70px #228DFF, 0 0 80px #228DFF, 0 0 100px #228DFF, 0 0 150px #228DFF;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #228DFF, 0 0 35px #228DFF, 0 0 40px #228DFF, 0 0 50px #228DFF, 0 0 75px #228DFF;
  }
}

@-webkit-keyframes neon3 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FFDD1B, 0 0 70px #FFDD1B, 0 0 80px #FFDD1B, 0 0 100px #FFDD1B, 0 0 150px #FFDD1B;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FFDD1B, 0 0 35px #FFDD1B, 0 0 40px #FFDD1B, 0 0 50px #FFDD1B, 0 0 75px #FFDD1B;
  }
}

@-webkit-keyframes neon4 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #B6FF00, 0 0 70px #B6FF00, 0 0 80px #B6FF00, 0 0 100px #B6FF00, 0 0 150px #B6FF00;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #B6FF00, 0 0 35px #B6FF00, 0 0 40px #B6FF00, 0 0 50px #B6FF00, 0 0 75px #B6FF00;
  }
}

@-webkit-keyframes neon5 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FF9900, 0 0 70px #FF9900, 0 0 80px #FF9900, 0 0 100px #FF9900, 0 0 150px #FF9900;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF9900, 0 0 35px #FF9900, 0 0 40px #FF9900, 0 0 50px #FF9900, 0 0 75px #FF9900;
  }
}

@-webkit-keyframes neon6 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #ff00de, 0 0 70px #ff00de, 0 0 80px #ff00de, 0 0 100px #ff00de, 0 0 150px #ff00de;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #ff00de, 0 0 35px #ff00de, 0 0 40px #ff00de, 0 0 50px #ff00de, 0 0 75px #ff00de;
  }
}
/*glow for mozilla*/

@-moz-keyframes neon1 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FF1177, 0 0 70px #FF1177, 0 0 80px #FF1177, 0 0 100px #FF1177, 0 0 150px #FF1177;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF1177, 0 0 35px #FF1177, 0 0 40px #FF1177, 0 0 50px #FF1177, 0 0 75px #FF1177;
  }
}

@-moz-keyframes neon2 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #228DFF, 0 0 70px #228DFF, 0 0 80px #228DFF, 0 0 100px #228DFF, 0 0 150px #228DFF;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #228DFF, 0 0 35px #228DFF, 0 0 40px #228DFF, 0 0 50px #228DFF, 0 0 75px #228DFF;
  }
}

@-moz-keyframes neon3 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FFDD1B, 0 0 70px #FFDD1B, 0 0 80px #FFDD1B, 0 0 100px #FFDD1B, 0 0 150px #FFDD1B;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FFDD1B, 0 0 35px #FFDD1B, 0 0 40px #FFDD1B, 0 0 50px #FFDD1B, 0 0 75px #FFDD1B;
  }
}

@-moz-keyframes neon4 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #B6FF00, 0 0 70px #B6FF00, 0 0 80px #B6FF00, 0 0 100px #B6FF00, 0 0 150px #B6FF00;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #B6FF00, 0 0 35px #B6FF00, 0 0 40px #B6FF00, 0 0 50px #B6FF00, 0 0 75px #B6FF00;
  }
}

@-moz-keyframes neon5 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FF9900, 0 0 70px #FF9900, 0 0 80px #FF9900, 0 0 100px #FF9900, 0 0 150px #FF9900;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF9900, 0 0 35px #FF9900, 0 0 40px #FF9900, 0 0 50px #FF9900, 0 0 75px #FF9900;
  }
}

@-moz-keyframes neon6 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #ff00de, 0 0 70px #ff00de, 0 0 80px #ff00de, 0 0 100px #ff00de, 0 0 150px #ff00de;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #ff00de, 0 0 35px #ff00de, 0 0 40px #ff00de, 0 0 50px #ff00de, 0 0 75px #ff00de;
  }
}
/*glow*/

@keyframes neon1 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FF1177, 0 0 70px #FF1177, 0 0 80px #FF1177, 0 0 100px #FF1177, 0 0 150px #FF1177;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF1177, 0 0 35px #FF1177, 0 0 40px #FF1177, 0 0 50px #FF1177, 0 0 75px #FF1177;
  }
}

@keyframes neon2 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #228DFF, 0 0 70px #228DFF, 0 0 80px #228DFF, 0 0 100px #228DFF, 0 0 150px #228DFF;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #228DFF, 0 0 35px #228DFF, 0 0 40px #228DFF, 0 0 50px #228DFF, 0 0 75px #228DFF;
  }
}

@keyframes neon3 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FFDD1B, 0 0 70px #FFDD1B, 0 0 80px #FFDD1B, 0 0 100px #FFDD1B, 0 0 150px #FFDD1B;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FFDD1B, 0 0 35px #FFDD1B, 0 0 40px #FFDD1B, 0 0 50px #FFDD1B, 0 0 75px #FFDD1B;
  }
}

@keyframes neon4 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #B6FF00, 0 0 70px #B6FF00, 0 0 80px #B6FF00, 0 0 100px #B6FF00, 0 0 150px #B6FF00;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #B6FF00, 0 0 35px #B6FF00, 0 0 40px #B6FF00, 0 0 50px #B6FF00, 0 0 75px #B6FF00;
  }
}

@keyframes neon5 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #FF9900, 0 0 70px #FF9900, 0 0 80px #FF9900, 0 0 100px #FF9900, 0 0 150px #FF9900;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF9900, 0 0 35px #FF9900, 0 0 40px #FF9900, 0 0 50px #FF9900, 0 0 75px #FF9900;
  }
}

@keyframes neon6 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #ff00de, 0 0 70px #ff00de, 0 0 80px #ff00de, 0 0 100px #ff00de, 0 0 150px #ff00de;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #ff00de, 0 0 35px #ff00de, 0 0 40px #ff00de, 0 0 50px #ff00de, 0 0 75px #ff00de;
  }
}
/*REEEEEEEEEEESPONSIVE*/

@media (max-width: 650px) {
  #container {
    width: 100%;
  }
  p {
    font-size: 3.5em;
  }
}

</style>
<script>
	window.onload = function() {
		document.getElementById("option1-div").style.display = 'none';
		document.getElementById('option2-div').style.display = 'none';
		document.getElementById('option3-div').style.display = 'none';
		document.getElementById('option4-div').style.display = 'none';
		document.getElementById("option5-div").style.display = 'none';
		document.getElementById('option6-div').style.display = 'none';
		document.getElementById('option7-div').style.display = 'none';
		document.getElementById('option8-div').style.display = 'none';
		document.getElementById('option9-div').style.display = 'none';
		document.getElementById('option10-div').style.display = 'none';
	}
	function radioButtonCheck() {
		if (document.getElementById("option1").checked) {
			document.getElementById("option1-div").style.display = 'block';
			document.getElementById('option2-div').style.display = 'none';
			document.getElementById('option3-div').style.display = 'none';
			document.getElementById('option4-div').style.display = 'none';
			document.getElementById("option5-div").style.display = 'none';
			document.getElementById('option6-div').style.display = 'none';
			document.getElementById('option7-div').style.display = 'none';
			document.getElementById('option8-div').style.display = 'none';
			document.getElementById('option9-div').style.display = 'none';
			document.getElementById('option10-div').style.display = 'none';
		} else if (document.getElementById("option2").checked) {
			document.getElementById("option1-div").style.display = 'none';
			document.getElementById('option2-div').style.display = 'block';
			document.getElementById('option3-div').style.display = 'none';
			document.getElementById('option4-div').style.display = 'none';
			document.getElementById("option5-div").style.display = 'none';
			document.getElementById('option6-div').style.display = 'none';
			document.getElementById('option7-div').style.display = 'none';
			document.getElementById('option8-div').style.display = 'none';
			document.getElementById('option9-div').style.display = 'none';
			document.getElementById('option10-div').style.display = 'none';
		} else if (document.getElementById("option3").checked) {
			document.getElementById("option1-div").style.display = 'none';
			document.getElementById('option2-div').style.display = 'none';
			document.getElementById('option3-div').style.display = 'block';
			document.getElementById('option4-div').style.display = 'none';
			document.getElementById("option5-div").style.display = 'none';
			document.getElementById('option6-div').style.display = 'none';
			document.getElementById('option7-div').style.display = 'none';
			document.getElementById('option8-div').style.display = 'none';
			document.getElementById('option9-div').style.display = 'none';
			document.getElementById('option10-div').style.display = 'none';
		} else if (document.getElementById("option4").checked) {
			document.getElementById("option1-div").style.display = 'none';
			document.getElementById('option2-div').style.display = 'none';
			document.getElementById('option3-div').style.display = 'none';
			document.getElementById('option4-div').style.display = 'block';
			document.getElementById("option5-div").style.display = 'none';
			document.getElementById('option6-div').style.display = 'none';
			document.getElementById('option7-div').style.display = 'none';
			document.getElementById('option8-div').style.display = 'none';
			document.getElementById('option9-div').style.display = 'none';
			document.getElementById('option10-div').style.display = 'none';
		} else if (document.getElementById("option5").checked) {
			document.getElementById("option1-div").style.display = 'none';
			document.getElementById('option2-div').style.display = 'none';
			document.getElementById('option3-div').style.display = 'none';
			document.getElementById('option4-div').style.display = 'none';
			document.getElementById("option5-div").style.display = 'block';
			document.getElementById('option6-div').style.display = 'none';
			document.getElementById('option7-div').style.display = 'none';
			document.getElementById('option8-div').style.display = 'none';
			document.getElementById('option9-div').style.display = 'none';
			document.getElementById('option10-div').style.display = 'none';
		} else if (document.getElementById("option6").checked) {
			document.getElementById("option1-div").style.display = 'none';
			document.getElementById('option2-div').style.display = 'none';
			document.getElementById('option3-div').style.display = 'none';
			document.getElementById('option4-div').style.display = 'none';
			document.getElementById("option5-div").style.display = 'none';
			document.getElementById('option6-div').style.display = 'block';
			document.getElementById('option7-div').style.display = 'none';
			document.getElementById('option8-div').style.display = 'none';
			document.getElementById('option9-div').style.display = 'none';
			document.getElementById('option10-div').style.display = 'none';
		} else if (document.getElementById("option7").checked) {
			document.getElementById("option1-div").style.display = 'none';
			document.getElementById('option2-div').style.display = 'none';
			document.getElementById('option3-div').style.display = 'none';
			document.getElementById('option4-div').style.display = 'none';
			document.getElementById("option5-div").style.display = 'none';
			document.getElementById('option6-div').style.display = 'none';
			document.getElementById('option7-div').style.display = 'block';
			document.getElementById('option8-div').style.display = 'none';
			document.getElementById('option9-div').style.display = 'none';
			document.getElementById('option10-div').style.display = 'none';
		} else if (document.getElementById("option8").checked) {
			document.getElementById("option1-div").style.display = 'none';
			document.getElementById('option2-div').style.display = 'none';
			document.getElementById('option3-div').style.display = 'none';
			document.getElementById('option4-div').style.display = 'none';
			document.getElementById("option5-div").style.display = 'none';
			document.getElementById('option6-div').style.display = 'none';
			document.getElementById('option7-div').style.display = 'none';
			document.getElementById('option8-div').style.display = 'block';
			document.getElementById('option9-div').style.display = 'none';
			document.getElementById('option10-div').style.display = 'none';
		} else if (document.getElementById("option9").checked) {
			document.getElementById("option1-div").style.display = 'none';
			document.getElementById('option2-div').style.display = 'none';
			document.getElementById('option3-div').style.display = 'none';
			document.getElementById('option4-div').style.display = 'none';
			document.getElementById("option5-div").style.display = 'none';
			document.getElementById('option6-div').style.display = 'none';
			document.getElementById('option7-div').style.display = 'none';
			document.getElementById('option8-div').style.display = 'none';
			document.getElementById('option9-div').style.display = 'block';
			document.getElementById('option10-div').style.display = 'none';
		} else {
			document.getElementById("option1-div").style.display = 'none';
			document.getElementById('option2-div').style.display = 'none';
			document.getElementById('option3-div').style.display = 'none';
			document.getElementById('option4-div').style.display = 'none';
			document.getElementById("option5-div").style.display = 'none';
			document.getElementById('option6-div').style.display = 'none';
			document.getElementById('option7-div').style.display = 'none';
			document.getElementById('option8-div').style.display = 'none';
			document.getElementById('option9-div').style.display = 'none';
			document.getElementById('option10-div').style.display = 'block';
		}

	}
</script>
</head>
<body>
	<center>
		<h1>
			<p>
				<a>Hello, Administrator!</a>
			</p>
		</h1>
	</center>

	<br>
	<form action='main'>
		<button type='submit' name='admin-action-submit' value='quit-submit'>Quit</button>
	</form>
	<br>

	<center>
		<h3>
			<input type="radio" name="option" id="option1"
				onclick="radioButtonCheck();">&emsp;Add Document Copy
		</h3>
	</center>
	<div id="option1-div">
		<form action='main'>
			<!--Document ID: <input type='text' name='add-docid' id='add-docid' required><br>-->
			Document Title: <select name='add-docid' id='add-docid'>
				<%
				String url = "jdbc:mysql://localhost:3306/lbms";
				String uname = "root";
				String pass = "root@1234";
				Connection con = null;

				try {
					con = (Connection) DriverManager.getConnection(url, uname, pass);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				String query = "Select docid, title from document";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Statement statement = (Statement) con.createStatement();
					ResultSet rs = statement.executeQuery(query);
					while (rs.next()) {
				%>
				<option value="<%=rs.getInt("docid")%>"><%=rs.getString("title")%></option>
				<%
				}
				} catch (ClassNotFoundException e1) {
				}
				%>
			</select><br />
			<!--Branch ID: <input type='text' name='add-bid' id='add-bid' required><br>-->
			Branch Name: <select name='add-bid' id='add-bid'>
				<%
				query = "Select bid, lname from branch";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Statement statement = (Statement) con.createStatement();
					ResultSet rs = statement.executeQuery(query);
					while (rs.next()) {
				%>
				<option value="<%=rs.getInt("bid")%>"><%=rs.getString("lname")%></option>
				<%
				}
				} catch (ClassNotFoundException e1) {
				}
				%>
			</select><br /> Position: <input type='text' name='add-pos' id='add-pos'
				required><br>
			<button type='submit' name='inadmin-submit-1'
				value='inadmin-submit-1'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>


	<center>
		<h3>
			<input type="radio" name="option" id="option2"
				onclick="radioButtonCheck();">&emsp;Search Document Copy and
			Check Status
		</h3>
	</center>
	<div id="option2-div">
		<form action='main'>
			<!--Document ID: <input type='text' name='sc-docid' id='add-docid' required><br>-->
			Document Title: <select name='sc-docid' id='sc-docid'>
				<%
				query = "Select docid, title from document";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Statement statement = (Statement) con.createStatement();
					ResultSet rs = statement.executeQuery(query);
					while (rs.next()) {
				%>
				<option value="<%=rs.getInt("docid")%>"><%=rs.getString("title")%></option>
				<%
				}
				} catch (ClassNotFoundException e1) {
				}
				%>
			</select><br />
			<button type='submit' name='inadmin-submit-2'
				value='inadmin-submit-2'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>


	<center>
		<h3>
			<input type="radio" name="option" id="option3"
				onclick="radioButtonCheck();">&emsp;Add Reader
		</h3>
	</center>
	<div id="option3-div">
		<form action='main'>
			Reader Type: <input type='text' name='rtype' id='rtype' required><br>
			Reader Name: <input type='text' name='rname' id='rname' required><br>
			Reader Address: <input type='text' name='raddress' id='raddress'
				required><br> Reader Contact: <input type='text'
				name='rcontact' id='rcontact' required><br>
			<button type='submit' name='inadmin-submit-3'
				value='inadmin-submit-3'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>


	<center>
		<h3>
			<input type="radio" name="option" id="option4"
				onclick="radioButtonCheck();">&emsp;Retrieve Branch
			Information
		</h3>
	</center>
	<div id="option4-div">
		<form action='main'>
			<!--Branch ID: <input type='text' name='bid' id='bid' required><br>-->
			Branch Name: <select name='bid' id='bid'>
				<%
				query = "Select bid, lname from branch";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Statement statement = (Statement) con.createStatement();
					ResultSet rs = statement.executeQuery(query);
					while (rs.next()) {
				%>
				<option value="<%=rs.getInt("bid")%>"><%=rs.getString("lname")%></option>
				<%
				}
				} catch (ClassNotFoundException e1) {
				}
				%>
			</select><br />
			<button type='submit' name='inadmin-submit-4'
				value='inadmin-submit-4'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>

	<center>
		<h3>
			<input type="radio" name="option" id="option5"
				onclick="radioButtonCheck();">&emsp;Retrieve N Most Frequent
			Borrowers in Branch
		</h3>
	</center>
	<div id="option5-div">
		<form action='main'>
			<!--Branch ID: <input type='text' name='bid' id='bid' required><br>-->
			Branch Name: <select name='bid' id='bid'>
				<%
				query = "Select bid, lname from branch";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Statement statement = (Statement) con.createStatement();
					ResultSet rs = statement.executeQuery(query);
					while (rs.next()) {
				%>
				<option value="<%=rs.getInt("bid")%>"><%=rs.getString("lname")%></option>
				<%
				}
				} catch (ClassNotFoundException e1) {
				}
				%>
			</select><br /> N: <input type='text' name='n' id='n' required><br>
			<button type='submit' name='inadmin-submit-5'
				value='inadmin-submit-5'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>

	<center>
		<h3>
			<input type="radio" name="option" id="option6"
				onclick="radioButtonCheck();">&emsp;Retrieve N Most Frequent
			Borrowers in Library
		</h3>
	</center>
	<div id="option6-div">
		<form action='main'>
			N: <input type='text' name='n' id='n' required><br>
			<button type='submit' name='inadmin-submit-6'
				value='inadmin-submit-6'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>

	<center>
		<h3>
			<input type="radio" name="option" id="option7"
				onclick="radioButtonCheck();">&emsp;Retrieve N Most Borrowed
			Books in Branch
		</h3>
	</center>
	<div id="option7-div">
		<form action='main'>
			<!--Branch ID: <input type='text' name='bid' id='bid' required><br>-->
			Branch Name: <select name='bid' id='bid'>
				<%
				query = "Select bid, lname from branch";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Statement statement = (Statement) con.createStatement();
					ResultSet rs = statement.executeQuery(query);
					while (rs.next()) {
				%>
				<option value="<%=rs.getInt("bid")%>"><%=rs.getString("lname")%></option>
				<%
				}
				} catch (ClassNotFoundException e1) {
				}
				%>
			</select><br /> N: <input type='text' name='n' id='n' required><br>
			<button type='submit' name='inadmin-submit-7'
				value='inadmin-submit-7'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>


	<center>
		<h3>
			<input type="radio" name="option" id="option8"
				onclick="radioButtonCheck();">&emsp;Retrieve N Most Borrowed
			Books in Library
		</h3>
	</center>
	<div id="option8-div">
		<form action='main'>
			N: <input type='text' name='n' id='n' required><br>
			<button type='submit' name='inadmin-submit-8'
				value='inadmin-submit-8'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>

	<center>
		<h3>
			<input type="radio" name="option" id="option9"
				onclick="radioButtonCheck();">&emsp;Retrieve 10 Most Popular
			Books Pertaining to Specific Year
		</h3>
	</center>
	<div id="option9-div">
		<form action='main'>
			Year (Format: yyyy): <input type='text' name='year' id='year'
				required><br>
			<button type='submit' name='inadmin-submit-9'
				value='inadmin-submit-9'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>


	<center>
		<h3>
			<input type="radio" name="option" id="option10"
				onclick="radioButtonCheck();">&emsp;Average Fine Paid By
			Borrowers
		</h3>
	</center>
	<div id="option10-div">
		<form action='main'>
			Start Date (Format: yyyy-mm-dd): <input type='text' name='start-date'
				id='start-date' required><br> End Date (Format:
			yyyy-mm-dd): <input type='text' name='end-date' id='end-date'
				required><br>
			<button type='submit' name='inadmin-submit-10'
				value='inadmin-submit-10'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>

	<div>
		<center>
			<code>All rights reserved. &#169; Parikshit, Rashmi and Rajvi</code>
		</center>
	</div>

</body>
</html>