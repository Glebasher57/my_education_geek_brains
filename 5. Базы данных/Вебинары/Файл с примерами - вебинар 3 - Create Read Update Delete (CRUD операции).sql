-- Урок 4
-- CRUD операции


-- Работа с БД vk
-- Загружаем дамп консольным клиентом
DROP DATABASE vk;
CREATE DATABASE vk;

-- Переходим в папку с дампом (/home/ubuntu)
-- mysql -u root -p vk < vk.dump.sql

-- Дорабатываем тестовые данные
-- Смотрим все таблицы
SHOW TABLES;

-- Анализируем данные пользователей
SELECT * FROM users LIMIT 10;

-- Смотрим структуру таблицы пользователей
DESC users;

-- Увеличиваем количество символов для номера телефона
ALTER TABLE users MODIFY COLUMN phone VARCHAR(13) NOT NULL UNIQUE;

-- Смотрим как работает функция RAND
SELECT RAND();

-- Собираем выражение для выборки числа из диапазона
SELECT FLOOR(100 + (RAND() * 999));

-- Добавляем к номеру три цифры
UPDATE users SET phone = CONCAT(phone, FLOOR(100 + (RAND() * 999)));

-- Приводим в порядок временные метки
UPDATE users SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at;

-- Смотрим структуру профилей
DESC profiles;

-- Анализируем данные
SELECT * FROM profiles LIMIT 10;

-- Создаём временную таблицу полов
CREATE TEMPORARY TABLE genders (gender CHAR(1));

-- Заполняем значениями
INSERT INTO genders VALUES ('m'), ('f');

-- Проверяем
SELECT * FROM genders;

-- Заполняем профили случайным значением пола
UPDATE profiles SET gender = (SELECT gender FROM genders ORDER BY RAND() LIMIT 1);

-- Смотрим структуру таблицы профилей
DESC profiles;

-- Все таблицы
SHOW TABLES;

-- Смотрим структуру таблицы сообщений
DESC messages;

-- Анализируем данные
SELECT * FROM messages LIMIT 10;

-- Обновляем значения ссылок на отправителя и получателя сообщения
UPDATE messages SET 
  from_user_id = FLOOR(1 + (RAND() * 100)),
  to_user_id = FLOOR(1 + (RAND() * 100));

-- Смотрим структуру таблицы медиаконтента 
DESC media;

-- Анализируем данные
SELECT * FROM media LIMIT 10;

-- Анализируем типы медиаконтента
SELECT * FROM media_types;

-- Удаляем все типы
DELETE FROM media_types;

-- Добавляем нужные типы
INSERT INTO media_types (name) VALUES
  ('photo'),
  ('video'),
  ('audio')
;

-- DELETE не сбрасывает счётчик автоинкрементирования,
-- поэтому применим TRUNCATE
TRUNCATE media_types;

-- Анализируем данные
SELECT * FROM media LIMIT 10;

-- Обновляем данные для ссылки на тип и владельца
UPDATE media SET media_type_id = FLOOR(1 + (RAND() * 3));
UPDATE media SET user_id = FLOOR(1 + (RAND() * 100));

-- Обновляем ссылку на файл
UPDATE media SET file_path = CONCAT('https://dropbox/vk/file_',
  FLOOR(1 + (RAND() * 10000))
);

-- Обновляем размер файла
UPDATE media SET size = FLOOR(10000 + (RAND() * 1000000)) WHERE size < 1000;

-- Заполняем метаданные
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');  

-- Возвращаем столбцу метеданных правильный тип
ALTER TABLE media MODIFY COLUMN metadata JSON;

-- Выборка значения по ключу
SELECT id, JSON_EXTRACT(metadata, '$.owner') AS owner 
  FROM media
  WHERE id = 1;

-- Изменение данных
UPDATE media SET metadata = JSON_REPLACE(metadata, '$.owner', 'REPLACED VALUE') WHERE id = 1;
SELECT * FROM media WHERE id = 1;

-- Смотрим структуру таблицы дружбы
DESC friendship;

-- Анализируем данные
SELECT * FROM friendship LIMIT 10;

-- Обновляем ссылки на друзей
UPDATE friendship SET 
  user_id = FLOOR(1 + (RAND() * 100)),
  friend_id = FLOOR(1 + (RAND() * 100));
 
-- Анализируем данные 
SELECT * FROM friendship_statuses;

-- Очищаем таблицу
TRUNCATE friendship_statuses;

-- Вставляем значения статусов дружбы
INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');
 
-- Обновляем ссылки на статус 
UPDATE friendship SET status_id = FLOOR(1 + (RAND() * 3)); 

-- Смотрим структуру таблицы групп
DESC communities;

-- Анализируем данные
SELECT * FROM communities;

-- Оставим только 20 групп
DELETE FROM communities WHERE id > 20;

-- Анализируем таблицу связи пользователей и групп
SELECT * FROM communities_users;

-- Обновляем ссылки на группы
UPDATE communities_users SET community_id = FLOOR(1 + (RAND() * 20));



-- Предложения по доработке структуры БД vk (только для ознакомления и анализа)

-- Вариант 1
-- По структуре особо замечаний нет, можно было бы только
-- фотку дефолтную вставить - какую-то ссылку
-- (так обычно вроде делают).

-- Вариант 2
-- Развить идею отношений между пользователями (что подсмотрено у вк,
-- что логично), добавить новую таблицу с разными статусами для
-- этих отношений (ну, там, влюблен, в отношениях, женат/замужем и т.п.)
-- столбец с ID для каждого статуса, столбец с user_id для инициатора
-- отношений, столбец с user_id для принимающей стороны, так сказать,
-- и столбец с именем статуса. ну, и created_at, updated_at
-- (соцсети не показывают, когда ты расстался с кем-то, но, например,
-- если ты сначала был влюблен, а потом статус поменялся на женат/замужем,
-- то уже другое дело). простенько, но со вкусом.

CREATE TABLE relation_types (
  id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100)
);

CREATE TABLE relations (
  id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  req_user_id INT UNSIGNED NOT NULL,
  conf_user_id INT UNSIGNED NOT NULL,
  relation_type_id INT UNSIGNED NOT NULL,
  requested_at DATETIME DEFAULT NOW(),
  rejected_at DATETIME,
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW() 
);


-- Использование справки в терминальном клиенте
HELP SELECT;

-- Документация
-- https://dev.mysql.com/doc/refman/8.0/en/
-- http://www.rldp.ru/mysql/mysql80/index.htm

