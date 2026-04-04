CREATE DATABASE lt03k17;
USE lt03k17;

CREATE TABLE country(
	country_id SMALLINT(5) PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(50) NOT NULL,
    last_update TIMESTAMP NOT NULL
);

CREATE TABLE city(
	city_id SMALLINT(5) PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(50) NOT NULL,
    country_id SMALLINT(5) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE address(
	address_id SMALLINT(5) PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(50) NOT NULL,
    address2 VARCHAR(50),
    district VARCHAR(20) NOT NULL,
    city_id SMALLINT(5) NOT NULL,
    postal_code VARCHAR(10),
    phone VARCHAR(20) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE film_text(
	film_id SMALLINT(6) PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE actor(
	actor_id SMALLINT(5) PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    last_update TIMESTAMP NOT NULL
);

CREATE TABLE category(
	category_id TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL,
    last_update TIMESTAMP NOT NULL
);

CREATE TABLE language(
	language_id TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
    name CHAR(20) NOT NULL,
    last_update TIMESTAMP NOT NULL
);

CREATE TABLE film(
	film_id SMALLINT(5) PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year YEAR,
    language_id TINYINT(3) NOT NULL,
    original_language_id TINYINT(3),
    rental_duration TINYINT(3) NOT NULL,
    rental_rate DECIMAL(4, 2) NOT NULL,
    length SMALLINT(5),
    replacement_cost DECIMAL(5, 2) NOT NULL,
    rating ENUM('1', '2', '3'),
    special_features SET('3d', 'imax'),
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (language_id) REFERENCES language(language_id),
    FOREIGN KEY (original_language_id) REFERENCES language(language_id)
);

CREATE TABLE film_actor(
	actor_id SMALLINT(5),
    film_id SMALLINT(5),
    last_update TIMESTAMP NOT NULL,
    PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

CREATE TABLE film_category(
	film_id SMALLINT(5),
    category_id TINYINT(3),
    last_update TIMESTAMP NOT NULL,
    PRIMARY KEY (film_id, category_id),
    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE store(
	store_id TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
    manager_staff_id TINYINT(3) NOT NULL,
    address_id SMALLINT(5),
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE staff(
	staff_id TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    address_id SMALLINT(5) NOT NULL,
    picture BLOB,
    email VARCHAR(50),
    store_id TINYINT(3) NOT NULL,
    active TINYINT(1) NOT NULL,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(40),
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

ALTER TABLE store ADD FOREIGN KEY (manager_staff_id) REFERENCES staff(staff_id);

CREATE TABLE customer(
	customer_id SMALLINT(5) PRIMARY KEY AUTO_INCREMENT,
    store_id TINYINT(3) NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(50),
    address_id SMALLINT(5) NOT NULL,
    active TINYINT(1) NOT NULL,
    create_date DATETIME NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

CREATE TABLE inventory(
	inventory_id MEDIUMINT(8) PRIMARY KEY AUTO_INCREMENT,
    film_id SMALLINT(5) NOT NULL,
    store_id TINYINT(3) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

CREATE TABLE rental(
	rental_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    rental_date DATETIME NOT NULL,
    inventory_id MEDIUMINT(8) NOT NULL,
    customer_id SMALLINT(5) NOT NULL,
    return_date DATETIME,
    staff_id TINYINT(3) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE payment(
	payment_id SMALLINT(5) PRIMARY KEY AUTO_INCREMENT,
    customer_id SMALLINT(5) NOT NULL,
    staff_id TINYINT(3) NOT NULL,
    rental_id INT(11),
    amount DECIMAL(5, 2) NOT NULL,
    payment_date DATETIME NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (rental_id) REFERENCES rental(rental_id)
);