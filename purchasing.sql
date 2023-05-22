create table purchasing.entity (
    entity_id serial primary key
);

create table purchasing.vendor (
    vendor_entity_id serial,
    vendor_name varchar(55),
    vendor_active smallint check (vendor_active in(0, 1)),
    vendor_priority smallint check (vendor_priority in(0,1)),
    vendor_register_date timestamp,
    vendor_weburl varchar(1024),
    vendor_modified_date timestamp,
    foreign key (vendor_entity_id) references entity(entity_id),
    constraint vendor_entity_id_pk primary key (vendor_entity_id)
);

create table purchasing.employee (
    emp_id int primary key
);

create table purchasing.purchase_order_header (
    pohe_id serial primary key,
    pohe_number varchar(20) unique,
    pohe_status int check (pohe_status in(1, 2, 3, 4)),
    pohe_order_date timestamp,
    pohe_subtotal money,
    pohe_tax money,
    pohe_total_amount money,
    pohe_refund money,
    pohe_arrival_date timestamp,
    pohe_pay_type char(2) check (pohe_pay_type in('TR','CA')),
    pohe_emp_id int,
    pohe_vendor_id int,
    foreign key (pohe_emp_id) references employee(emp_id),
    foreign key (pohe_vendor_id) references vendor(vendor_entity_id)
);

create table purchasing.facilities (
    hofa_faci_id serial primary key
);

create table purchasing.stocks (
    stock_id serial primary key,
    stock_name varchar(255),
    stock_description varchar(255),
    stock_quantity smallint,
    stock_reorder_point smallint,
    stock_used smallint,
    stock_scrap smallint,
    stock_size varchar(25),
    stock_color varchar(15),
    stock_modified_date timestamp
);

create table purchasing.stock_photo (
    spho_id serial primary key,
    spho_thumbnail_filename varchar(50),
    spho_photo_filename varchar(50),
    spho_primary smallint check (spho_primary in(0, 1)),
    spho_url varchar(255),
    spho_stock_id int,
    foreign key (spho_stock_id) references stocks(stock_id)
);

create table purchasing.vendor_product (
    vepro_id serial primary key,
    vepro_qty_stocked int,
    vepro_qty_remaining int,
    vepro_price money,
    vepro_stock_id int,
    vepro_vendor_id int,
    foreign key (vepro_stock_id) references stocks(stock_id),
    foreign key (vepro_vendor_id) references vendor(vendor_entity_id)
);

create table purchasing.stock_detail (
    stod_stock_id int,
    stod_id serial,
    stod_barcode_number varchar(225) unique,
    stod_status int check (stod_status in(1, 2, 3, 4)),
    stod_notes varchar(1024),
    stod_faci_id int,
    stod_phone_id int,
    foreign key (stod_stock_id) references stocks(stock_id),
    foreign key (stod_faci_id) references facilities(hofa_faci_id),
    foreign key (stod_phone_id) references  purchase_order_header(pohe_id),
    constraint stod_stock_id_pk primary key (stod_stock_id, stod_id)
);

create table purchasing.purchase_order_detail (
    pode_pohe_id int,
    pode_id serial,
    pode_order_qty smallint,
    pode_price money,
    pode_line_total money,
    pode_received_qty decimal(8,2),
    pode_rejected_qty decimal(8,2),
    pode_stocked_qty decimal(9,2),
    pode_modified_date timestamp,
    pode_stock_id int,
    foreign key (pode_pohe_id) references purchase_order_header(pohe_id),
    foreign key (pode_stock_id) references stocks(stock_id),
    constraint pode_pohe_id_pk primary key (pode_pohe_id, pode_id)
);



-- insert data ---

-- Insert data ke tabel entity
insert into purchasing.entity (entity_id)
VALUES (1),
        (2),
        (3),
        (4),
        (5),
        (6),
        (7),
        (8),
        (9),
        (10);

-- Insert data ke tabel vendor
insert into purchasing. vendor (vendor_entity_id, vendor_name, vendor_active, vendor_priority, vendor_register_date, vendor_weburl, vendor_modified_date)
VALUES (1, 'Vendor A', 1, 1, current_timestamp, 'https://www.vendor-a.com', current_timestamp),
        (2, 'Vendor B', 1, 0, current_timestamp, 'https://www.vendor-b.com', current_timestamp),
        (3, 'Vendor C', 1, 1, current_timestamp, 'https://www.vendor-c.com', current_timestamp),
        (4, 'Vendor D', 0, 1, current_timestamp, 'https://www.vendor-d.com', current_timestamp),
        (5, 'Vendor E', 1, 0, current_timestamp, 'https://www.vendor-e.com', current_timestamp),
        (6, 'Vendor F', 1, 1, current_timestamp, 'https://www.vendor-f.com', current_timestamp),
        (7, 'Vendor G', 0, 0, current_timestamp, 'https://www.vendor-g.com', current_timestamp),
        (8, 'Vendor H', 1, 1, current_timestamp, 'https://www.vendor-h.com', current_timestamp),
        (9, 'Vendor I', 1, 0, current_timestamp, 'https://www.vendor-i.com', current_timestamp),
        (10, 'Vendor J', 1, 1, current_timestamp, 'https://www.vendor-j.com', current_timestamp);

