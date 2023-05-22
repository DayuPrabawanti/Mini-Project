-- TABEL SPECIAL_OFFERS
create table booking.special_offers(
	spof_id serial primary key,
	spof_name varchar(55),
	spof_description varchar(255),
	spof_type varchar(50),
	spof_descount money,
	spof_start_date timestamp,
	spof_end_date timestamp,
	spof_min_qty integer,
	spof_max_qty integer,
	spof_modified_date timestamp
);

-- TABEL SPECIAL_OFFERS_COUPONS
create table booking.special_offer_coupons(
	soco_id serial primary key,
	soco_borde_id integer,
	soco_spof_id integer,
	foreign key (soco_borde_id) references booking.booking_order_detail (borde_id),
	foreign key (soco_spof_id) references booking.special_offers (spof_id)
);

-- TABEL BOOKING_ORDER_DETAIL
create table booking.booking_order_detail(
	border_boor_id integer,
	borde_id serial primary key,
	borde_checkin timestamp,
	borde_checkout timestamp,
	borde_adults integer,
	borde_kids integer,
	borde_price money,
	borde_extra money,
	borde_discount money,
	borde_tax money,
	borde_subtotal money,
	borde_faci_id integer,
	foreign key (border_boor_id) references booking.booking_orders (boor_id)
	foreign key (borde_faci_id) references facilities (faci_id)
);
drop table booking.booking_order_detail

-- TABEL USER_BREAKFEAST
create table booking.user_breakfeast(
	usbr_borde_id integer,
	usbr_modified_date timestamp,
	usbr_total_vacant smallint,
	constraint borde_modified_pk primary key (usbr_borde_id, usbr_modified_date),
	foreign key (usbr_borde_id) references booking.booking_order_detail (borde_id)
);

-- TABEL BOOKING_ORDERS
create table booking.booking_orders(
	boor_id serial primary key,
	boor_order_number varchar(20) unique,
	boor_order_date timestamp,
	boor_arrival_date timestamp,
	boor_total_room smallint,
	boor_total_guest smallint,
	boor_discount money,
	boor_total_tax money,
	boor_total_amount money,
	boor_down_payment money,
	boor_pay_type char(2),
	boor_is_paid char(2),
	boor_type varchar(15),
	boor_card_number varchar(25),
	boor_member_type varchar(15),
	boor_status varchar(15),
	boor_user_id integer,
	boor_hotel_id integer,
	foreign key (boor_user_id) references booking.users (user_id)
-- 	foreign key (boor_hotel_id) references hotels (hotel_id)
);

-- TABEL BOOKING_ORDER_DETAIL_AREA
create table booking.booking_order_detail_extra(
	boex_id serial primary key,
	boex_price money,
	boex_qty smallint,
	boex_subtotal money,
	boex_measure_unit varchar(50),
	boex_borde_id integer,
	boex_prit_id integer,
	foreign key (boex_borde_id) references booking.booking_order_detail (borde_id),
	foreign key (boex_prit_id) references booking.price_items (prit_id)
);

-- TABEL USERS
create table booking.users(
	user_id integer primary key
);

-- TABEL PRICE_ITEMS
create table booking.price_items(
	prit_id integer primary key
);



-- INSERT DATA BOOKING_ORDERS
select * from booking.booking_orders

