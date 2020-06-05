-- 1. Первый триггер вычитает продукцию из кол-ва продукции на складе, при оформлении заказа, второй прибавляет продукт при корректировке заказа и вычитает из кол-ва продукции замененного товара.

DELIMITER -
DROP TRIGGER IF EXISTS counting_products_after_insert-
CREATE TRIGGER counting_products_after_insert AFTER INSERT ON orders_products
FOR EACH ROW
BEGIN
	UPDATE storehouses_products SET value = (value - 1) WHERE product_id = NEW.product_id;
END-

DROP TRIGGER IF EXISTS counting_products_after_update-
CREATE TRIGGER counting_products_after_update AFTER UPDATE ON orders_products
FOR EACH ROW
BEGIN
	UPDATE storehouses_products SET value = (value - 1) WHERE product_id = NEW.product_id;
	UPDATE storehouses_products SET value = (value + 1) WHERE product_id = OLD.product_id; 
END-

DELIMITER ;

INSERT INTO orders(user_id, payment_type_id) VALUES (23, 3);
INSERT INTO orders_products(order_id, product_id) VALUES (101, 22);

SELECT value FROM storehouses_products WHERE product_id = 22;

UPDATE orders_products SET product_id = 24 WHERE order_id = 101;

SELECT value FROM storehouses_products WHERE product_id = 22 OR product_id = 24;

-- 2. Триггер на создание профиля пользователя в таблице, при его регистрации

DELIMITER -
DROP TRIGGER IF EXISTS create_usr_profile-
CREATE TRIGGER create_usr_profile AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO profiles(user_id) VALUES (NEW.id);
END-

DELIMITER ;

SELECT * FROM profiles ORDER BY user_id DESC LIMIT 1;
INSERT INTO users(phone) VALUES ('1213');
SELECT * FROM profiles ORDER BY user_id DESC LIMIT 1;

-- 3. Процедура возвращающая общее кол-во товаров на складе

DELIMITER -
DROP PROCEDURE IF EXISTS get_storehouses_products_amount-
CREATE PROCEDURE get_storehouses_products_amount(IN store_id INT)
BEGIN
	SELECT 
	  SUM(value) AS products_amount 
	FROM storehouses_products 
	  WHERE storehouse_id = store_id 
	GROUP BY storehouse_id;
END-

DELIMITER ;

CALL get_product_amount(1);

-- 4. Процедура возвращающая кол-во товаров определенной продукции на складе

DELIMITER -
DROP PROCEDURE IF EXISTS get_products_amount-
CREATE PROCEDURE get_products_amount(IN prod_id INT)
BEGIN
	SELECT 
	  value AS product_amount 
	FROM storehouses_products 
	  WHERE product_id = prod_id;
END-

DELIMITER ;

CALL get_products_amount(3);