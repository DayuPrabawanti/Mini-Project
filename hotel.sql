create table hotel.category_group(
    cagro_id integer primary key
)

create table hotel.address(
    addr_id serial primary key
)

create table hotel.users(
    user_id integer primary key
)

create table hotel.facility_photos(
    fapho_id serial primary key,
    fapho_faci_id integer,
    fapho_thumbnail_filename varchar(50),
    fapho_photo_filename varchar(50),
    fapho_primary bit,
    fapho_url varchar(255),
    fapho_modified_date timestamp
)

create table hotel.facilites(
    faci_id serial primary key,
    faci_name varchar(125),
    faci_description varchar(255),
    faci_max_number integer,
    faci_measure_unit varchar(15),
    faci_room_number varchar(6),
    faci_startdate timestamp,
    faci_enddate timestamp,
    faci_low_price money,
    faci_high_price money,
    faci_rate_price money,
    faci_discount money,
    faci_tax_rate money,
    faci_modified_date timestamp,
    faci_cagro_id integer,
    faci_hotel_id integer,
    foreign key (faci_cagro_id) references category_group(cagro_id),
    foreign key (faci_hotel_id) references hotels(hotel_id)
)

create table hotel.facility_price_history(
    faph_id serial primary key,
    faph_faci_id integer,
    faph_startdate timestamp,
    faph_enddate timestamp,
    faph_low_price money,
    faph_high_price money,
    faph_discount money,
    faph_tax_rate money,
    faph_modified_date timestamp,
    faph_user_id integer,
    foreign key (faph_user_id) references users(user_id)
)

create table hotel.hotels(
    hotel_id serial primary key,
    hotel_name varchar(85),
    hotel_description varchar(500),
    hotel_rating_star smallint,
    hotel_phonenumber varchar(25),
    hotel_modified_date timestamp,
    hotel_add_id integer,
    foreign key (hotel_add_id) references address(addr_id)
)

create table hotel.hotel_reviews(
    hore_id serial primary key,
    hore_user_review varchar(125),
    hore_rating bit,
    hore_creted_on timestamp,
    hore_user_id integer,
    hore_hotel_id integer,
    foreign key (hore_user_id) references users(user_id),
    foreign key (hore_hotel_id) references hotels(hotel_id)
)



--insert into--



insert into hotel.facility_photos(fapho_id,fapho_faci_id,fapho_thumbnail_filename,
fapho_photo_filename,fapho_primary,fapho_url,fapho_modified_date) VALUES
(1, 1, 'kolam_renang_thumbnail.jpg', 'kolam_renang_photo1.jpg', true, 'https://example.com/kolam_renang/photo1.jpg', '2022-05-01 10:30:00'),
(2, 1, 'kolam_renang_thumbnail.jpg', 'kolam_renang_photo2.jpg', false, 'https://example.com/kolam_renang/photo2.jpg', '2022-05-02 14:15:00'),
(3, 2, 'restoran_thumbnail.jpg', 'restoran_photo1.jpg', true, 'https://example.com/restoran/photo1.jpg', '2022-05-03 16:45:00'),
(4, 2, 'restoran_thumbnail.jpg', 'restoran_photo2.jpg', false, 'https://example.com/restoran/photo2.jpg', '2022-05-04 11:20:00'),
(5, 3, 'spa_thumbnail.jpg', 'spa_photo1.jpg', true, 'https://example.com/spa/photo1.jpg', '2022-05-05 13:50:00'),
(6, 3, 'spa_thumbnail.jpg', 'spa_photo2.jpg', false, 'https://example.com/spa/photo2.jpg', '2022-05-06 17:30:00'),
(7, 4, 'lapangan_tenis_thumbnail.jpg', 'lapangan_tenis_photo1.jpg', true, 'https://example.com/lapangan_tenis/photo1.jpg', '2022-05-07 09:10:00'),
(8, 4, 'lapangan_tenis_thumbnail.jpg', 'lapangan_tenis_photo2.jpg', false, 'https://example.com/lapangan_tenis/photo2.jpg', '2022-05-08 12:45:00'),
(9, 5, 'kolam_renang_thumbnail.jpg', 'kolam_renang_photo3.jpg', true, 'https://example.com/kolam_renang/photo3.jpg', '2022-05-09 15:20:00'),
(10, 5, 'kolam_renang_thumbnail.jpg', 'kolam_renang_photo4.jpg', false, 'https://example.com/kolam_renang/photo4.jpg', '2022-05-10 18:00:00');