INSERT INTO booking.booking_orders (boor_id, boor_order_number, boor_order_date, boor_arrival_date, boor_total_room, boor_total_guest, boor_discount, boor_total_tax, boor_total_amount, boor_down_payment, boor_pay_type, boor_is_paid, boor_type, boor_card_number, boor_member_type, boor_status, boor_user_id, boor_hotel_id)
VALUES
    (1, 'BO#20230101-0001', '2023-01-01', '2023-01-05', 1, 2, 5.00, 2.50, 100.50, 50.00, 'CR', 'DP', 'T', '1234567890123456', 'Gold', 'BOOKING', 1, 1),
    (2, 'BO#20230102-0002', '2023-01-02', '2023-01-10', 2, 1, 2.00, 1.00, 80.00, 40.00, 'C', 'P', 'C', '2345678901234567', 'Silver', 'CHECKIN', 2, 2),
    (3, 'BO#20230103-0003', '2023-01-03', '2023-01-15', 1, 2, 8.50, 4.25, 150.75, 75.00, 'D', 'R', 'I', '3456789012345678', 'Bronze', 'CHECKOUT', 3, 3),
    (4, 'BO#20230104-0004', '2023-01-04', '2023-01-20', 2, 1, 5.00, 2.50, 100.50, 50.00, 'PG', 'DP', 'T', '4567890123456789', 'Gold', 'CLEANING', 4, 4),
    (5, 'BO#20230105-0005', '2023-01-05', '2023-01-15', 1, 2, 10.00, 5.00, 120.00, 60.00, 'CR', 'P', 'C', '5678901234567890', 'Silver', 'CANCELLED', 5, 5),
    (6, 'BO#20230106-0006', '2023-01-06', '2023-01-15', 2, 1, 5.00, 2.50, 90.50, 45.00, 'C', 'R', 'I', '6789012345678901', 'Bronze', 'BOOKING', 6, 6),
    (7, 'BO#20230107-0007', '2023-01-07', '2023-01-20', 1, 2, 7.25, 3.63, 157.88, 79.00, 'D', 'DP', 'T', '7890123456789012', 'Gold', 'CHECKIN', 7, 7),
    (8, 'BO#20230108-0008', '2023-01-08', '2023-01-25', 2, 1, 15.00, 7.50, 117.50, 58.75, 'PG', 'P', 'C', '8901234567890123', 'Silver', 'CHECKOUT', 8, 8),
    (9, 'BO#20230109-0009', '2023-01-09', '2023-01-25', 1, 2, 11.00, 5.50, 130.50, 65.25, 'CR', 'R', 'I', '9012345678901234', 'Bronze', 'CLEANING', 9, 9),
    (10, 'BO#20230110-0010', '2023-01-10', '2023-01-30', 2, 1, 8.50, 4.25, 96.75, 48.38, 'C', 'DP', 'T', '0123456789012345', 'Gold', 'CANCELLED', 10, 10);


-- INSERT DATA BOOKING_ORDER_DETAIL
INSERT INTO booking.booking_order_detail (border_boor_id, borde_id, borde_checkin, borde_checkout, borde_adults, borde_kids, borde_price, borde_extra, borde_discount, borde_tax, borde_subtotal, borde_faci_id)
VALUES
    (1, 1, '2023-01-04', '2023-01-15', 2, 1, 100.00, 20.00, 10.00, 5.00, 115.00, 1),
    (2, 2, '2023-01-09', '2023-01-20', 1, 0, 75.00, 10.00, 5.00, 3.75, 82.75, 2),
    (3, 3, '2023-01-14', '2023-01-25', 2, 2, 150.00, 30.00, 8.50, 7.50, 164.00, 3),
    (4, 4, '2023-01-19', '2023-01-30', 1, 0, 80.00, 15.00, 15.00, 4.00, 84.00, 4),
    (5, 5, '2023-01-14', '2023-01-20', 2, 1, 120.00, 20.00, 12.75, 6.00, 141.25, 5),
    (6, 6, '2023-01-14', '2023-01-25', 1, 0, 90.00, 10.00, 9.99, 4.50, 95.51, 6),
    (7, 7, '2023-01-19', '2023-01-30', 2, 2, 160.00, 30.00, 7.25, 8.00, 189.75, 7),
    (8, 8, '2023-01-24', '2023-01-30', 1, 0, 85.00, 20.00, 20.50, 5.50, 89.00, 8),
    (9, 9, '2023-01-24', '2023-01-30', 2, 1, 130.00, 25.00, 11.00, 6.75, 143.75, 9),
    (10, 10, '2023-01-29', '2023-02-04', 1, 0, 95.00, 10.00, 6.75, 3.25, 104.50, 10);


