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
				<h1>Тестовая бд на MySQL</h1>
				<div class="box">
					<h2>Курсовой проект БД на основе сервиса онлайн-магазина WildBerries.</h2>
					<p>
						Состоит из 25 таблиц:<br>
						<br>
						<i>users</i>         - таблица с регистрационной информацией<br>
						<i>profiles</i>      - профили пользователей<br>
						<i>figure_params</i> - параметры фигуры<br>
						<i>user_addresses</i> - адреса пользователя<br>
						<i>requisites</i> - реквизиты пользователя<br>
						<i>active_sessions</i> - активные сессии пользователя<br>
						<i>discounts</i> - скидки<br>
						<i>promo_codes</i> - промо-коды<br>
						<i>notifications</i> - уведомления<br>
						<i>catalogs</i> - каталог товаров<br>
						<i>products</i> - товары<br>
						<i>product_properties</i> - свойства товаров<br>
						<i>payment_types</i> - типы оплаты<br>
						<i>delivery_methods</i> - методы доставки<br>
						<i>available_cities</i> - доступные города<br>
						<i>delivery_services</i> - сервисы доставки<br>
						<i>orders</i> - заказы<br>
						<i>orders_delivery</i> - выбранный метод доставки заказа<br>
						<i>orders_products</i> - товары в заказе<br>
						<i>users_carts</i> - корзина пользователя<br>
						<i>storehouses</i> - склады<br>
						<i>storehouses_products</i> - товары на складе<br>
						<i>reviews</i> - отзывы<br>
						<i>review_media</i> - возможность нескольких фото для отзывов<br>
						<i>images</i> - фото пользователей, товаров, пунктов выдачи<br>
					</p>
					<a href="img/WB_diagram.png" onClick="tap();" id="button">   Структура</a>
						
					<a href="img/WB_diagram.png" onClick="tap();" id="button">Скрипты установки связей</a>

					<a href="img/WB_diagram.png" onClick="tap();" id="button">Структура</a>

					<a href="img/WB_diagram.png" onClick="tap();" id="button">Примеры запросов</a>

					<a href="img/WB_diagram.png" onClick="tap();" id="button">Представления</a>

					<a href="img/WB_diagram.png" onClick="tap();" id="button">Процедуры и треггеры</a>

					<a href="img/WB_diagram.png" onClick="tap();" id="button">Дамп</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="footer">
	Copyright &copy; <?php echo date("Y");?> Evgeny Kirillin
<div>
</body>
</html>