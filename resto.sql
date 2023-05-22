create table resto.facilities(
	faci_id serial primary key
)
create table resto.users(
	user_id serial primary key
)
create table resto.resto_menus(
	reme_faci_id integer,
	reme_id serial unique,
	reme_name varchar(55),
	reme_description varchar(255),
	reme_price money,
	reme_status varchar(15),
	reme_modified_date timestamp,
	foreign key (reme_faci_id) references facilities (faci_id),
	constraint faci_pk primary key (reme_faci_id,reme_id)
)
create table resto.order_menus(
	orme_id serial primary key,
	orme_order_number varchar(20),
	orme_order_date timestamp,
	orme_total_item smallint,
	orme_total_discount money,
	orme_total_amount money,
	orme_pay_type varchar(2),
	orme_cardnumber varchar(25),
	orme_is_paid varchar(2),
	orme_modified_date timestamp,
	orme_user_id integer,
	foreign key (orme_user_id) references users(user_id)
	
)
create table resto.order_menu_detail (
	omde_id serial primary key,
	orme_price money,
	orme_qty money,
	orme_subtotal money,
	orme_discount money,
	omde_orme_id integer,
	omde_reme_id integer,
	foreign key (omde_orme_id) references order_menus (orme_id),
	foreign key (omde_reme_id) references resto_menus (reme_id)
)
create table resto.resto_menu_photos(
	remp_id serial primary key,
	remp_tumbnail_filename varchar (50),
	remp_photo_filename varchar(50),
	remp_primary boolean,
	remp_url varchar,
	remp_reme_id integer,
	foreign key (remp_reme_id) references resto_menus(reme_id)
)


--insert data--

insert into resto.resto_menus(reme_faci_id,reme_id,reme_name,reme_description,reme_price,reme_status,reme_modified_date)
values
(2, 1, 'Nasi Goreng', 'Nasi goreng spesial dengan ayam, sayuran, dan telur', 45000, 'Available', '2023-05-22 10:30:00'),
(6, 2, 'Sate Ayam', 'Sate ayam dengan bumbu kacang dan lontong', 25000, 'Available', '2023-05-22 11:15:00'),
(1, 3, 'Mie Ayam', 'Mie ayam dengan pangsit, bakso, dan kuah kaldu', 35000, 'Available', '2023-05-22 09:45:00'),
(7, 4, 'Soto Betawi', 'Soto Betawi dengan daging sapi, santan, dan kerupuk', 40000, 'Available', '2023-05-22 12:00:00'),
(1, 5, 'Bakso Malang', 'Bakso Malang dengan mie, pangsit, dan kuah kaldu', 30000, 'Available', '2023-05-22 11:30:00'),
(3, 6, 'Nasi Uduk', 'Nasi uduk dengan ayam goreng, tempe, dan sambal', 50000, 'Available', '2023-05-22 10:00:00'),
(2, 7, 'Ayam Goreng', 'Ayam goreng dengan nasi, sambal, dan lalapan', 40000, 'Available', '2023-05-22 13:15:00'),
(4, 8, 'Gado-gado', 'Gado-gado dengan sayuran segar dan bumbu kacang', 35000, 'Available', '2023-05-22 12:30:00'),
(9, 9, 'Pecel Lele', 'Pecel lele dengan nasi, sambal, dan lalapan', 30000, 'Available', '2023-05-22 14:00:00'),
(5, 10, 'Capcay', 'Capcay dengan sayuran, daging ayam, dan saus tiram', 45000, 'Available', '2023-05-22 13:30:00')


