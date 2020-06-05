DROP DATABASE IF EXISTS WildBerries;
CREATE DATABASE WildBerries;

USE WildBerries;

CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	phone VARCHAR(15) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Регистрационная форма';

CREATE TABLE profiles (
	user_id INT UNSIGNED NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) DEFAULT NULL,
	last_name VARCHAR(50) DEFAULT NULL,
	middle_name VARCHAR(50) DEFAULT NULL COMMENT 'Отчество',
	email VARCHAR(100) DEFAULT NULL UNIQUE,
	gender CHAR(1) DEFAULT NULL,
	birthday DATE DEFAULT NULL,
	discount_id INT UNSIGNED DEFAULT 1,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Профиль пользователя';

CREATE TABLE figure_params (
	user_id INT UNSIGNED NOT NULL PRIMARY KEY,
	height DECIMAL(4,1) DEFAULT NULL COMMENT 'Рост',
	chest_girth DECIMAL(4,1) DEFAULT NULL COMMENT 'Обхват груди см',
	waist_girth DECIMAL(4,1) DEFAULT NULL COMMENT 'Обхват талии см',
	hip_girth DECIMAL(4,1) DEFAULT NULL COMMENT 'Обхват бедер см',
	shoes_size DECIMAL(3,1) DEFAULT NULL COMMENT 'Размер обуви',
	sleeve_length DECIMAL(4,1) DEFAULT NULL COMMENT 'Длина рукава см',
	weight INT(3) UNSIGNED DEFAULT NULL COMMENT 'Вес кг',
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Параметры фигуры';

CREATE TABLE user_addresses (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	region VARCHAR(50) DEFAULT NULL,
	city VARCHAR(50) DEFAULT NULL,
	street VARCHAR(50) DEFAULT NULL,
	house_num VARCHAR(3) DEFAULT NULL,
	apart_num VARCHAR(4) DEFAULT NULL,
	mail_index INT(6) DEFAULT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Адреса';

CREATE TABLE requisites (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	req_name VARCHAR(20) DEFAULT NULL COMMENT 'Название реквизита', 
	BIC_bank INT(9) DEFAULT NULL COMMENT 'БИК банка',
	checking_account VARCHAR(20) DEFAULT NULL COMMENT 'Расчетный счет',
	first_name VARCHAR(50) DEFAULT NULL COMMENT 'Имя владельца счета',
	last_name VARCHAR(50) DEFAULT NULL COMMENT 'Фамилия владельца счета',
	middle_name VARCHAR(50) DEFAULT NULL COMMENT 'Отчество владельца счета',
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Реквизиты';

CREATE TABLE active_sessions (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	dev_type VARCHAR(255) NOT NULL COMMENT 'Тип устройства',
	ip VARCHAR(15) NOT NULL,
	location VARCHAR(255),
	created_at DATETIME DEFAULT NOW()
) COMMENT = 'Активные сессии пользователя';

CREATE TABLE discounts (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE,
	description VARCHAR(255),
	promo_code_id INT UNSIGNED DEFAULT NULL UNIQUE COMMENT 'Привязка скидки к промокоду по желанию',
	discount DECIMAL(3,2) UNSIGNED COMMENT 'Скидка от 0.0 до 1.0',
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Скидки постоянного покупателя и промокоды';

CREATE TABLE promo_codes (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(10) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT NOW()
) COMMENT = 'Промокоды';

CREATE TABLE notifications (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	title VARCHAR(255) NOT NULL,
	description TEXT NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Уведомления';

CREATE TABLE catalogs (
	id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE COMMENT 'Название раздела',
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Каталоги';

CREATE TABLE products (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	vendor_code INT UNSIGNED NOT NULL COMMENT 'Артикул',
	name VARCHAR(50) NOT NULL,
	description TEXT NOT NULL,
	available TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Доступность товара на складе',
	price DECIMAL(11,2) NOT NULL,
	keywords VARCHAR(255),
	catalog_id SMALLINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Товары';

CREATE TABLE product_properties (
	product_id INT UNSIGNED NOT NULL PRIMARY KEY,
	gender CHAR(1) DEFAULT NULL COMMENT 'На случай одежды и пр.',
	property_name VARCHAR(255) NOT NULL COMMENT 'Название свойства. Напр-р: красный, металл и т.д.',
	property_value VARCHAR(255) NOT NULL COMMENT 'Значение свойства. Напр-р: 20% хлопка, 20 г и т.д.',
	property_price DECIMAL(11,2) DEFAULT NULL COMMENT 'Цена, если свойство влияет на стоимость товара'
) COMMENT = 'Свойства товаров';

CREATE TABLE payment_types (
	id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name ENUM('В пункте выдачи', 'Курьеру по прибытию', 'Online') NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Типы оплаты';

CREATE TABLE delivery_methods (
	id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name ENUM('Пункт выдачи', 'Курьерская доставка') NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Методы доставки';

CREATE TABLE available_cities (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	delivery_service_id INT UNSIGNED DEFAULT NULL,
	name VARCHAR(50) NOT NULL COMMENT 'Название города',
	price DECIMAL(8,2) DEFAULT 0 COMMENT 'Стоимость той или иной доставки',
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Доступные города/службы обслуживающие города/стоимость доставки';

CREATE TABLE delivery_services (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE,
	city VARCHAR(50) NOT NULL,
	address VARCHAR(255),
	phone VARCHAR(15) NOT NULL COMMENT '1(234)567-89-10',
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Пункты выдачи/службы доставки';

CREATE TABLE orders (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	payment_type_id TINYINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Заказы';

CREATE TABLE orders_delivery (
	order_id INT UNSIGNED NOT NULL PRIMARY KEY,
	delivery_method_id TINYINT UNSIGNED NOT NULL,
	delivery_service_id INT UNSIGNED DEFAULT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Способ доставки';

CREATE TABLE orders_products (
	order_id INT UNSIGNED NOT NULL,
	product_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Заказанные товары';

CREATE TABLE users_carts (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	product_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Корзина пользователя';


CREATE TABLE storehouses (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Склады';

CREATE TABLE storehouses_products (
	storehouse_id INT UNSIGNED NOT NULL,
	product_id INT UNSIGNED NOT NULL PRIMARY KEY
	value SMALLINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Количество товаров';

CREATE TABLE reviews (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	title VARCHAR(255) DEFAULT NULL,
	review TEXT NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Отзывы';

CREATE TABLE review_media (
	image_id INT UNSIGNED NOT NULL,
	review_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW()
) COMMENT = 'Возможность нескольких фото для отзывов';

CREATE TABLE images (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED DEFAULT NULL,
	product_id INT UNSIGNED DEFAULT NULL,
	delivery_service_id INT UNSIGNED DEFAULT NULL,
	file_path VARCHAR(255) NOT NULL,
	created_at DATETIME DEFAULT NOW()	
) COMMENT = 'Фото пользователей, продуктов, пунктов выдачи';