-- Insert data ke tabel employee
insert into purchasing.employee (emp_id)
VALUES (1),
        (2),
        (3),
        (4),
        (5),
        (6),
        (7),
        (8),
        (9),
        (10);

-- Insert data ke tabel purchase_order_header
insert into purchasing.purchase_order_header (pohe_id, pohe_number, pohe_status, pohe_order_date, pohe_subtotal, pohe_tax, pohe_total_amount, pohe_refund, pohe_arrival_date, pohe_pay_type, pohe_emp_id, pohe_vendor_id)
VALUES (1, 'PO001', 1, current_timestamp, 100.00, 10.00, 110.00, 0.00, current_timestamp, 'TR', 1, 1),
        (2, 'PO002', 2, current_timestamp, 200.00, 20.00, 220.00, 0.00, current_timestamp, 'CA', 2, 2),
        (3, 'PO003', 3, current_timestamp, 300.00, 30.00, 330.00, 0.00, current_timestamp, 'TR', 3, 3),
        (4, 'PO004', 4, current_timestamp, 400.00, 40.00, 440.00, 0.00, current_timestamp, 'CA', 4, 4),
        (5, 'PO005', 1, current_timestamp, 500.00, 50.00, 550.00, 0.00, current_timestamp, 'TR', 5, 5),
        (6, 'PO006', 2, current_timestamp, 600.00, 60.00, 660.00, 0.00, current_timestamp, 'CA', 6, 6),
        (7, 'PO007', 3, current_timestamp, 700.00, 70.00, 770.00, 0.00, current_timestamp, 'TR', 7, 7),
        (8, 'PO008', 4, current_timestamp, 800.00, 80.00, 880.00, 0.00, current_timestamp, 'CA', 8, 8),
        (9, 'PO009', 1, current_timestamp, 900.00, 90.00, 990.00, 0.00, current_timestamp, 'TR', 9, 9),
        (10, 'PO010', 2, current_timestamp, 1000.00, 100.00, 1100.00, 0.00, current_timestamp, 'CA', 10, 10);

-- Insert data ke tabel facilities
insert into purchasing.facilities (hofa_faci_id)
VALUES (1),
        (2),
        (3),
        (4),
        (5),
        (6),
        (7),
        (8),
        (9),
        (10);

-- Insert data ke tabel stocks
insert into purchasing.stocks (stock_id, stock_name, stock_description, stock_quantity, stock_reorder_point, stock_used, stock_scrap, stock_size, stock_color, stock_modified_date)
VALUES (1, 'Stock A', 'Deskripsi Stock A', 10, 5, 2, 1, 'Medium', 'Blue', current_timestamp),
        (2, 'Stock B', 'Deskripsi Stock B', 15, 8, 5, 0, 'Small', 'Red', current_timestamp),
        (3, 'Stock C', 'Deskripsi Stock C', 20, 10, 3, 2, 'Large', 'Green', current_timestamp),
        (4, 'Stock D', 'Deskripsi Stock D', 12, 6, 4, 0, 'Small', 'Yellow', current_timestamp),
        (5, 'Stock E', 'Deskripsi Stock E', 8, 4, 2, 1, 'Medium', 'Purple', current_timestamp),
        (6, 'Stock F', 'Deskripsi Stock F', 18, 9, 6, 0, 'Large', 'Orange', current_timestamp),
        (7, 'Stock G', 'Deskripsi Stock G', 14, 7, 4, 1, 'Small', 'Gray', current_timestamp),
        (8, 'Stock H', 'Deskripsi Stock H', 22, 11, 8, 2, 'Extra Large', 'Black', current_timestamp),
        (9, 'Stock I', 'Deskripsi Stock I', 16, 8, 5, 1, 'Medium', 'White', current_timestamp),
        (10, 'Stock J', 'Deskripsi Stock J', 25, 12, 9, 3, 'Large', 'Brown', current_timestamp);