insert into hotel.hotels(hotel_id,hotel_name,hotel_description,hotel_rating_star,
hotel_phonenumber,hotel_modified_date,hotel_add_id) VALUES
('1', 'Hotel Lombok', 'Hotel Lombok adalah hotel terbaik di Lombok', '5', '0812-1234-5688','2023-01-01', '2'),
('2', 'Hotel Bandung', 'Hotel Bandung adalah hotel terbaik di Bandung', '4', '0812-1234-5678','2023-02-02', '2'),
('3', 'Hotel Palembang', 'Hotel Palembang adalah hotel terbaik di Palembang', '3', '0812-1234-5668','2023-03-03', '2'),
('4', 'Hotel Ntt', 'Hotel Ntt adalah hotel terbaik di Ntt', '3', '0812-1234-5658','2023-04-04', '2'),
('5', 'Hotel Bogor', 'Hotel Bogor adalah hotel terbaik di bogor', '4', '0812-1234-5678','2023-05-05', '2'),
('6', 'Hotel Cileungsi', 'Hotel Cileungsi adalah hotel terbaik di Cileungsi', '2', '0812-1234-5698','2023-06-06', '2'),
('7', 'Hotel Purbalingga', 'Hotel Purbalingga adalah hotel terbaik di Purbalingga', '3', '0812-1234-5610','2023-07-07', '2'),
('8', 'Hotel Medan', 'Hotel Medan adalah hotel terbaik di Medan', '4', '0812-1234-5611','2023-08-08', '2'),
('9', 'Hotel Sumatera', 'Hotel Sumatera adalah hotel terbaik di Sumatera', '5', '0812-1234-5612','2023-09-09', '2'),
('10', 'Hotel Jambi', 'Hotel Jambi adalah hotel terbaik di Jambi', '5', '0812-1234-5613','2023-10-10', '2');

insert into hotel.facilites(faci_id,faci_name,faci_description,faci_max_number,faci_measure_unit,faci_room_number,
faci_startdate,faci_enddate,faci_low_price,faci_high_price,faci_rate_price,faci_discount,faci_tax_rate,
faci_modified_date,faci_cagro_id,faci_hotel_id) VALUES
(1, 'Kolam Renang', 'Kolam renang outdoor', 50, 'meter persegi', 'A101', '2022-01-01 09:00:00', 
 '2022-12-31 18:00:00', 100000, 150000, 120000, 0, 10, '2022-05-01 10:30:00', 1, 1),
(2, 'Restoran', 'Restoran hotel', 80, 'orang', 'B201', '2022-01-01 07:00:00', '2022-12-31 22:00:00', 
 0, 0, 0, 0, 10, '2022-05-02 14:15:00', 1, 1),
(3, 'Spa', 'Pusat kebugaran dan spa', 10, 'ruang', 'C301', '2022-01-01 10:00:00', '2022-12-31 20:00:00', 
 200000, 300000, 250000, 0, 10, '2022-05-03 16:45:00', 1, 1),
(4, 'Lapangan Tenis', 'Lapangan tenis terbuka', 4, 'lapangan', 'D401', '2022-01-01 08:00:00', 
 '2022-12-31 17:00:00', 80000, 100000, 90000, 0, 10, '2022-05-04 11:20:00', 1, 1),
(5, 'Kolam Renang', 'Kolam renang indoor', 30, 'meter persegi', 'A102', '2022-01-01 10:00:00', 
 '2022-12-31 19:00:00', 80000, 120000, 100000, 0, 10, '2022-05-05 13:50:00', 2, 1),
(6, 'Restoran', 'Restoran restoran', 100, 'orang', 'B202', '2022-01-01 07:00:00', '2022-12-31 22:00:00', 
 0, 0, 0, 0, 10, '2022-05-06 17:30:00', 2, 1),
