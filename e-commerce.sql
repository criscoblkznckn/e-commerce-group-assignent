-- Create database
CREATE DATABASE ecommerceDB;
USE ecommerceDB;

-- Table: brand
CREATE TABLE brand (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

-- Table: product_category
CREATE TABLE product_category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

-- Table: product
CREATE TABLE product (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  brand_id INT,
  category_id INT,
  base_price DECIMAL(10,2),
  FOREIGN KEY (brand_id) REFERENCES brand(id),
  FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- Table: product_image
CREATE TABLE product_image (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  image_url VARCHAR(255) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Table: color
CREATE TABLE color (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

-- Table: size_category
CREATE TABLE size_category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

-- Table: size_option
CREATE TABLE size_option (
  id INT PRIMARY KEY AUTO_INCREMENT,
  category_id INT,
  name VARCHAR(50) NOT NULL,
  FOREIGN KEY (category_id) REFERENCES size_category(id)
);

-- Table: product_item
CREATE TABLE product_item (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  size_option_id INT,
  color_id INT,
  price DECIMAL(10,2),
  stock INT,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (size_option_id) REFERENCES size_option(id),
  FOREIGN KEY (color_id) REFERENCES color(id)
);

-- Table: product_variation
CREATE TABLE product_variation (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  size_option_id INT,
  color_id INT,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (size_option_id) REFERENCES size_option(id),
  FOREIGN KEY (color_id) REFERENCES color(id)
);

-- Table: attribute_category
CREATE TABLE attribute_category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

-- Table: attribute_type
CREATE TABLE attribute_type (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

-- Table: product_attribute
CREATE TABLE product_attribute (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  category_id INT,
  type_id INT,
  name VARCHAR(100),
  value TEXT,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (category_id) REFERENCES attribute_category(id),
  FOREIGN KEY (type_id) REFERENCES attribute_type(id)
);
