create database techcorp;
use techcorp;
CREATE TABLE product (
	product_id  INT AUTO_INCREMENT PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
    );
    SELECT * FROM product;
    ALTER TABLE product ADD COLUMN discount DECIMAL(5,2) DEFAULT 0;
    
    CREATE TABLE customer (
		customer_id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email VARCHAR(50) UNIQUE,
        phone VARCHAR(20),
        address VARCHAR(100)
);
SELECT * FROM customer;

CREATE TABLE orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY, 
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
SELECT * FROM orders;

CREATE TABLE orderdetail (
	order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
SELECT * FROM orderdetail;

CREATE TABLE employee (
	employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR (100),
    phone VARCHAR (20),
    hire_date DATE,
    department VARCHAR(50)
);
SELECT * FROM employee;

CREATE TABLE support_ticket (
	ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    issue TEXT,
    status VARCHAR(20),
    created_at DATETIME,
    resolved_at DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);
SELECT * FROM support_ticket;
