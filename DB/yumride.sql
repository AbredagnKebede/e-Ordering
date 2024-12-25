CREATE DATABASE yumride;
USE yumride;
CREATE TABLE yumride.deliveries (
   delivery_id INT NOT NULL AUTO_INCREMENT,
   order_id INT NULL,
   cus_id INT NULL,
   address VARCHAR(255) NULL,
   status VARCHAR(45) NULL,
   estimate_time VARCHAR(45) NULL,
   actual_del_time VARCHAR(45) NULL,
   PRIMARY KEY (delivery_id));



 CREATE TABLE yumride.orders (
   o_id INT NOT NULL AUTO_INCREMENT,
   p_id INT NULL,
   u_id INT NULL,
   o_quantity INT NULL,
   o_date VARCHAR(450) NULL,
   PRIMARY KEY (o_id));



 CREATE TABLE yumride.products (
   id INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(450) NULL,
   category VARCHAR(450) NULL,
   price DOUBLE NULL,
   image VARCHAR(450) NULL,
   PRIMARY KEY (id));


 CREATE TABLE yumride.users (
   id INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(45) NULL,
   email VARCHAR(45) NULL,
   phone VARCHAR(10) NULL,
   address VARCHAR(255) NULL,
   username VARCHAR(45) NULL,
   password VARCHAR(255) NULL,
   role VARCHAR(45) NULL,
   PRIMARY KEY (id));
  
  
 insert into yumride.products values(0,'Beef Burger', 'Burger', 1600, 'https://tinyurl.com/yq8jq67v');
 insert into yumride.products values(0,'Chicken Burger', 'Burger', 1550, 'https://tinyurl.com/ymg9kyrs');
 insert into yumride.products values(0,'Cheese Burger', 'Burger', 1500, 'https://tinyurl.com/yvfaoq89');
 insert into yumride.products values(0,'Smoked Burger', 'Burger', 1540, 'https://tinyurl.com/ywetzjqh');
 insert into yumride.products values(0,'Chocolate Ice Cream', 'Dessert', 200, 'https://tinyurl.com/yw5lq86p');
 insert into yumride.products values(0,'Coca Cola', 'Beverage', 175, 'https://rb.gy/8z5b8');
 insert into yumride.products values(0,'Flurry', 'Dessert', 450, 'https://tinyurl.com/ynt2mz8l');
 insert into yumride.products values(0,'Sprite', 'Beverage', 150, 'https://tinyurl.com/yujvw8hz');
 insert into yumride.products values(0,'Chicken Katsu Burger', 'Burger', 1680, 'https://tinyurl.com/yuh2e6bb');
 insert into yumride.products values(0,'Almond Cupcake', 'Dessert', 290, 'https://tinyurl.com/yn6jwvxz');
 insert into yumride.products values(0,'Yoghurt with Blueberry', 'Dessert', 460, 'https://tinyurl.com/yobhzl7v');
 insert into yumride.products values(0,'Mango juice', 'Beverage', 330, 'https://tinyurl.com/ynlwt23d');
 insert into yumride.products values(0,'Strawberry Sundae', 'Dessert', 510, 'https://tinyurl.com/yqlekswk');
 insert into yumride.products values(0,'Lemonade juice', 'Beverage', 200, 'https://tinyurl.com/ytyww8e7');
 insert into yumride.products values(0,'Grilled Chicken Burger', 'Burger', 1590, 'https://tinyurl.com/yrwjh9tm');
 
 
 insert into yumride.orders values(0, 1, 65, 4, '2024-12-10');
 insert into yumride.orders values(0, 5, 672, 2, '2024-12-11');
 insert into yumride.orders values(0, 8, 627, 3, '2024-12-12');
 insert into yumride.orders values(0, 2, 77, 1, '2024-12-13');
 insert into yumride.orders values(0, 3, 27, 4, '2024-12-14');
 insert into yumride.orders values(0, 99, 65, 2, '2024-12-15');
 insert into yumride.orders values(0, 11, 62, 5, '2024-12-16');