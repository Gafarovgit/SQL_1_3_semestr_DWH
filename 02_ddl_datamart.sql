-- Этап 2 DDL витрины данных по заказчикам
DROP TABLE IF EXISTS dwh.customer_report_datamart;

CREATE TABLE IF NOT EXISTS dwh.customer_report_datamart (
    id                          BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL, -- идентификатор записи
    customer_id                 BIGINT NOT NULL,        -- идентификатор заказчика
    customer_name               VARCHAR NOT NULL,       -- Ф.И.О. заказчика
    customer_address            VARCHAR NOT NULL,       -- адрес заказчика
    customer_birthday           DATE NOT NULL,          -- дата рождения заказчика
    customer_email              VARCHAR NOT NULL,       -- электронная почта заказчика
    customer_money              NUMERIC(15,2) NOT NULL, -- сумма, которую потратил заказчик за месяц
    platform_money              NUMERIC(15,2) NOT NULL, -- сумма, которую заработала платформа (10% от покупок)
    count_order                 BIGINT NOT NULL,        -- количество заказов у заказчика за месяц
    avg_price_order             NUMERIC(10,2) NOT NULL, -- средняя стоимость одного заказа
    median_time_order_completed NUMERIC(10,1),          -- медианное время в днях от создания до завершения
    top_product_category        VARCHAR NOT NULL,       -- самая популярная категория товаров у заказчика
    top_craftsman_id            BIGINT NOT NULL,        -- id самого популярного мастера у заказчика
    count_order_created         BIGINT NOT NULL,        -- количество созданных заказов за месяц
    count_order_in_progress     BIGINT NOT NULL,        -- количество заказов в процессе изготовки
    count_order_delivery        BIGINT NOT NULL,        -- количество заказов в доставке
    count_order_done            BIGINT NOT NULL,        -- количество завершённых заказов
    count_order_not_done        BIGINT NOT NULL,        -- количество незавершённых заказов
    report_period               VARCHAR NOT NULL,       -- отчётный период год и месяц
    CONSTRAINT customer_report_datamart_pk PRIMARY KEY (id)
);

-- DDL таблицы инкрементальных загрузок
DROP TABLE IF EXISTS dwh.load_dates_customer_report_datamart;

CREATE TABLE IF NOT EXISTS dwh.load_dates_customer_report_datamart (
    id          BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
    load_dttm   DATE NOT NULL,
    CONSTRAINT load_dates_customer_report_datamart_pk PRIMARY KEY (id)
);

--проверка этапа 2
SELECT * FROM dwh.customer_report_datamart;
SELECT * FROM dwh.load_dates_customer_report_datamart;
