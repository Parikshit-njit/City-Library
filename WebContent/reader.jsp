<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.ServletContext"%>
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
		url('file:///Users/parikshitnarang/eclipse-workspace/DBMS/WebContent/final.jpeg')
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
		document.getElementById("search-document").style.display = 'none';
		document.getElementById('checkout-document').style.display = 'none';
		document.getElementById('return-document').style.display = 'none';
		document.getElementById('fine-reader').style.display = 'none';
		document.getElementById('doc-id-titles').style.display = 'none';
		document.getElementById('reserve-document').style.display = 'none';
		document.getElementById('reserve-document-list').style.display = 'none';
	}
	function radioButtonCheck() {
		if (document.getElementById("option1").checked) {
			document.getElementById("search-document").style.display = 'block';
			document.getElementById('checkout-document').style.display = 'none';
			document.getElementById('return-document').style.display = 'none';
			document.getElementById('fine-reader').style.display = 'none';
			document.getElementById('doc-id-titles').style.display = 'none';
			document.getElementById('reserve-document').style.display = 'none';
			document.getElementById('reserve-document-list').style.display = 'none';

		} else if (document.getElementById("option2").checked) {
			document.getElementById("search-document").style.display = 'none';
			document.getElementById('checkout-document').style.display = 'block';
			document.getElementById('return-document').style.display = 'none';
			document.getElementById('fine-reader').style.display = 'none';
			document.getElementById('doc-id-titles').style.display = 'none';
			document.getElementById('reserve-document').style.display = 'none';
			document.getElementById('reserve-document-list').style.display = 'none';

			var url = new URL(location.href).searchParams.get("card-number");
			var elem = document.getElementById('reader-id');
			elem.value = url;

		} else if (document.getElementById("option3").checked) {
			document.getElementById("search-document").style.display = 'none';
			document.getElementById('checkout-document').style.display = 'none';
			document.getElementById('return-document').style.display = 'block';
			document.getElementById('fine-reader').style.display = 'none';
			document.getElementById('doc-id-titles').style.display = 'none';
			document.getElementById('reserve-document').style.display = 'none';
			document.getElementById('reserve-document-list').style.display = 'none';

			var url = new URL(location.href).searchParams.get("card-number");
			var elem = document.getElementById('reader-id-3');
			elem.value = url;

		} else if (document.getElementById("option4").checked) {
			document.getElementById("search-document").style.display = 'none';
			document.getElementById('checkout-document').style.display = 'none';
			document.getElementById('return-document').style.display = 'none';
			document.getElementById('fine-reader').style.display = 'block';
			document.getElementById('doc-id-titles').style.display = 'none';
			document.getElementById('reserve-document').style.display = 'none';
			document.getElementById('reserve-document-list').style.display = 'none';

			var url = new URL(location.href).searchParams.get("card-number");
			var elem = document.getElementById('fine-rid');
			elem.value = url;

		} else if (document.getElementById("option5").checked) {
			document.getElementById("search-document").style.display = 'none';
			document.getElementById('checkout-document').style.display = 'none';
			document.getElementById('return-document').style.display = 'none';
			document.getElementById('fine-reader').style.display = 'none';
			document.getElementById('doc-id-titles').style.display = 'block';
			document.getElementById('reserve-document').style.display = 'none';
			document.getElementById('reserve-document-list').style.display = 'none';

		} else if (document.getElementById("option6").checked) {
			document.getElementById("search-document").style.display = 'none';
			document.getElementById('checkout-document').style.display = 'none';
			document.getElementById('return-document').style.display = 'none';
			document.getElementById('fine-reader').style.display = 'none';
			document.getElementById('doc-id-titles').style.display = 'none';
			document.getElementById('reserve-document').style.display = 'block';
			document.getElementById('reserve-document-list').style.display = 'none';

			var url = new URL(location.href).searchParams.get("card-number");
			var elem = document.getElementById('reader-id-reserve');
			elem.value = url;
		} else {

			document.getElementById("search-document").style.display = 'none';
			document.getElementById('checkout-document').style.display = 'none';
			document.getElementById('return-document').style.display = 'none';
			document.getElementById('fine-reader').style.display = 'none';
			document.getElementById('doc-id-titles').style.display = 'none';
			document.getElementById('reserve-document').style.display = 'none';
			document.getElementById('reserve-document-list').style.display = 'block';

			var url = new URL(location.href).searchParams.get("card-number");
			var elem = document.getElementById('reader-id-7');
			elem.value = url;
		}

	}
	/* function checkForm3(event){
	 var docReturnRId=document.getElementById("reader-id").value;
	 var docReturnDocId=document.getElementById("doc-return-docid").value;
	 var docReturnBId=document.getElementById("doc-return-bid").value;
	 if (docReturnRId=="" || docReturnDocId=="" || docReturnBId==""){
	 alert("All the fields in the Document Return Form are mandatory!");
	 event.preventDefault();
	 return false;
	 }else{
	 return true;
	 }
	 } */

	function checkForm2(event) {
		var docCheckoutRId = document.getElementById("reader-id").value;
		var docCheckoutRname = document.getElementById("reader-name").value;
		var docCheckoutRaddress = document.getElementById("reader-address").value;
		var docCheckoutPhone = document.getElementById("reader-phone").value;
		if (docCheckoutRId == "" && docCheckoutRname == ""
				&& docCheckoutRaddress == "" && docCheckoutPhone == "") {
			alert("Fill either Reader Id, Reader Name, Reader Address or Reader Phone!");
			event.preventDefault();
			return false;
		} else {
			return true;
		}
	}

	function checkForm1(event) {
		var docSearchId = document.getElementById("document-id").value;
		var docSearchTitle = document.getElementById("document-title").value;
		var docSearchPublsiher = document.getElementById("document-pubname").value;
		if (docSearchId == "" && docSearchTitle == ""
				&& docSearchPublsiher == "") {
			alert("Fill one of the fields in the Document Search Form!");
			event.preventDefault();
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<center class='noplz'>
		<h1>
			<p>
				<a>Hello, Reader!</a>
			</p>
		</h1>
	</center>
	<br>
	<form action='main'>
		<button type='submit' name='reader-action-submit' value='quit-submit'>Quit</button>
	</form>
	<br>

	<center>
		<h3>
			<input type="radio" name="option" id="option1"
				onclick="radioButtonCheck();">&emsp;Search a document
		</h3>
	</center>
	<div id="search-document"
		style="border-radius: 5px; background-color: #f2f2f2; padding: 20px;"
		class='noplz'>
		<form action='main'>
			<i>(Fill one of the fields from Id, Title, and Publisher Name)</i><br>
			<br> ID: <input type='text' name='document-id' id='document-id'><br>
			Title: <input type='text' name='document-title' id='document-title'><br>
			Publisher Name: <input type='text' name='document-pubname'
				id='document-pubname'><br>
			<button type='submit' name='inreader-submit-1' value='inreader-value'
				onclick="return checkForm1(event);">Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>

	<center>
		<h3>
			<input type="radio" name="option" id="option2"
				onclick="radioButtonCheck();">&emsp;Document Checkout
		</h3>
	</center>
	<div id="checkout-document">
		<form action='main'>
			<i>(Fill one of the fields from ReaderId, Reader Name, Reader
				Address and Phone Number)</i><br> <br> Reader ID: <input
				type='text' name='reader-id' id='reader-id' readonly><br>
			Reader Name: <input type='text' name='reader-name' id='reader-name'><br>
			Reader Address: <input type='text' name='reader-address'
				id='reader-address'><br> Phone Number: <input
				type='text' name='reader-phone' id='reader-phone'><br>
			<br> <br> <i>(Mandatory Field)</i><br> <br>
			<!-- Document ID: <input type='text' name='reader-doc-reserve' id='reader-doc-reserve' required><br>
             -->
			Document Title: <select name='reader-doc-reserve'
				id='reader-doc-reserve'>
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
			<button type='submit' name='inreader-submit-2' value='inreader-value'
				onclick="return checkForm2(event);">Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>

	<center>
		<h3>
			<input type="radio" name="option" id="option3"
				onclick="radioButtonCheck();">&emsp;Document Return
		</h3>
	</center>
	<div id="return-document">
		<form action='main'>
			<i>(All the fields are mandatory)</i><br> <br> Reader ID: <input
				type='text' name='doc-return-rid' id='reader-id-3' readonly required><br>
			<!-- Document ID: <input type='text' name='doc-return-docid' id='doc-return-docid' required><br>
-->
			Document Title: <select name='doc-return-docid' id='doc-return-docid'>
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
			</select><br /> Branch ID: <select name='doc-return-bid' id='doc-return-bid'><br />
				<br />
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
				%></select><br />
			<!--Branch ID: <input type='text' name='doc-return-bid' id='doc-return-bid' required><br>
            -->
			<button type='submit' name='inreader-submit-3' value='inreader-value'>Submit</button>
		</form>
	</div>
	<br>
	<br>
	<hr>


	<center>
		<h3>
			<input type="radio" name="option" id="option4"
				onclick="radioButtonCheck();">&emsp;Compute Fine
		</h3>
	</center>
	<div id="fine-reader">
		<form action='main'>
			<i>(All the fields are mandatory)</i><br> <br> Reader ID: <input
				type='text' name='fine-rid' id='fine-rid' readonly required><br>
			<!--Document ID: <input type='text' name='fine-docid' id='fine-docid' required><br>
            Branch ID: <input type='text' name='fine-bid' id='fine-bid' required><br>-->
			Document Title: <select name='fine-docid' id='fine-docid'>
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
			</select><br /> Branch Name: <select name='fine-bid' id='fine-bid'>
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
			<button type='submit' name='inreader-submit-4' value='inreader-value'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>


	<center>
		<h3>
			<input type="radio" name="option" id="option5"
				onclick="radioButtonCheck();">&emsp;Retrieve Document ID and
			Titles by a Publisher
		</h3>
	</center>
	<div id="doc-id-titles">
		<form action='main'>
			<i>(All the fields are mandatory)</i><br> <br> Publisher
			Name: <input type='text' name='pname' id='pname' required><br>
			<button type='submit' name='inreader-submit-5' value='inreader-value'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>


	<center>
		<h3>
			<input type="radio" name="option" id="option6"
				onclick="radioButtonCheck();">&emsp;Reserve Document
		</h3>
	</center>
	<div id="reserve-document">
		<form action='main'>
			<i>(Fill one of the fields from ReaderId, Reader Name, Reader
				Address and Phone Number)</i><br> <br> Reader ID: <input
				type='text' name='reader-id-reserve' id='reader-id-reserve' readonly><br>
			Reader Name: <input type='text' name='reader-name-reserve'
				id='reader-name'><br> Reader Address: <input
				type='text' name='reader-address-reserve' id='reader-address'><br>
			Phone Number: <input type='text' name='reader-phone-reserve'
				id='reader-phone'><br> <br> <br> <i>(Mandatory
				Field)</i><br> <br>
			<!-- Document ID: <input type='text' name='reader-doc-reserve' id='reader-doc-reserve' required><br>
              -->
			Document Title: <select name='reader-doc-reserve'
				id='reader-doc-reserve'>
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
			</select><br>
			<button type='submit' name='inreader-submit-6' value='inreader-value'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>

	<center>
		<h3>
			<input type="radio" name="option" id="option7"
				onclick="radioButtonCheck();">&emsp;Reserved Document List
			and Status
		</h3>
	</center>
	<div id="reserve-document-list">
		<form action='main'>
			Reader ID: <input type='text' name='reader-id' id='reader-id-7'
				readonly><br>
			<button type='submit' name='inreader-submit-7' value='inreader-value'>Submit</button>
		</form>
	</div>

	<br>
	<br>
	<hr>

	<div
		style="border-radius: 5px; background-color: #f2f2f2; padding: 20px; opacity: 0.8">
		<center>
			<code
				style="border-radius: 5px; background-color: #f2f2f2; padding: 20px; opacity: 0.8">All
				rights reserved. &#169; Parikshit, Rashmi and Rajvi</code>
		</center>
	</div>

</body>
</html>