insert into resto.order_menus(orme_id,orme_order_number,orme_order_date,orme_total_item,orme_total_discount,orme_total_amount,orme_pay_type,orme_cardnumber,orme_is_paid,orme_modified_date,orme_user_id) 
values
(1, 'MENUS#20221127-0001', '2023-05-22 10:30:00', 3, 5000, 95000, 'D', '1234567890123456', 'P', '2023-05-22 10:30:00', 1),
(2, 'MENUS#20221127-0002', '2023-05-22 11:15:00', 2, 0, 50000, 'C', NULL, 'P', '2023-05-22 11:15:00', 5),
(3, 'MENUS#20221127-0003', '2023-05-22 09:45:00', 4, 10000, 140000, 'CR', '9876543210987654', 'P', '2023-05-22 09:45:00', 9),
(4, 'MENUS#20221127-0004', '2023-05-22 12:00:00', 1, 0, 40000, 'CR', '4567890123456789', 'P', '2023-05-22 12:00:00', 4),
(5, 'MENUS#20221127-0005', '2023-05-22 11:30:00', 2, 0, 60000, 'D', NULL, 'P', '2023-05-22 11:30:00', 6),
(6, 'MENUS#20221127-0006', '2023-05-22 10:00:00', 3, 0, 75000, 'D', NULL, 'P', '2023-05-22 10:00:00', 7),
(7, 'MENUS#20221127-0007', '2023-05-22 13:15:00', 1, 0, 40000, 'CR', '7890123456789012', 'P', '2023-05-22 13:15:00', 10),
(8, 'MENUS#20221127-0008', '2023-05-22 12:30:00', 2, 8000, 42000, 'C', NULL, 'P', '2023-05-22 12:30:00', 3),
(9, 'MENUS#20221127-0009', '2023-05-22 14:00:00', 1, 0, 30000, 'D', '9012345678901234', 'P', '2023-05-22 14:00:00', 2),
(10, 'MENUS#20221127-0010', '2023-05-22 13:30:00', 4, 15000, 135000, 'BO', NULL, 'P', '2023-05-22 13:30:00', 8)

insert into resto.order_menu_detail(omde_id,orme_price,orme_qty,orme_subtotal,orme_discount,omde_orme_id,omde_reme_id)
values
(1, 45000, 2, 90000, 0, 1, 1),
(3, 35000, 1, 35000, 0, 2, 3),
(4, 40000, 2, 80000, 0, 2, 4),
(5, 30000, 4, 120000, 0, 3, 5),
(6, 50000, 1, 50000, 0, 3, 6),
(7, 40000, 2, 80000, 0, 4, 7),
(8, 35000, 1, 35000, 0, 4, 8),
(9, 30000, 3, 90000, 0, 5, 9),
(10, 45000, 2, 90000, 0, 5, 10)


insert into resto.resto_menu_photos(remp_id,remp_tumbnail_filename,remp_photo_filename,remp_primary,remp_url,remp_reme_id)
values
(1, 'nasi_goreng_thumbnail.jpg', 'nasi_goreng_photo.jpg', 1, 'https://example.com/photos/nasi_goreng', 1)
(2, 'sate_ayam_thumbnail.jpg', 'sate_ayam_photo.jpg', 1, 'https://example.com/photos/sate_ayam', 2)
(3, 'mie_ayam_thumbnail.jpg', 'mie_ayam_photo.jpg', 1, 'https://example.com/photos/mie_ayam', 3)
(4, 'soto_betawi_thumbnail.jpg', 'soto_betawi_photo.jpg', 1, 'https://example.com/photos/soto_betawi', 4)
(5, 'bakso_malang_thumbnail.jpg', 'bakso_malang_photo.jpg', 1, 'https://example.com/photos/bakso_malang', 5)
(6, 'nasi_uduk_thumbnail.jpg', 'nasi_uduk_photo.jpg', 1, 'https://example.com/photos/nasi_uduk', 6)
(7, 'ayam_goreng_thumbnail.jpg', 'ayam_goreng_photo.jpg', 1, 'https://example.com/photos/ayam_goreng', 7)
(8, 'gado_gado_thumbnail.jpg', 'gado_gado_photo.jpg', 1, 'https://example.com/photos/gado_gado', 8)
(9, 'pecel_lele_thumbnail.jpg', 'pecel_lele_photo.jpg', 1, 'https://example.com/photos/pecel_lele', 9)
(10, 'capcay_thumbnail.jpg', 'capcay_photo.jpg', 1, 'https://example.com/photos/capcay', 10)