(7, 'Spa', 'Pusat kebugaran dan spa', 8, 'ruang', 'C302', '2022-01-01 09:00:00', '2022-12-31 21:00:00', 
 250000, 350000, 300000, 0, 10, '2022-05-07 09:10:00', 2, 1),
(8, 'Kolam Renang', 'Kolam renang outdoor', 40, 'meter persegi', 'A103', '2022-01-01 08:00:00', 
 '2022-12-31 18:00:00', 120000, 180000, 150000, 0, 10, '2022-05-08 12:45:00', 3, 2),
(9, 'Restoran', 'Restoran hotel', 60, 'orang', 'B203', '2022-01-01 07:00:00', '2022-12-31 22:00:00', 
 0, 0, 0, 0, 10, '2022-05-09 15:20:00', 3, 2),
(10, 'Kolam Renang', 'Kolam renang indoor', 25, 'meter persegi', 'A104', '2022-01-01 09:00:00', 
 '2022-12-31 19:00:00', 100000, 150000, 120000, 0, 10, '2022-05-10 18:00:00', 4, 2);


 insert into hotel.facility_price_history(faph_id,faph_faci_id,faph_startdate,faph_enddate,faph_low_price,
 faph_high_price,faph_discount,faph_tax_rate,faph_modified_date,faph_user_id) VALUES
 ('1', '1', '2022-01-01', '2022-02-01', '100000', '1000000', '100000', '200000', '2022-01-01', '2'),
 ('2', '1', '2022-01-02', '2022-02-02', '200000', '900000', '100000', '200000', '2022-01-01', '2'),
 ('3', '1', '2022-01-03', '2022-02-03', '300000', '800000', '100000', '200000', '2022-01-01', '2'),
 ('4', '1', '2022-01-04', '2022-02-04', '400000', '700000', '100000', '200000', '2022-01-01', '2'),
 ('5', '1', '2022-01-05', '2022-02-05', '500000', '600000', '100000', '200000', '2022-01-01', '2'),
 ('6', '1', '2022-01-06', '2022-02-06', '600000', '500000', '100000', '200000', '2022-01-01', '2'),
 ('7', '1', '2022-01-07', '2022-02-07', '700000', '400000', '100000', '200000', '2022-01-01', '2'),
 ('8', '1', '2022-01-08', '2022-02-08', '800000', '300000', '100000', '200000', '2022-01-01', '2'),
 ('9', '1', '2022-01-09', '2022-02-09', '900000', '200000', '100000', '200000', '2022-01-01', '2'),
 ('10', '1', '2022-01-10', '2022-21-10', '1000000', '100000', '100000', '200000', '2022-01-01', '2');

 insert into hotel.hotel_reviews(hore_id,hore_user_review,hore_rating,hore_creted_on,hore_user_id,hore_hotel_id) VALUES
('1', 'Hotel Lombok adalah hotel terbaik di Lombok', '5', '2023-01-01', '2', '1'),
('2', 'Hotel Bandung adalah hotel terbaik di Bandung', '5', '2023-02-02', '2', '2'),
('3', 'Hotel Palembang, Hotel Palembang adalah hotel terbaik di Palembang', '5', '2023-03-03', '2', '3'),
('4', 'Hotel Ntt adalah hotel terbaik di Ntt', '5', '2023-04-04', '2', '4'),
('5', 'Hotel Bogor adalah hotel terbaik di bogor', '5', '2023-05-05', '2', '5'),
('6', 'Hotel Cileungsi adalah hotel terbaik di Cileungsi', '5', '2023-06-06', '2', '6'),
('7', 'Hotel Purbalingga adalah hotel terbaik di Purbalingga', '5', '2023-07-07', '2', '7'),
('8', 'Hotel Medan adalah hotel terbaik di Medan', '5', '2023-08-08', '2', '8'),
('9', 'Hotel Sumatera adalah hotel terbaik di Sumatera', '5', '2023-09-09', '2', '9'),
('10', 'Hotel Jambi adalah hotel terbaik di Jambi', '5', '2023-10-10', '2', '10');