create table users.ROLES (
	role_id SERIAL PRIMARY KEY,
	role_name varchar(35),
	
);

create table users.MEMBERS (
	memb_name varchar (15),

);

create table users.USER_MEMBERS (
	usme_user_id SERIAL PRIMARY KEY,
	usme_memb_name varchar(15),
	usme_promote_date TIMESTAMP,
	usme_points SMALLINT,
	usme_type varchar (15),
	
);

create table users.USERS (
	user_id SERIAL PRIMARY KEY,
	user_full_name varchar(55),
	user_type varchar(15),
	user_company_name varchar(255),
	user_email varchar(255),
	user_phone_number varchar(25),
	user_modified_date TIMESTAMP,

	
);


create table users.user_roles (
	usro_user_id INTEGER,
	usro_role_id INTEGER,
	FOREIGN KEY (usro_user_id) REFERENCES USERS (user_id),
	FOREIGN KEY (usro_role_id) REFERENCES ROLES (role_id),
	CONSTRAINT ra_usro PRIMARY KEY (usro_user_id, usro_role_id)
	
);

create table users.USER_BONUS_POINTS (
	ubpo_total_points SMALLINT,
	ubpo_bonus_type char (1),	
	ubpo_created_on TIMESTAMP,
	ubpo_id SERIAL,
	FOREIGN KEY (ubpo_user_id) REFERENCES USERS (user_id),
	CONSTRAINT ra_bp PRIMARY KEY (ubpo_id, ubpo_user_id)
	
);

create table users.USER_PASSWORD (
	uspa_user_id SERIAL PRIMARY KEY,
	uspa_passwordHash varchar(128),
	uspa_passwordSalt varchar(10),
	FOREIGN KEY (uspa_user_id) REFERENCES USERS(user_id)
	
);

create table users.USER_PROFILES (
	uspro_id SERIAL PRIMARY KEY,
	uspro_national_id varchar(20),
	uspro_birt_date DATE,
	uspro_job_title varchar(50),
	uspro_marital_status char(1),
	uspro_gender char(1),
	uspro_addr_id INTEGER,
	uspro_user_id INTEGER,
	FOREIGN KEY (uspro_addr_id) REFERENCES address(addr_id),
	FOREIGN KEY (uspro_user_id) REFERENCES users(user_id),
	
);

create table users.ADDRESS (
	addr_id SERIAL PRIMARY KEY,
)


--insert data--



insert into users.USERS (user_id, user_full_name, user_type, user_company_name, user_phone_number, user_email, user_modified_date)
VALUES
('1','John Smith','T','Acme Corporation','+1 555-123-4567','john.smith@example.com','2023-05-01')
('2','Emily Johnson','T','Global Industries','+44-20-1234-5678','emily.johnson@example.com','2023-04-15')
('3','Michael Brown','T','Stellar Enterprises','+61-2-9876-5432','michael.brown@example.com','2023-03-28')
('4','Sophia Davis','C','Alpha Solutions','+33-1-2345-6789','sophia.davis@example.com','2023-02-10')
('5','William Wilson','C','Horizon Group','+81-3-4567-8901','william.wilson@example.com','2023-01-05')
('6','Olivia Thompson','C','Summit Enterprises','+49-30-12345678','olivia.thompson@example.com','2022-12-20')
('7','Benjamin Martinez','I','Nexus Technologies','+55-11-98765-4321','benjamin.martinez@example.com','2022-11-11')
('8','Ava Anderson','I','Vanguard Inc','+39-02-8765-4321','ava.anderson@example.com','2022-10-03')
('9','Daniel Taylor','I','Fusion Innovations','+91-22-3456-7890','daniel.taylor@example.com','2022-09-18')
('10','Isabella Moore','I','BrightStar Enterprises','+65-1234-5678','isabella.moore@example.com','2022-08-07')

insert into users.ROLES (role_id, role_name) 
VALUES
('1','GUEST'),
('2','MANAGER'),
('3','Office Boy'),
('4','Admin'),
('5','User')

