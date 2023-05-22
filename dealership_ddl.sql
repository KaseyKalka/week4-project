CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150),
    customer_address VARCHAR(150),
    email VARCHAR(150)
);

CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    model VARCHAR(150),
    make VARCHAR(150),
    year VARCHAR(50),
    car_type VARCHAR(150)
);

CREATE TABLE staff(
    staff_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150),
    position VARCHAR(100)
);

CREATE TABLE services(
    service_id SERIAL PRIMARY KEY,
    service_date DATE,
    service_type VARCHAR(100),
    invoice_id INTEGER,
    staff_id INTEGER,
    car_id INTEGER,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);

CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    amount INTEGER,
    invoice_number INTEGER,
    customer_id INTEGER,
    staff_id INTEGER,
    car_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (car_id) REFERENCES car(car_id)
);

CREATE TABLE bank(
    bank_id SERIAL PRIMARY KEY,
    car_id INTEGER,
    customer_id INTEGER,
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

ALTER TABLE customer
ADD invoice_id INTEGER,
ADD car_id INTEGER,
ADD FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
ADD FOREIGN KEY (car_id) REFERENCES car(car_id);