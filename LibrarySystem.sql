CREATE DATABASE library_system;
USE library_system;

CREATE TABLE author(
  author_id int primary key auto_increment,
  name varchar(255));
CREATE TABLE book(
  book_id int primary key auto_increment,
  title varchar(255),
  category_id int);
CREATE TABLE category(
  category_id int primary key auto_increment,
  name varchar(255));
CREATE TABLE book_author(
  book_id int,
  author_id int);

ALTER TABLE author auto_increment=100;
ALTER TABLE book auto_increment=100;
ALTER TABLE category auto_increment=100;

ALTER TABLE book ADD CONSTRAINT FOREIGN KEY(category_id) REFERENCES category(category_id);
ALTER TABLE book_author ADD CONSTRAINT PRIMARY KEY(book_id,author_id);
ALTER TABLE book_author ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES book(book_id);
ALTER TABLE book_author ADD CONSTRAINT FOREIGN KEY(author_id) REFERENCES author(author_id);

CREATE TABLE publisher(
  publilsher_id int primary key auto_increment,
  name varchar(255)):
ALTER TABLE publisher auto_increment=100;

CREATE TABLE book_copy(
  book_copy_id int primary key auto_increment,
  year_published int,
  book_id int,
  publisher_id int);
ALTER TABLE book_copy auto_increment=100;
ALTER TABLE book_copy ADD CONSTRAINT FOREIGN KEY(book_id) book(book_id);
ALTER TABLE book_copy ADD CONSTRAINT FOREIGN KEY(publisher_id) publisher(publisher_id);

CREATE TABLE patron_account(
  pa_id int primary key auto_increment
  card_number varchar(10) unique,
  first_name varchar(255),
  surname varchar(255),
  email varchar(255),
  status varchar(10));
ALTER TABLE patron_account auto_increment=100;

CREATE TABLE hold(
  hold_id in primary key auto_increment,
  start_time timestamp,
  end_time timestamp,
  book_copy_id int,
  pa_id int);
ALTER TABLE hold auto_increment=100;
ALTER TABLE hold ADD CONSTRAINT FOREIGN KEY(book_copy_id) REFERENCES book_copy(book_copy_id):
ALTER TABLE hold ADD CONSTRAINT FOREIGN KEY(pa_id) REFERENCES patron_account(pa_id);

CREATE TABLE wait_list(
  patron_id int,
  book_id int);
ALTER TABLE wait_list ADD CONSTRAINT PRIMARY KEY(patron_id,book_id);
ALTER TABLE wait_list ADD CONSTRAINT FOREIGN KEY(patron_id) REFERENCES patron_account(pa_id);
ALTER TABLE wait_list ADD CONSTRAINT FOREIGN KEY(book_id) REFERENCES book(book_id);
  
CREATE TABLE notification(
  not_id int primary key auto_increment,
  send_at timestamp,
  type varchar(20),
  pa_id int );
ALTER TABLE notification auto_increment=100;
ALTER TABLE notification ADD CONSTRAINT FOREIGN KEY(pa_id) REFERENCES patron_account(pa_id);

CREATE TABLE checkout(
id int primary key auto_increment,
start_time timestamp,
end_time timestamp,
book_copy_id int,
pa_id int,
is_returned boolean);
ALTER TABLE checkout AUTO_INCREMENT=100;
ALTER TABLE checkout ADD CONSTRAINT FOREIGN KEY(book_copy_id) REFERENCES book_copy(book_copy_id);
ALTER TABLE checkout ADD CONSTRAINT FOREIGN KEY(pa_id) REFERENCES patron_account(pa_id);
