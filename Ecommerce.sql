CREATE DATABASE ecommere;
USER ecommerce
CREATE TABLE Customer(
  customer_id int,
  first_name varchar(100),
  last_name varchar(100),
  email varchar(100),
  password varchar(100),
  address varchar(100),
  phone_number varchar(100));
ALTER TABLE Customer ADD CONSTRAINT PRIMARY KEY(customer_id);
ALTER TABLE Customer MODIFY COLUMN customer_id INT auto_increment;
ALTER TABLE Customer AUTO_INCREMENT=100;

CREATE TABLE Product(
  product_id int primary key auto_increment,
  sku varchar(100),
  description varchar(100),
  price decimal(10,2),
  stock(int),
  category_id int);
ALTER TABLE Product auto_increment=100;

CREATE TABLE Category(
  category_id int primary key auto_increment,
  name varchar(100));
ALTER TABLE Category auto_increment=100;
ALTER TABLE Product ADD CONSTRAINT FOREIGN KEY(category_id) REFERENCES Category(category_id);

CREATE TABLE Wishlist(
  wishlist_id int,
  customer_id int,
  product_id int);
ALTER TABLE Wishlist ADD CONSTRAINT PRIMARY KEY(wishlist_id,customer_id);
ALTER TABLE Wishlist MODIFY COLUMN wishlist_id INT auto_increment;
ALTER TABLE Wishlist auto_increment=100;
ALTER TABLE Wishlist ADD CONSTRAINT FOREIGN KEY(customer_id) REFERENCES Customer(customer_id);
ALTER TABLE Wishlist ADD CONSTRAINT FOREIGN KEY(product_id) REFERENCES Product(product_id);

CREATE TABLE Cart(
  cart_id int,
  quantity int,
  customer_id int,
  product_id int);
ALTER TABLE Cart ADD CONSTRAINT PRIMARY KEY(cart_id,customer_id);
ALTER TABLE Cart MODIFY COLUMN cart_id INT auto_increment;
ALTER TABLE Cart auto increment=100;
ALTER TABLE Cart ADD CONSTRAINT FOREIGN KEY(customer_id) REFERENCES Customer(customer_id);
ALTER TABLE Cart ADD CONSTRAINT FOREIGN KEY(product_id) REFERENCES Product(product_id);


CREATE TABLE Payment(
  payment_id int primary key auto_increment,
  payment_date datetime,
  payment_method varchar(100),
  amount decimal(10,2),
  customer_id int);
ALTER TABLE Payment auto_increment=100;
ALTER TABLE Payment ADD CONSTRAINT FOREIGN KEY(customer_id) REFERENCES Customer(customer_id);

CREATE TABLE Shipment(
  shipment_id int primary key auto_increment,
  shipment_date datetime,
  address varchar(100),
  city varchar(100),
  state varchar(20),
  country varchar(50),
  zip_code varchar(10),
  customer_id int);
ALTER TABLE Shipment auto_increment=100;
ALTER TABLE Shipment ADD CONSTRAINT FOREIGN KEY(customer_id) Customer(customer_id);

CREATE TABLE Orders(
  order_id int primary key auto_increment,
  order_date datetime,
  total_price decimal(10,2),
  customer_id int,
  payment_id int,
  shipment_id int);
 ALTER TABLE Orders auto_increment=100;
 ALTER TABLE Orders ADD CONSTRAINT FOREIGN KEY(customer_id) REFERENCES Customer(customer_id);
 ALTER TABLE Orders ADD CONSTRAINT FOREIGN KEY(payment_id) REFERENCES Payment(payment_id);
 ALTER TABLE Orders ADD CONSTRAINT FOREIGN KEY(shipment_id) REFERENCES Shipment(shipment_id);

CREATE TABLE Order_Item(
  order_item_id int,
  quantity int,
  price decimal(10,2),
  product_id int,
  order_id int);
ALTER TABLE Order_Item ADD CONSTRAINT PRIMARY KEY(order_item_id,order_id);
ALTER TABLE Order_Item MODIFY COLUMN order_item_id auto_increment;
ALTER TABLE Order_item auto_increment=100;
ALTER TABLE Order_Item ADD CONSTRAINT FOREIGN KEY(product_id) REFERENCES Product(product_id);
ALTER TABLE Order_Item ADD CONSTRAINT FOREIGN KEY(order_id) REFERENCES Orders(order_id);