insert into users.USER_ROLES (usro_user_id, usro_role_id)
VALUES
('1','1')
('2','2')
('3','3')
('4','4')
('5','5')
('6','1')
('7','2')
('8','3')
('9','4')
('10','5')

insert into users.USER_BONUS_POINTS (ubpo_id, ubpo_user_id, ubpo_total_points, ubpo_bonus_type, upbo_created_on)
VALUES
('1','10','100','P','2023-04-01')
('2','9','250','R','2023-03-15')
('3','8','500','P','2023-02-28')
('4','7','750','R','2023-01-10')
('5','6','1000','P','2023-01-01')
('6','5','1250','R','2022-11-20')
('7','4','1500','P','2022-10-11')
('8','3','1750','R','2022-09-03')
('9','2','2000','P','2022-08-18')
('10','1','2250','R','2022-07-07')

insert into users.USER_PASSWORD (uspa_user_id, uspa_passwordHash, uspa_passwordSalt)
VALUES
('1','$2a$12$JfqCwZ9nM0gJ/ruKP7c1wOoPrpR0j/OeVnoG/dsTd/LJW.FVGAGfi','$2a$12$JfqCwZ9nM0gJ/ruKP7c1wO')
('2','$2a$12$K10t/wu57Kcv2JvFp3p1HO7sFyjPr0wL3Sdp.7RSW6kYl6llbiF36','$2a$12$K10t/wu57Kcv2JvFp3p1HO')
('3','$2a$12$Pof2sFjWKu//Y6UP0WE.Qejj1PVE9FvDbXnSQ5w8qLeSdOJGFSBxO','$2a$12$Pof2sFjWKu//Y6UP0WE.Qe')
('4','$2a$12$X6ZyA7yA8u8V.fM9lxuDTeNI0XFFv0qe3nNV.zMNoSlKsHbF4Wx7q','$2a$12$X6ZyA7yA8u8V.fM9lxuDTe')
('5','$2a$12$UbsAXV5MjZvFjMH2hAY9wObyvhkxYUHs5NGK7KKysBrTkVawhWZQa','$2a$12$UbsAXV5MjZvFjMH2hAY9wO')
('6','$2a$12$7yWl2SyEbsK4.GydzL5FSeO7F9d.schHXtKxU3WzXubg50mpg2vnq','$2a$12$7yWl2SyEbsK4.GydzL5FSe')
('7','$2a$12$Yi7DzhXYRD9xXoMgZ0WFXeM/6n.a4nF2kIw4fxt4pRzoZZawB5kPq','$2a$12$Yi7DzhXYRD9xXoMgZ0WFXe')
('8','$2a$12$YvTlsg5Fs.jF5gVtPfSoZuhIqPlZLDrYgM3OIJh3F6aP2YXnXwJUi','$2a$12$YvTlsg5Fs.jF5gVtPfSoZu')
('9','$2a$12$2y1qkeF3.fPTFoyzqQsj9.RSb8vMxHExYXEDtmayvRn9Ywsu9P3Me','$2a$12$2y1qkeF3.fPTFoyzqQsj9')
('10','$2a$12$WeyfwyV2e8A6pONaR0OPLu6zIalS/jbJd3/uqVwz7zKxclSt8Q0ca','$2a$12$WeyfwyV2e8A6pONaR0OPLu')



1. Password: "password123"
   Salt: "$2a$12$JfqCwZ9nM0gJ/ruKP7c1wO"
   Hash: "$2a$12$JfqCwZ9nM0gJ/ruKP7c1wOoPrpR0j/OeVnoG/dsTd/LJW.FVGAGfi"

2. Password: "qwerty456"
   Salt: "$2a$12$K10t/wu57Kcv2JvFp3p1HO"
   Hash: "$2a$12$K10t/wu57Kcv2JvFp3p1HO7sFyjPr0wL3Sdp.7RSW6kYl6llbiF36"

