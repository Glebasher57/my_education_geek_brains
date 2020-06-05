<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Личный сайт начинающего программиста</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="content">
	<?php
		include "menu.php";
	?>

<div class="contentWrap">
	<div class="content">
		<div class="center">
			
			<h1>Игра в загадки</h1>

			<div class="box">
				<?php 
					
					if(isset($_GET['userAnswer1']) && isset($_GET['userAnswer2']) && isset($_GET['userAnswer3']) && isset($_GET['userAnswer4']) && isset($_GET['userAnswer5'])){

						$score = 0;
						$userAnswer = $_GET["userAnswer1"];
						if($userAnswer == "сон" || $userAnswer == "сновидение"){
							$score++;
						}

						$userAnswer = $_GET["userAnswer2"];
						if($userAnswer == "морской" || $userAnswer == "укус акулы"){
							$score++;
						}

						$userAnswer = $_GET["userAnswer3"];
						if($userAnswer == "шахматный" || $userAnswer == "мертвый"){
							$score++;
						}
						
						$userAnswer = $_GET["userAnswer4"];
						if($userAnswer == "крапива"){
							$score++;
						}

						$userAnswer = $_GET["userAnswer5"];
						if($userAnswer == "молоко" || $userAnswer == "труп"){
							$score++;
						}

						echo "Количество отгаданных загадок: " . $score;
					}
				?>

				<form method="GET">
					<p><b>1.</b> Что можно увидеть с закрытыми глазами?</p>
					<input type="text" name="userAnswer1">

					<p><b>2.</b> Какой болезнью никто не болеет на суше?</p>
					<input type="text" name="userAnswer2">

					<p><b>3.</b> Какой конь не ест овса?</p>
					<input type="text" name="userAnswer3">

					<p><b>4.</b> Не огонь, а жжется<br>Что это?</p>
					<input type="text" name="userAnswer4">

					<p><b>5.</b> Белое, а не вода,<br>Жидкое, а не снег?</p>
					<input type="text" name="userAnswer5">
					<br>
					<br>
					<br>
					<input type="submit" value="Ответить" name="">
				</form>
			</div>
		</div>
	</div>
</div>

<div class="footer">
	Copyright &copy; <?php echo date("Y");?> Evgeny Kirillin
<div>
</body>
</html>