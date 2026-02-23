-- DATABASE
CREATE DATABASE croma_sales_db;
USE croma_sales_db;

-- DATE DIMENSION
CREATE TABLE date_dim (
    date_id INT PRIMARY KEY,
    full_date DATE,
    month_name VARCHAR(20),
    month_no INT,
    quarter VARCHAR(5),
    year INT,
    is_festival VARCHAR(5)
);

-- PRODUCT DIMENSION
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    brand_id INT,
    cost_price INT,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

-- CUSTOMER DIMENSION
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    customer_type VARCHAR(20) -- New / Repeat
);

-- STORE DIMENSION
CREATE TABLE store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city_id INT,
    store_type VARCHAR(50),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- CATEGORY DIMENSION
CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- BRAND DIMENSION
CREATE -- CATEGORY DIMENSIONTABLE brand (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50)
);

--CITY DIMENSION
CREATE TABLE city (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50)
);


-- SALES FACT TABLE
CREATE TABLE sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    product_id INT,
    store_id INT,
    customer_id INT,
    promotion_id INT,
    quantity INT,
    selling_price INT,
    discount_amount INT,
    total_amount INT,
    FOREIGN KEY (date_id) REFERENCES date_dim(date_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(promotion_id)
);
