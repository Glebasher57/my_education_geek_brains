-- 1. Вывод id заказа, id пользователя, кол-ва продуктов в заказе, способ оплаты 
-- названия метода доставки и его ид, название сервиса и его ид.

SELECT o.id AS order_id,
  u.id AS user_id,
  COUNT(op.order_id) AS products_amount,
  pt.name AS payment_type,
  dm.name AS delivery_method,
  dm.id AS dm_id,
  ds.name AS delivery_service,
  ds.id AS ds_id 
  FROM orders o
    JOIN users u
      ON o.user_id = u.id
    JOIN orders_products op      -- продукты в заказе
      ON op.order_id = o.id
    JOIN payment_types pt
      ON o.payment_type_id = pt.id
    JOIN orders_delivery od      -- способ доставки заказа 
      ON od.order_id = o.id
    JOIN delivery_services ds    -- Пункты выдачи/службы доставки
      ON od.delivery_service_id = ds.id
    JOIN delivery_methods dm     -- способы доставки
      ON od.delivery_method_id = dm.id
    GROUP BY o.id
    ORDER BY o.id;

-- вариант с окном

SELECT DISTINCT o.id AS order_id,
  u.id AS user_id,
  COUNT(op.order_id) OVER w AS products_amount,
  pt.name AS payment_type,
  dm.name AS delivery_method,
  dm.id AS dm_id,
  ds.name AS delivery_service,
  ds.id AS ds_id 
  FROM orders o
    JOIN users u
      ON o.user_id = u.id
    JOIN payment_types pt
      ON o.payment_type_id = pt.id
    JOIN orders_products op      -- продукты в заказе
      ON op.order_id = o.id
    JOIN orders_delivery od      -- способ доставки заказа 
      ON od.order_id = o.id
    JOIN delivery_services ds    -- Пункты выдачи/службы доставки
      ON od.delivery_service_id = ds.id
    JOIN delivery_methods dm     -- способы доставки
      ON od.delivery_method_id = dm.id
    WINDOW w AS (PARTITION BY o.id)
    ORDER BY o.id;

-- При проверке, из-за рандомного заполнения значений таблиц, у некоторых пользователей получились заказы без товаров,
--  и поэтому такие заказы в выборку не попадут. По идее в реальности все должно быть верно.

-- 2. Подсчет конечной стоимости товара включая стоимость товара, скидку пользователя, стоимость свойства товара.

SELECT DISTINCT 
    o.id AS order_id,                             -- id заказа
    prof.user_id AS user_id,                      -- id пользователя
    d.discount AS discount,                       -- скидка
    COUNT(p.id) AS amount_products,               -- кол-во товаров
    SUM(p.price) AS price,                        -- стоимость товаров без скидки и учета свойств
    SUM(pp.property_price) AS properties_price,   -- стоимость свойств товаров
    (SUM(p.price) + SUM(pp.property_price)) * d.discount AS total_price -- итог
  FROM orders o
    JOIN profiles prof
      ON o.user_id = prof.user_id
    JOIN discounts d                              -- скидки
      ON d.id = prof.discount_id
    JOIN orders_products op                       -- товары в заказе
      ON op.order_id = o.id
    JOIN products p
      ON op.product_id = p.id
    JOIN product_properties pp                    -- свойства товара
      ON pp.product_id = p.id
        WHERE IF(pp.property_price IS NULL, 0, pp.property_price)
    GROUP BY o.id
    ORDER BY prof.user_id;


-- 3. Аналитика по товару на складах

SELECT 
  sp.storehouse_id, s.name, p.id, sp.value, 
  SUM(sp.value) OVER() AS total_amount,
  SUM(sp.value) OVER w / 2 AS average, -- среднее кол-во продукции на складе
  ROUND(sp.value / SUM(sp.value) OVER w * 100, 2) AS '%', -- от продукции на складе
  ROUND(sp.value / SUM(sp.value) OVER() * 100, 2) AS '%%'-- от общей продукции
FROM storehouses_products sp
  JOIN storehouses s
    ON s.id = sp.storehouse_id
  JOIN products p
    ON p.id = sp.product_id
  WINDOW w AS (PARTITION BY sp.storehouse_id)
  ORDER BY sp.storehouse_id;

-- просто вариант с вложенными запросами, выводящий id склада, id продукции, кол-во такой продукции на складе и общее кол-во продукции на складе

SELECT
  total_amount.storehouse_id,
  product_id,
  value,
  amount,
  value / amount * 100 AS '%%' -- процент определенного товара от общего кол-ва товаров на складе
  FROM (
    SELECT 
      storehouse_id, 
      SUM(value) AS amount
    FROM storehouses_products 
    WHERE storehouse_id IN (SELECT id FROM storehouses) 
      AND product_id IN (SELECT id FROM products)
    GROUP BY storehouse_id
    ORDER BY storehouse_id
  ) AS total_amount -- общее кол-во продукции на складе
JOIN
  (
    SELECT
      storehouse_id, 
      product_id, 
      value
    FROM storehouses_products sp 
    WHERE sp.storehouse_id IN (SELECT id FROM storehouses) 
     AND sp.product_id IN (SELECT id FROM products)
    ORDER BY sp.storehouse_id
  ) AS amount_products -- кол-во определенной продукции
  ON total_amount.storehouse_id = amount_products.storehouse_id

-- 4. Кол-во заказов в городах, за последние пол года

SELECT 
  ds.name AS city,
  COUNT(o.id) AS orders_amount
FROM orders o
  JOIN orders_delivery od
    ON o.id = od.order_id 
  JOIN delivery_services ds 
    ON ds.id = od.delivery_service_id
      WHERE o.created_at BETWEEN NOW() - INTERVAL 6 MONTH AND NOW()
  GROUP BY ds.name
  ORDER BY orders_amount DESC;