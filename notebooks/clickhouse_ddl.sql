CREATE TABLE product_mart (
    product_id UInt64,
    product_name String,
    brand String,
    description String,
    price Float32,
    product_category String,
    total_quantity UInt64,
    total_revenue Float64,
    total_sales UInt64,
    avg_rating Float32,
    total_reviews UInt32
)
ENGINE = MergeTree()
ORDER BY product_id;

CREATE VIEW top_10_products_view as
SELECT *
FROM product_mart
ORDER BY total_quantity desc
LIMIT 10;

CREATE VIEW total_revenue_by_product_category as
SELECT
	product_category,
	round(sum(total_revenue), 2) as total_revenue
FROM product_mart
GROUP BY product_category;


CREATE TABLE customers_mart (
    customer_id UInt64,
    first_name String,
    last_name String,
    email String,
    country String,
    total_spent Float32,
    avg_receipt Float32,
    total_purchases UInt64
)
ENGINE = MergeTree()
ORDER BY customer_id;

CREATE VIEW top_10_customers as
SELECT *
FROM customers_mart
ORDER BY total_spent desc
LIMIT 10;

CREATE VIEW customers_country_distribution as
SELECT 
	country,
	count(*) as customers
FROM customers_mart
GROUP BY country
ORDER BY customers desc;


CREATE TABLE time_mart (
    year UInt16,
    month UInt8,
    total_sales UInt64,
    total_quantity UInt64,
    avg_sale_size Float32,
    total_revenue Float32
)
ENGINE = MergeTree()
ORDER BY (year, month);


CREATE TABLE stores_mart (
    store_id UInt64,
    store_name String,
    location String,
    city String,
    state String,
    country String,
    phone String,
    email String,
    total_quantity UInt64,
    total_sales UInt32,
    total_revenue Float32,
    avg_receipt Float32
)
ENGINE = MergeTree()
ORDER BY store_id;

CREATE VIEW top_5_stores as
SELECT *
FROM stores_mart
ORDER BY total_revenue desc
LIMIT 5;

CREATE VIEW country_store_distribution as
SELECT
	country,
	sum(total_quantity) as total_quantity,
	sum(total_sales) as total_sales,
	round(sum(total_revenue), 2) as total_revenue,
	round(avg(avg_receipt), 2) as avg_receipt
FROM stores_mart
GROUP BY country 
ORDER BY
	total_sales desc,
	total_quantity desc;

CREATE VIEW city_store_distribution as
SELECT
	city,
	sum(total_quantity) as total_quantity,
	sum(total_sales) as total_sales,
	round(sum(total_revenue), 2) as total_revenue,
	round(avg(avg_receipt), 2) as avg_receipt
FROM stores_mart
GROUP BY city 
ORDER BY
	total_sales desc,
	total_quantity desc;


CREATE TABLE suppliers_mart (
	supplier_id UInt64,
	name String,
	contact String,
	email String,
	phone String,
	city String,
	country String,
	total_quantity UInt64,
	total_revenue Float32,
	total_sales UInt64
)
ENGINE = MergeTree()
ORDER BY supplier_id;

CREATE VIEW top_5_suppliers as
SELECT *
FROM suppliers_mart
ORDER BY total_revenue desc
LIMIT 5;

CREATE VIEW avg_supplier_price as
SELECT
	supplier_id,
	name,
	contact,
	email,
	phone,
	city,
	country,
	round(total_revenue / total_quantity, 2) as avg_price
FROM suppliers_mart;

CREATE VIEW supplier_country_distribution as
SELECT
	country,
	sum(total_sales) as total_sales
FROM suppliers_mart
GROUP BY country
ORDER BY total_sales desc;


CREATE TABLE quality_mart (
	product_id UInt64,
	product_name String,
	brand String,
	description String,
	price Float32,
	product_category String,
	rating Float32,
	reviews UInt32,
	total_quantity UInt64,
	total_revenue Float32,
	total_sales UInt64
)
ENGINE = MergeTree()
ORDER BY product_id;

CREATE VIEW gratest_rating_products as
SELECT *
FROM quality_mart
ORDER BY rating desc
LIMIT 5;

CREATE VIEW lowest_rating_products as
SELECT *
FROM quality_mart
ORDER BY rating
LIMIT 5;

CREATE VIEW sales_quality_corellation as
SELECT
	rating,
	sum(total_sales) as sales
FROM quality_mart
GROUP BY rating 
ORDER BY rating desc;

CREATE VIEW top_reviewed_products as
SELECT *
FROM quality_mart
ORDER BY reviews desc
LIMIT 10;







