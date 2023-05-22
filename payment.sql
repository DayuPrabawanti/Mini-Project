

create table payment.entity(
    entity_id serial primary key
)

create table payment.users(
    user_id serial primary key
)

create table payment.booking_orders(
    boor_order_number varchar(55)
)

create table payment.order_menus(
    orme_order_number varchar(55)
)

create table payment.payment_transaction(
    patr_id serial primary key,
    patr_trz_number, varc
)

create table payment.payment_transaction(
    patr_id serial primary key,
    patr_trx_number varchar(55) unique
    patr_debet number,
    patr_credit number,
    patr_type char(3),
    patr_note varchar(255),
    patr_modified_date timestamp,
    patr_order_number varchar(55),
    patr_source_id integer unique,
    patr_target_id integer unique,
    patr_trx_number_ref varchar(55) unique,
    patr_user_id integer,
    foreign key (patr_source_id) references payment_transaction(patr_source_id),
    foreign key (patr_target_id) references payment_transaction(patr_target_id),
    foreign key (patr_user_id) references users(user_id)

)

create table payment.bank(
    bank_entity_id integer primary key,
    bank_code varchar(10) unique,
    bank_name varchar(55) unique,
    bank modified_date timestamp,
    foreign key (bank_entity_id) references entity(entity_id)
)

create table payment.payment_gateway(
    paga_entity_id integer primary key,
    paga_code varchar(10) unique,
    paga_name varchar(55) unique,
    paga_modified_date timestamps,
    foreign key (paga_entity_id) references entity(entity_id)

)

create table user_accounts(
    usac_entity_id integer primary key,
    usac_user_id integer primary key,
    usac_account_number varchar(25) unique,
    usac_mounth smallint,
    usac_expyear smallint,
    usac_modified_date timestamp,
    foreign key (usac_entity_id) references payment.payment_gateway(paga_entity_id),
    foreign key (usac_user_id) references payment.users(user_id)
)


--insert data--

insert into payment.entity values('1'),
('2'),
('3'),
('4'),
('5'),
('6'),
('7'),
('8'),
('9'),
('10')

insert into paymenr.bank(bank_entity_id, bank_code, bank_name, bank_modified_date) values
('1','001','Mandiri','2023-02-02'),
('2','002','BNI','2021-031-02'),
('3','003','BRI','2020-02-01'),
('4','004','BCA','2021-01-10'),
('5','005','BPD','2020-02-12'),
('6','006','Danamon','2021-01-22'),
('7','007','Permata','2021-02-05'),
('8','008','Maybank','2022-02-11'),
('9','009','Bank Panin','2021-04-12'),
('10','010','OCBC','2021-03-25'),

insert into payment.payment_gateway(paga_entity_id,paga_code,paga_name,paga_modified_data) values
('1','GoTo','Gojek Tokopedia','2023-2-10'),
('2','Paylater','Shopee','2023-2-10'),
('3','Flip','Flip','2023-2-10'),
('4','Dana','Dana','2023-2-10'),
('5','Gopay','Gopay','2023-2-10'),
('6','Shope=e','Shopee','2023-2-10'),
('7','Ovo','Ovo','2023-2-10'),
('8','Link','Link AJa','2023-2-10'),
('9','BriMob','BRI Mobile','2023-2-10'),
('10','BNIMob','BNI Mobile','2023-2-10')


insert into payment.user_accounts(usac_entity_id,usac_user_id,usac_account_number, usac_saldo,usac_type,usac_expmonth,usac_expyear, usac_modified_date) values
('1','1','113-3456-78',10000000,'debet','2','2023','2023-02-12'),
('2','2','11-4567-890',1000000,'debet','3','2023','2023-02-12'),
('3','3','133-3456-36',20000000,'debet','4','2023','2023-02-12'),
('4','4','278-3874-79',2000000,'debet','5','2023','2023-02-12'),
('5','5','223-8373-39',30000000,'debet','6','2023','2023-02-12'),
('6','6','102-3873-10',3000000,'debet','7','2023','2023-02-12'),
('7','7','129-3874-22',40000000,'debet','8','2023','2023-02-12'),
('8','8','238-9474-34',4000000,'debet','9','2023','2023-02-12'),
('9','9','27-7467-56',50000000,'debet','10','2023','2023-02-12'),
('10','10','123-3654-11',5000000,'debet','11','2023','2023-11-12')


INSERT INTO payment.payment_transaction (patr_id, patr_trx_number, patr_debet, patr_credit, patr_type, patr_note, patr_modified_date, patr_order_number, patr_source_id, patr_target_id, patr_trx_number_ref, patr_user_id)
VALUES
    (1, 'TRB#20230101-0001', 1000000, 2000000, 'TP', 'TOP UP', '2023-01-06', 'BO#20230101-0001', 1, 2, NULL, 1),
    (2, 'TRB#20230102-0002', 2000000, 3000000, 'TRB', 'TRANSFER BOOKING', '2023-01-07', 'BO#20230102-0002', 2, 3, NULL, 2),
    (3, 'TRB#20230103-0003', 3000000, 4000000, 'RPY', 'REPAYMENT', '2023-01-08', 'BO#20230103-0003', 3, 4, NULL, 3),
    (4, 'TRB#20230104-0004', 4000000, 5000000, 'RF', 'REFUND', '2023-01-09', 'BO#20230104-0004', 4, 5, NULL, 4),
    (5, 'TRB#20230105-0005', 5000000, 6000000, 'ORM', 'ORDER MENU', '2023-01-10', 'BO#20230105-0005', 5, 6, NULL, 5),
    (6, 'TRB#20230106-0006', 6000000, 7000000, 'TP', 'TOP UP', '2023-01-11', 'BO#20230106-0006', 6, 7, NULL, 6),
    (7, 'TRB#20230107-0007', 7000000, 8000000, 'TRB', 'TRANSFER BOOKING', '2023-01-12', 'BO#20230107-0007', 7, 8, NULL, 7),
    (8, 'TRB#20230108-0008', 8000000, 9000000, 'RPY', 'REPAYMENT', '2023-01-13', 'BO#20230108-0008', 8, 9, NULL, 8),
    (9, 'TRB#20230109-0009', 9000000, 10000000, 'RF', 'REFUND', '2023-01-14', 'BO#20230109-0009', 8, 9, NULL, 8),
    (10, 'TRB#2023010-0010', 10000000, 11000000, 'ORM', 'ORDER MENU', '2023-01-15', 'BO#20230110-0010', 9, 10, NULL, 9);
