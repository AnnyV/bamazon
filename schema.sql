CREATE DATABASE bamazon_db;
USE bamazon_db;

-- Create the table actors.
CREATE TABLE departments (
  id int AUTO_INCREMENT,
  department_name varchar(30) NOT NULL,
  over_head_costs  decimal (9,2) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE products (
  id int AUTO_INCREMENT,
  product_name  varchar(30) NOT NULL,
  department_id  int NOT NULL,
  price   decimal (7,2) NOT NULL,
  stock_quantity int NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(department_id) references departments(id)
);
CREATE TABLE sales (
  id int AUTO_INCREMENT,
  product_id  int NOT NULL,
  quantity_purchased int NOT NULL,
  created_at  timestamp NOT NULL,
  PRIMARY KEY(id),
    FOREIGN KEY(product_id) references products(id)

);

-- Insert a set of records.
INSERT INTO departments (department_name, over_head_costs ) VALUES ("Automotive & Industrial", 200000.00);
INSERT INTO departments (department_name, over_head_costs) VALUES ("Beauty, Health & Grocery", 5000000.00);
INSERT INTO departments (department_name, over_head_costs) VALUES ("Electronics & Computers", 4000000.00);
INSERT INTO departments (department_name, over_head_costs) VALUES ("Kindle E-readers & Books", 1500000.00);


INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("tires", 1, 200.00, 10000);
INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("brakes", 1, 500.00, 1000);
INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("wipers", 1, 20.00, 7000);

INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("skin cream", 2, 150.00, 3000);
INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("perfume", 2, 100.00, 4000);
INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("multi vitamins", 2, 80.00, 300);

INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("tv", 3, 1150.00, 780);
INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("computers", 3, 11500.00, 780);
INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("smart phones", 3, 750.00, 8880);

INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("history books", 4, 20.00, 500);
INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("kindle", 4, 100.00, 1500);
INSERT INTO products (product_name, department_id, price, stock_quantity ) VALUES ("e-books", 4, 10.00, 7700);

















