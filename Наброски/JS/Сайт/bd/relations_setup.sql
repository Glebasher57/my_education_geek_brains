-- profiles
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_discount_fk
    FOREIGN KEY (discount_id) REFERENCES discounts(id)
	  ON DELETE SET NULL;
	  
-- figure_params
ALTER TABLE figure_params 
  ADD CONSTRAINT figure_params_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;

-- user_addresses
ALTER TABLE user_addresses 
  ADD CONSTRAINT user_addresses_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;

-- requisites
ALTER TABLE requisites 
  ADD CONSTRAINT requisites_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;

-- active_sessions
ALTER TABLE active_sessions 
  ADD CONSTRAINT active_sessions_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;

-- discounts
ALTER TABLE discounts 
  ADD CONSTRAINT discounts_promo_code_id_fk
    FOREIGN KEY (promo_code_id) REFERENCES promo_codes(id)
  	  ON DELETE CASCADE;

-- notifications
ALTER TABLE notifications
  ADD CONSTRAINT notifications_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;

-- products 
ALTER TABLE products
  ADD CONSTRAINT products_catalog_id_fk
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
	  ON DELETE CASCADE;

-- product_properties
ALTER TABLE product_properties
  ADD CONSTRAINT product_properties_product_id_fk
    FOREIGN KEY (product_id) REFERENCES products(id)
	  ON DELETE CASCADE;

-- available_cities
ALTER TABLE available_cities
  ADD CONSTRAINT available_cities_delivery_service_id_fk
    FOREIGN KEY (delivery_service_id) REFERENCES delivery_services(id)
	  ON DELETE CASCADE;

-- orders
ALTER TABLE orders
  ADD CONSTRAINT orders_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;

ALTER TABLE orders
  ADD CONSTRAINT orders_payment_type_id_fk
    FOREIGN KEY (payment_type_id) REFERENCES payment_types(id)
     ON DELETE CASCADE;

-- orders_delivery
ALTER TABLE orders_delivery
  ADD CONSTRAINT orders_delivery_order_id_fk
    FOREIGN KEY (order_id) REFERENCES orders(id)
      ON DELETE CASCADE;

ALTER TABLE orders_delivery
  ADD CONSTRAINT orders_delivery_delivery_method_id_fk
    FOREIGN KEY (delivery_method_id) REFERENCES delivery_methods(id)
      ON DELETE CASCADE;

ALTER TABLE orders_delivery
  ADD CONSTRAINT orders_delivery_delivery_service_id_fk
    FOREIGN KEY (delivery_service_id) REFERENCES delivery_services(id)
      ON DELETE CASCADE;

-- orders_products
ALTER TABLE orders_products
  ADD CONSTRAINT orders_products_order_id_fk
    FOREIGN KEY (order_id) REFERENCES orders(id)
	  ON DELETE CASCADE;

ALTER TABLE orders_products
  ADD CONSTRAINT orders_products_product_id_fk
    FOREIGN KEY (product_id) REFERENCES products(id)
	  ON DELETE CASCADE;

-- users_carts
ALTER TABLE users_carts
  ADD CONSTRAINT users_carts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;

ALTER TABLE users_carts
  ADD CONSTRAINT users_carts_product_id_fk
    FOREIGN KEY (product_id) REFERENCES products(id)
	  ON DELETE CASCADE;

-- storehouses_products
ALTER TABLE storehouses_products
  ADD CONSTRAINT storehouses_products_product_id_fk
    FOREIGN KEY (product_id) REFERENCES products(id)
	  ON DELETE CASCADE;

ALTER TABLE storehouses_products
  ADD CONSTRAINT storehouses_products_storehouse_id_fk
    FOREIGN KEY (storehouse_id) REFERENCES storehouses(id)
	  ON DELETE CASCADE;

-- reviews
ALTER TABLE reviews
  ADD CONSTRAINT reviews_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;

-- review_media
ALTER TABLE review_media
  ADD CONSTRAINT review_media_review_id_fk
    FOREIGN KEY (review_id) REFERENCES reviews(id)
	  ON DELETE CASCADE;

ALTER TABLE review_media
  ADD CONSTRAINT review_media_image_id_fk
    FOREIGN KEY (image_id) REFERENCES images(id)
	  ON DELETE CASCADE;

-- images
ALTER TABLE images
  ADD CONSTRAINT images_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE;

ALTER TABLE images
  ADD CONSTRAINT images_delivery_service_id_fk
    FOREIGN KEY (delivery_service_id) REFERENCES delivery_services(id)
	  ON DELETE CASCADE;

ALTER TABLE images
  ADD CONSTRAINT images_product_id_fk
    FOREIGN KEY (product_id) REFERENCES products(id)
	  ON DELETE CASCADE;

-- Инедксы добавил в основном основываясь на анализе запросов ч-з EXPLAIN

CREATE INDEX payment_types_id_name_idx
  ON payment_types(id, name);

CREATE INDEX orders_products_order_id_product_id_idx
  ON orders_products(order_id, product_id);

CREATE INDEX orders_delivery_ord_id_del_meth_id_del_serv_id_idx
  ON orders_delivery(order_id, delivery_method_id, delivery_service_id);

CREATE INDEX storehouses_id_name_idx
  ON storehouses(id, name);

CREATE INDEX delivery_methods_id_name_idx
  ON delivery_methods(id, name);

CREATE INDEX storehouses_products_storehouse_id_product_id_value_idx
  ON storehouses_products(storehouse_id, product_id, value);

CREATE INDEX orders_id_created_at_idx
  ON orders(id, created_at);