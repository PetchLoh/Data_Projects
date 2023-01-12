-- Create table
-- Menu Table
CREATE TABLE menu(
    menu_id INT UNIQUE,
    menu TEXT,
    price INT,
    staff_id,
    PRIMARY KEY (menu_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);
INSERT INTO menu VALUES 
    (1, 'Sandwich', 25, 3),
    (2, 'Hotdog', 30, 3),
    (3, 'Cheese Burger', 125, 3),
    (4, 'Burger', 99, 3),
    (5, 'French Fries', 69, 4),
    (6, 'Fries Chicken', 20, 4),
    (7, 'Nugget', 25, 4),
    (8, 'Onion ring', 25, 4),
    (9, 'Ice Cream', 10, 5),
    (10, 'Drinks', 10, 5);

-- Staffs Table
CREATE TABLE staff(
    staff_id INT UNIQUE,
    name TEXT,
    position TEXT,
    tel INT,
    PRIMARY KEY (staff_id)
);
INSERT INTO staff VALUES 
    (1, "Petch", "Owner", 0800000001),
    (2, "Mar", "Manager", 0800000022),
    (3, "Mooh", "Chief", 0804560333),
    (4, "Dew", "Chief", 0800453444),
    (5, "Mai", "Chief", 0806703444),
    (6, "Fia", "Cashier", 0803403444),
    (7, "Kiah", "Cashier", 0809880344),
    (8, "Teen", "Cashier", 0806343444),
    (9, "Ton", "Waiter", 0885703444),
    (10, "Mony", "Waitress", 0800673444);

-- Payments Table
CREATE TABLE payment(
    payment_id INT UNIQUE,
    methods TEXT,
    PRIMARY KEY (payment_id)
);
INSERT INTO payment VALUES 
    (101, "Cash"),
    (102, "Credit card"),
    (103, "Bank transfer"),
    (104, "True money"),
    (105, "Applepay"),
    (106, "Alipay"),
    (107, "Googlepay"),
    (108, "Linepay");

-- Members Table
CREATE TABLE member (
    member_id INT,
    name TEXT,
    regis_date DATETIME,
    expired_date DATETIME,
    PRIMARY KEY (member_id)
);
INSERT INTO member VALUES 
    (301, "Malenia", '2021-01-01', '2022-01-02'),
    (302, "Tarnished", '2022-04-02', '2023-04-03'),
    (303, "Godfrye", '2020-05-08', '2021-05-09'),
    (304, "Mohg", '2022-05-02', '2023-05-03'),
    (305, "Ranni", '2021-07-24', '2022-07-25'),
    (306, "Marika", '2022-01-11', '2023-01-12'),
    (307, "Radahn", '2021-10-20', '2022-10-21'),
    (308, "Radagon", '2019-12-24', '2020-12-25'),
    (309, "Morgott", '2021-11-15', '2022-11-16'),
    (310, "Ryhard", '2022-05-04', '2023-05-06');

--Order Table
CREATE TABLE orders(
    order_id INT,
    time DATETIME,
    menu_id INT,
    member_id INT,
    cashier_id INT, -- 6 7 8
    payment_id INT,
    PRIMARY KEY (order_id),
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (cashier_id) REFERENCES staff(staff_id),
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id)
);
INSERT INTO orders VALUES 
    (220122001, '2022-01-22', 3, NULL, 6, 101),
    (220122002, '2022-01-22', 5, 305, 8, 102),
    (220130094, '2022-01-30', 1, 304, 7, 103),
    (220201012, '2022-02-01', 4, NULL, 7, 101),
    (220215006, '2022-02-15', 6, 301, 6, 108),
    (220323024, '2022-03-23', 7, 303, 8, 107),
    (220412111, '2022-04-12', 2, NULL, 7, 101),
    (220425012, '2022-04-25', 1, 309, 6, 105),
    (220430091, '2022-04-30', 3, 301, 6, 108),
    (220501001, '2022-05-01', 2, 302, 7, 104);