-- INSERT DATA SPECIAL_OFFERS
INSERT INTO booking.special_offers (spof_id, spof_name, spof_description, spof_type, spof_discount, spof_start_date, spof_end_date, spof_min_qty, spof_max_qty, spof_modified_date)
VALUES
    (1, 'Offer 1', 'Description for Offer 1', 'T', 10.00, '2023-01-01', '2023-01-31', 1, 5, '2023-01-15'),
    (2, 'Offer 2', 'Description for Offer 2', 'C', 5.00, '2023-02-01', '2023-02-28', 2, 10, '2023-02-10'),
    (3, 'Offer 3', 'Description for Offer 3', 'I', 8.50, '2023-03-01', '2023-03-31', 1, 3, '2023-03-20'),
    (4, 'Offer 4', 'Description for Offer 4', 'T', 15.00, '2023-04-01', '2023-04-30', 2, 5, '2023-04-12'),
    (5, 'Offer 5', 'Description for Offer 5', 'C', 12.75, '2023-05-01', '2023-05-31', 1, 2, '2023-05-25'),
    (6, 'Offer 6', 'Description for Offer 6', 'I', 9.99, '2023-06-01', '2023-06-30', 2, 4, '2023-06-05'),
    (7, 'Offer 7', 'Description for Offer 7', 'T', 7.25, '2023-07-01', '2023-07-31', 1, 5, '2023-07-18'),
    (8, 'Offer 8', 'Description for Offer 8', 'C', 20.50, '2023-08-01', '2023-08-31', 2, 3, '2023-08-08'),
    (9, 'Offer 9', 'Description for Offer 9', 'I', 11.00, '2023-09-01', '2023-09-30', 1, 4, '2023-09-22'),
    (10, 'Offer 10', 'Description for Offer 10', 'T', 6.75, '2023-10-01', '2023-10-31', 2, 6, '2023-10-16');


-- INSERT DATA SPECIAL_OFFER_COUPONS
INSERT INTO booking.special_offer_coupons (soco_borde_id, soco_spof_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- INSERT DATA BOOKING_ORDER_DETAIL_EXTRA
INSERT INTO booking.booking_order_detail_extra (boex_id, boex_price, boex_qty, boex_subtotal, boex_measure_unit, boex_borde_id, boex_prit_id)
VALUES
    (1, 10.00, 2, 20.00, 'People', 1, 1),
    (2, 5.00, 1, 5.00, 'Unit', 2, 2),
    (3, 8.50, 2, 17.00, 'Kg', 3, 3),
    (4, 15.00, 1, 15.00, 'People', 4, 4),
    (5, 12.75, 2, 25.50, 'Unit', 5, 5),
    (6, 9.99, 1, 9.99, 'Kg', 6, 6),
    (7, 7.25, 2, 14.50, 'People', 7, 7),
    (8, 20.50, 1, 20.50, 'Unit', 8, 8),
    (9, 11.00, 2, 22.00, 'Kg', 9, 9),
    (10, 6.75, 1, 6.75, 'people', 10, 10);


-- INSERT DATA USER_BREAKFEAST
INSERT INTO booking.user_breakfeast (usbr_borde_id, usbr_modified_date, usbr_total_vacant)
VALUES
    (1, '2023-01-15', 3),
    (2, '2023-02-10', 2),
    (3, '2023-03-20', 1),
    (4, '2023-04-12', 4),
    (5, '2023-05-25', 2),
    (6, '2023-06-05', 1),
    (7, '2023-07-18', 3),
    (8, '2023-08-08', 2),
    (9, '2023-09-22', 1),
    (10, '2023-10-16', 4);
