<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Личный сайт начинающего программиста</title>
	<link rel="stylesheet" href="style.css">
	<script>

		var randomNumber = parseInt(Math.random() * 100);
		var tryCount = 0;
		var maxTryCount = 10;
		var player = 1;

		function readInt(){
			return +document.getElementById("userAnswer").value;
		}

		function write(text){
			document.getElementById("info").innerHTML = text;
		}

		function players(){
			if(player == 1){
				return player = 2;
			} else {
				return player = 1;
			}
		}

		function guess(){

			tryCount++;
			var userAnswer = readInt();
			if(userAnswer == randomNumber){
				write("<b>Поздравляю, вы угадали!</b>");
				hide("userAnswer");
				hide("button");
			} else if(tryCount >= 10){
				write("К сожалению, попытки закончились. :(<br>Правильный ответ был: " + randomNumber + "<br>Чтобы попробовать еще раз, обновите страницу.");
				hide("userAnswer");
				hide("button");
			} else if(userAnswer < randomNumber){
				player 
				write("Загаданное число немного больше.<br>Чило использованных попыток: " + tryCount + "<br>Игрок " + players() + " , ваш вариант?");
			} else if(userAnswer > randomNumber){
				write("Загаданное число немного меньше.<br>Чило использованных попыток: " + tryCount + "<br>Игрок " + players() + " , ваш вариант?");
			}
		}

		function hide(id){
			document.getElementById(id).style.display = "none";
		}
	
	</script>
</head>
<body>

<div class="content">
		<?php
			include "menu.php"
		?>
</div>

<div class="contentWrap">
	<div class="content">
		<div class="center">
			
			<h1>Игра Угадайка на двоих</h1>
			
			<div class="box">

				<p id="info"><b>Добро пожаловать в игру "Угадайка"!</b><br>Попробуйте угадать число загаданное компьютером от 0 до 100.<br>Игра расчитана на 2х игроков.<br>У вас будет 10 попыток.<br>Игрок №1 Делайте свой ход :)</p>
				<input type="text" id="userAnswer">
				<br>
				<a href="#" onClick="guess();" id="button">Ответить</a>
			
			</div>
		</div>
	</div>
</div>

<div class="footer">
	Copyright &copy; <?php echo date("Y");?> Evgeny Kirillin
<div>


</body>
</html>