-- Insert data ke tabel stock_photo
insert into purchasing.stock_photo (spho_id, spho_thumbnail_filename, spho_photo_filename, spho_primary, spho_url, spho_stock_id)
VALUES (1, 'thumb1.jpg', 'photo1.jpg', 1, 'https://www.example.com/photo1.jpg', 1),
        (2, 'thumb2.jpg', 'photo2.jpg', 0, 'https://www.example.com/photo2.jpg', 2),
        (3, 'thumb3.jpg', 'photo3.jpg', 1, 'https://www.example.com/photo3.jpg', 3),
        (4, 'thumb4.jpg', 'photo4.jpg', 1, 'https://www.example.com/photo4.jpg', 4),
        (5, 'thumb5.jpg', 'photo5.jpg', 0, 'https://www.example.com/photo5.jpg', 5),
        (6, 'thumb6.jpg', 'photo6.jpg', 1, 'https://www.example.com/photo6.jpg', 6),
        (7, 'thumb7.jpg', 'photo7.jpg', 0, 'https://www.example.com/photo7.jpg', 7),
        (8, 'thumb8.jpg', 'photo8.jpg', 1, 'https://www.example.com/photo8.jpg', 8),
        (9, 'thumb9.jpg', 'photo9.jpg', 0, 'https://www.example.com/photo9.jpg', 9),
        (10, 'thumb10.jpg', 'photo10.jpg', 1, 'https://www.example.com/photo10.jpg', 10);

-- Insert data ke tabel vendor_product
insert into purchasing.vendor_product (vepro_id, vepro_qty_stocked, vepro_qty_remaining, vepro_price, vepro_stock_id, vepro_vendor_id)
VALUES (1, 100, 50, 10.00, 1, 1),
        (2, 200, 100, 20.00, 2, 2),
        (3, 300, 150, 30.00, 3, 3),
        (4, 400, 200, 40.00, 4, 4),
        (5, 500, 250, 50.00, 5, 5),
        (6, 600, 300, 60.00, 6, 6),
        (7, 700, 350, 70.00, 7, 7),
        (8, 800, 400, 80.00, 8, 8),
        (9, 900, 450, 90.00, 9, 9),
        (10, 1000, 500, 100.00, 10, 10);

-- Insert data ke tabel stock_detail
insert into purchasing.stock_detail (stod_stock_id, stod_id, stod_barcode_number, stod_status, stod_notes, stod_faci_id, stod_phone_id)
VALUES (1, 1, 'BC001', 1, 'Catatan Stock 1', 1, 1),
        (2, 2, 'BC002', 2, 'Catatan Stock 2', 2, 2),
        (3, 3, 'BC003', 3, 'Catatan Stock 3', 3, 3),
        (4, 4, 'BC004', 1, 'Catatan Stock 4', 4, 4),
        (5, 5, 'BC005', 2, 'Catatan Stock 5', 5, 5),
        (6, 6, 'BC006', 3, 'Catatan Stock 6', 6, 6),
        (7, 7, 'BC007', 1, 'Catatan Stock 7', 7, 7),
        (8, 8, 'BC008', 2, 'Catatan Stock 8', 8, 8),
        (9, 9, 'BC009', 3, 'Catatan Stock 9', 9, 9),
        (10, 10, 'BC010', 1, 'Catatan Stock 10', 10, 10);

-- Insert data ke tabel purchase_order_detail
insert into purchasing.purchase_order_detail (pode_pohe_id, pode_id, pode_order_qty, pode_price, pode_line_total, pode_received_qty, pode_rejected_qty, pode_stocked_qty, pode_modified_date, pode_stock_id)
VALUES (1, 1, 5, 10.00, 50.00, 2.00, 0.00, 2.00, current_timestamp, 1),
        (2, 2, 10, 20.00, 200.00, 8.00, 0.00, 8.00, current_timestamp, 2),
        (3, 3, 15, 30.00, 450.00, 12.00, 0.00, 12.00, current_timestamp, 3),
        (4, 4, 20, 40.00, 800.00, 16.00, 0.00, 16.00, current_timestamp, 4),
        (5, 5, 25, 50.00, 1250.00, 20.00, 0.00, 20.00, current_timestamp, 5),
        (6, 6, 30, 60.00, 1800.00, 24.00, 0.00, 24.00, current_timestamp, 6),
        (7, 7, 35, 70.00, 2450.00, 28.00, 0.00, 28.00, current_timestamp, 7),
        (8, 8, 40, 80.00, 3200.00, 32.00, 0.00, 32.00, current_timestamp, 8),
        (9, 9, 45, 90.00, 4050.00, 36.00, 0.00, 36.00, current_timestamp, 9),
        (10, 10, 50, 100.00, 5000.00, 40.00, 0.00, 40.00, current_timestamp, 10);


