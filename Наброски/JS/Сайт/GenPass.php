<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Личный сайт начинающего программиста</title>
	<link rel="stylesheet" href="style.css">
	<script type="text/javascript">
		
		function randomNumber(a){
			return Math.round(Math.random() * a);
		}

		function readInput(){
			var number = document.getElementById("userAnswer").value
			return Math.round(number);
		}

		function write(text){
			document.getElementById("info").innerHTML = text;
		}
		
		function hide(id){
			document.getElementById(id).type = "hidden";
		}

		var digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
			
		var chars = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
		var chars_up = chars;

		function GenPass(){
			var pl = readInput();
			var password = [];
			for(var i = 0; i < pl; i++){
				var num_arr = randomNumber(2);
				if(num_arr == 0){
					var n = randomNumber(digits.length - 1);
					password.push(digits[n]);
				} else if(num_arr == 1){
					var n = randomNumber(chars.length - 1);
					password.push(chars[n]);
				} else if(num_arr == 2){
					var n = randomNumber(chars_up.length - 1);
					password.push(chars_up[n].toUpperCase());
				}
			}
			write("<b>Сгенерированный пароль:</b> " + password.join('') + "<br>Поменяем длинну?");
		}

	</script>
</head>
<body>
	
	<div class="content">
		<div class="header">
			<?php 
				include "menu.php";
			?>
		</div>
	</div>

	<div class="contentWrap">
		<div class="content">
			<div class="center">
				
				<h1>Генератор случайных паролей</h1>

				<div class="box">

					<p id="info"><b>Добро пожаловать!</b><br>Введите желаемую длинну пароля:</p>
					<input type="text" id="userAnswer">
					<br>
					<a href="#" onClick="GenPass();" id="button">Сгенерировать</a>

				</div>
			</div>
		</div>
	</div>
	
	<div class="footer">
		Copyright &copy; <?php echo date("Y");?> Evgeny Kirillin
	</div>
</body>
</html>