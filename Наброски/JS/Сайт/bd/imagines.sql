-- 1. Информация о заказах

CREATE VIEW orders_info AS
  SELECT o.id AS order_id,
    u.id AS user_id,
    COUNT(op.order_id) AS products_amount,
    pt.name AS payment_type,
    dm.name AS delivery_method,
    dm.id AS dm_id, -- id метода доставки
    ds.name AS delivery_service,
    ds.id AS ds_id -- id сервиса доставки
    FROM users u
      JOIN delivery_services ds    -- Пункты выдачи/службы доставки
      JOIN delivery_methods dm     -- способы доставки
      JOIN payment_types pt
      JOIN orders o
        ON o.user_id = u.id
          AND o.payment_type_id = pt.id
      JOIN orders_products op      -- продукты в заказе
        ON op.order_id = o.id
      JOIN orders_delivery od      -- способ доставки заказа 
        ON od.delivery_method_id = dm.id 
          AND od.delivery_service_id = ds.id
          AND od.order_id = o.id
      GROUP BY o.id
      ORDER BY o.id;

-- 2. Заказы с онлайн оплатой и заказы с оффлайн оплатой

CREATE VIEW orders_with_online_payment AS
  SELECT id, user_id FROM orders WHERE payment_type_id = 3;

CREATE VIEW orders_with_offline_payment AS
  SELECT id, user_id FROM orders WHERE payment_type_id = 1 OR payment_type_id = 2;

-- 3. Аналитика по товарам на складах

CREATE VIEW storehouses_products_analysis AS
  SELECT 
    sp.storehouse_id,
    s.name, 
    sp.value, 
    SUM(sp.value) OVER() AS total_amount,
    SUM(sp.value) OVER (PARTITION BY sp.storehouse_id) / 2 AS average, -- среднее кол-во продукции на складе
    ROUND(sp.value / SUM(sp.value) OVER (PARTITION BY sp.storehouse_id) * 100, 2) AS '%', -- от продукции на складе
    ROUND(sp.value / SUM(sp.value) OVER() * 100, 2) AS '%%'-- от общей продукции
  FROM storehouses_products sp
    JOIN storehouses s
      ON s.id = sp.storehouse_id
    JOIN products p
      ON p.id = sp.product_id
    ORDER BY sp.storehouse_id;