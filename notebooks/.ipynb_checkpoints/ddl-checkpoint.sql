BEGIN TRANSACTION;

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INTEGER,
    email VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(50),
    pet_type VARCHAR(50),
    pet_name VARCHAR(50),
    pet_breed VARCHAR(50)
);

CREATE TABLE sellers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(50)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(50),
    pet_category VARCHAR(50),
    price REAL,
    quantity INTEGER,
    weight REAL,
    color VARCHAR(50),
    size VARCHAR(50),
    brand VARCHAR(50),
    material VARCHAR(50),
    description VARCHAR(1024),
    rating REAL,
    reviews INTEGER,
    release_date DATE,
    expiry_date DATE
);

CREATE TABLE stores (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    phone VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE suppliers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    contact VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    customer_id BIGINT REFERENCES customers(id),
    seller_id BIGINT REFERENCES sellers(id),
    product_id BIGINT REFERENCES products(id),
    store_id BIGINT REFERENCES stores(id),
    supplier_id BIGINT REFERENCES suppliers(id),
    date DATE,
    quantity INTEGER,
    total_price REAL
);

COMMIT;