3. Password: "1234567890"
   Salt: "$2a$12$Pof2sFjWKu//Y6UP0WE.Qe"
   Hash: "$2a$12$Pof2sFjWKu//Y6UP0WE.Qejj1PVE9FvDbXnSQ5w8qLeSdOJGFSBxO"

4. Password: "P@ssw0rd!"
   Salt: "$2a$12$X6ZyA7yA8u8V.fM9lxuDTe"
   Hash: "$2a$12$X6ZyA7yA8u8V.fM9lxuDTeNI0XFFv0qe3nNV.zMNoSlKsHbF4Wx7q"

5. Password: "secret123"
   Salt: "$2a$12$UbsAXV5MjZvFjMH2hAY9wO"
   Hash: "$2a$12$UbsAXV5MjZvFjMH2hAY9wObyvhkxYUHs5NGK7KKysBrTkVawhWZQa"

6. Password: "admin1234"
   Salt: "$2a$12$7yWl2SyEbsK4.GydzL5FSe"
   Hash: "$2a$12$7yWl2SyEbsK4.GydzL5FSeO7F9d.schHXtKxU3WzXubg50mpg2vnq"

7. Password: "letmein2021"
   Salt: "$2a$12$Yi7DzhXYRD9xXoMgZ0WFXe"
   Hash: "$2a$12$Yi7DzhXYRD9xXoMgZ0WFXeM/6n.a4nF2kIw4fxt4pRzoZZawB5kPq"

8. Password: "changeme123"
   Salt: "$2a$12$YvTlsg5Fs.jF5gVtPfSoZu"
   Hash: "$2a$12$YvTlsg5Fs.jF5gVtPfSoZuhIqPlZLDrYgM3OIJh3F6aP2YXnXwJUi"

9. Password: "hello12345"
   Salt: "$2a$12$2y1qkeF3.fPTFoyzqQsj9."
   Hash: "$2a$12$2y1qkeF3.fPTFoyzqQsj9.RSb8vMxHExYXEDtmayvRn9Ywsu9P3Me"

10. Password: "testpass789"
    Salt: "$2a$12$WeyfwyV2e8A6pONaR0OPLu"
    Hash: "$2a$12$WeyfwyV2e8A6pONaR0OPLu6zIalS/jbJd3/uqVwz7zKxclSt8Q0ca"

 
insert into users.USER_PROFILES (uspro_id, uspro_national_id, uspro_birt_date, uspro_job_title, uspro_marital_status, uspro_gender, uspro_addr_id, uspro_user_id)
VALUES
('1','IDN','1990-01-10', 'Project Manager','M','F','1''1',),
('2','USA','1985-02-25', 'Financial Analyst','M','F','2','2'),
('3','CAN','1992-03-07','Software Engineer','M','F','3','3'),
('4','GBR','1988-04-18','Digital Marketing Specialist','M','F','4','4'),
('5','AUS','1995-05-03','Content Writer','M','F','5','5'),
('6','FRA','1982-06-12','Web Developer','S','M','6','6'),
('7','JPN','1997-07-29','Financial Advisor','S','M','7','7'),
('8','IND','1991-08-05', 'Legal Counsel','S','M','8','8'),
('9','GER','1986-09-21','Human Resources Coordinator','S','M','9','9'),
('10','ITA','1994-10-08 ','Project Manager','S','M','10','10')

insert into users.USER_MEMBERS (usme_user_id, usme_memb_name, usme_promote_date, usme_points, usme_type)
VALUES 
('1','yuda','2023-04-03','50','default')
('2','madon','2023-03-18','100','expired')
('3','niko','2023-03-27','250','default')
('4','jess','2023-01-12','500','expired')
('5','ramadhan','2023-01-05','700','default')
('6','dhani','2022-11-25','1100','expired')
('7','dedy','2022-10-12','1400','default')
('8','dendy','2022-09-05','1600','expired')
('9','andreas','2022-08-19','1900','default')
('10','andri','2022-07-08','2000','expired')






