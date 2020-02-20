<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Личный сайт студента GeekBrains</title>
	<link rel="stylesheet" href="style.css"> 
</head>
<body>

<div class="content">
	<?php
		include "menu.php";
	?>

	<h1>Личный сайт студента GeekBrains</h1>

	<div class="center">
	<img src="img/circle+.png">
		<div class="box_text">
			<p><b>Доброго времени суток, дорогие друзья.</b><br>Меня зовут <i>Евгений Кириллин.</i><br>Давно был интерес и желание заняться программированием. Но различные отговорки, по типу: <br><br><i>"Я не знаю математику"</i><br><br>или<br><br><i>"Уже поздно, раньше надо было думать"</i> и т.д.<br><br>никак не давали начать.<br></p>
			<p>Недавно я все таки решился и буквально пару недель назад начал изучать направление веб программирования. Прошло конечно всего ничего, однако я уже написал свой первый сайт.<p>Нет ни грамма сожаления, что решил сменить профессию.<br>Не бойтесь менять направление, <br>если чувствуете, что вам не комфортно на вашем месте.</p>

			<p>В этом всем мне помог IT-портал <a href="https://geekbrains.ru/">GeekBrains.</a></p>

			<p>На данном сайте вы сможете сыграть в несколько игр<br> или воспользоваться простой программой по генерации паролей, которые я написал:<br><a href="riddle.php">Загадки,</a> <a href="guessingGame.php">Угадайка,</a> <a href="guessingGameMulti.php">Угадайка на двоих,</a> <a href="GenPass.php">Генератор случайных паролей</a></p>
		</div>
	</div>
</div>

<div class="footer">
	Copyright &copy; <?php echo date("Y");?> Evgeny Kirillin
<div>

</body>
</html>