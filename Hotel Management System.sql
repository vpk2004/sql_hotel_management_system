create database HMS;
use hms;
create table guest(
guest_id int primary key auto_increment,
first_name varchar(100),
last_name varchar(100),
phone_number varchar(100),
email varchar(100),
address varchar(100)
);
alter table guest modify email varchar(100) not null;
insert into guest(first_name, last_name, phone_number, email, address) 
values
('Manoj', 'Kumar', '123-456-7890', 'john.doe@example.com', '123 Main St, Cityville'),
('Rithu', 'priya', '234-567-8901', 'jane.smith@example.com', '456 Elm St, Townsville'),
('Verti', 'Johnson', '345-678-9012', 'michael.johnson@example.com', '789 Oak St, Villageton'),
('Ganeesh', 'Davis', '456-789-0123', 'emily.davis@example.com', '321 Pine St, Hamletburg'),
('Chris', 'Brown', '567-890-1234', 'chris.brown@example.com', '654 Maple St, Cityplace'),
('Jessica', 'Taylor', '678-901-2345', 'jessica.taylor@example.com', '987 Cedar St, Smalltown'),
('David', 'Miller', '789-012-3456', 'david.miller@example.com', '159 Birch St, Boroughton'),
('James', 'Wilson', '890-123-4567', 'sarah.wilson@example.com', '951 Spruce St, Suburbville'),
('Kaithi', 'Moore', '901-234-5678', 'james.moore@example.com', '753 Fir St, Countrytown'),
('Laura', 'Anderson', '012-345-6789', 'laura.anderson@example.com', '357 Redwood St, Uptown'),
('Daniel', 'Thomas', '123-456-7891', 'daniel.thomas@example.com', '159 Sequoia St, Metropolis'),
('Oveile', 'Martin', '234-567-8902', 'olivia.martin@example.com', '951 Willow St, Hometown');
select*from guest;
--------------------------------------------------------------
create table rooms(
room_id int primary key auto_increment,
room_number varchar(100),
room_type varchar(100),
price_per_night decimal(10,2),
is_available boolean
);
 insert into rooms values(01,101,'Single',200.00,False);
 insert into rooms(room_number,room_type,price_per_night,is_available) values
('102', 'Single', 100.00, TRUE),
('103', 'Double', 150.00, TRUE),
('104', 'Suite', 300.00, FALSE),
('105', 'Single', 100.00, TRUE),
('106', 'Double', 150.00, FALSE),
('107', 'Suite', 300.00, TRUE),
('108', 'Single', 100.00, TRUE),
('109', 'Double', 150.00, TRUE),
('110', 'Suite', 300.00, FALSE),
('111', 'Single', 100.00, TRUE),
('112', 'Double', 150.00, TRUE),
('113', 'Suite', 300.00, TRUE),
('114', 'Single', 100.00, FALSE),
('115', 'Double', 150.00, TRUE),
('116', 'Suite', 300.00, FALSE);
select*from rooms;
------------------------------------------------------------
 create table book(
 booking_id int primary key auto_increment,
 guest_id int,
 room_id int,
 check_in_date date,
 check_in_out date,
 total_price decimal(10,2),
 booking_status varchar(100)
 );
 insert into book values(201,1,01,'2024-04-23','2024-05-24',230,'Reserved');
select*from book;
insert into book (guest_id,room_id,check_in_date,check_in_out,total_price,booking_status) values 
(2, 02, '2024-01-15', '2024-01-17', 250.00, 'Checked-in'),
(3, 03, '2024-01-20', '2024-01-23', 450.00, 'Checked-out'),
(4, 04, '2024-02-05', '2024-02-07', 180.00, 'Canceled'),
(5, 05, '2024-02-10', '2024-02-12', 220.00, 'Reserved'),
(6, 06, '2024-02-15', '2024-02-18', 500.00, 'Checked-in'),
(7, 07, '2024-03-01', '2024-03-05', 600.00, 'Checked-out'),
(8, 08, '2024-03-10', '2024-03-13', 340.00, 'Reserved'),
(9, 09, '2024-03-15', '2024-03-18', 400.00, 'Checked-in'),
(10,10, '2024-03-20', '2024-03-25', 700.00, 'Checked-out'),
(11, 11, '2024-04-01','2024-04-03', 150.00, 'Canceled'),
(12, 12,'2024-04-05', '2024-04-07', 230.00, 'Reserved'),
(13, 13,'2024-04-10', '2024-04-12', 280.00, 'Checked-in'),
(14, 14, '2024-04-15', '2024-04-18', 460.00, 'Checked-out'),
(15, 15,'2024-04-20','2024-04-22', 190.00, 'Reserved'
);
select*from book;
select*from guest;
alter table book add constraint fk_personguest foreign key(guest_id) references guest(guest_id);
alter table book add constraint fk_pesronroom foreign key(room_id) references rooms(room_id);
set foreign_key_checks=0;
desc guest;
desc book;
------------------------------------------------------------------
create table payment(
payment_id int primary key auto_increment,
booking_id int,
payment_date date,
amount_paid decimal(10,2),
payment_method varchar(100),
payment_status varchar(100)
);
select*from payment;
select*from book;
insert into payment values(301,201,'2024-07-12',450.00,'debit card','paid');
insert into Payment(payment_id, booking_id, payment_date, amount_paid, payment_method, payment_status)values
(302,202,'2024-01-15', 250.00, 'Credit Card', 'Paid'),
(303,203,'2024-01-20', 450.00, 'Online', 'Paid'),
(304,204,'2024-02-05', 180.00, 'Cash', 'Pending'),
(305,205,'2024-02-10', 220.00, 'Credit Card', 'Paid'),
(306,206,'2024-02-15', 500.00, 'Online', 'Paid'),
(307,207,'2024-03-01', 600.00, 'Cash', 'Paid'),
(308,208,'2024-03-10', 340.00, 'Credit Card', 'Paid'),
(309,209,'2024-03-15', 400.00, 'Online', 'Paid'),
(310,210,'2024-03-20', 700.00, 'Cash', 'Paid'),
(311,211,'2024-04-01', 150.00, 'Credit Card', 'Pending'),
(312,212,'2024-04-05', 230.00, 'Online', 'Paid'),
(313,213,'2024-04-10', 280.00, 'Credit Card', 'Paid'),
(314,214,'2024-04-15', 460.00, 'Cash', 'Paid'),
(315,215,'2024-04-20', 190.00, 'Online', 'Paid'),
(316,216,'2024-04-25', 210.00, 'Credit Card', 'Paid'),
(317,217,'2024-01-17', 50.00, 'Cash', 'Paid'), 
(318,218,'2024-03-18', 100.00, 'Credit Card', 'Pending');
select*from payment;
select*from book;
alter table payment add constraint fk_personpay foreign key(booking_id) references book(booking_id);
desc payment;
---------------------------------------------------------------------------
create table staff(
staff_id int primary key auto_increment,
first_name varchar(100),
last_name varchar(100),
roles varchar(100),
phone_number varchar(100),
email varchar(100)
);
insert into staff values(401,'maha','laksh','manager','9876543210','maha@34gmail.com');
INSERT INTO Staff (staff_id, first_name, last_name, roles, phone_number, email)
VALUES
(402,'Lily', 'Adams', 'Manager', '123-456-7890', 'lily.adams@example.com'),
(403,'Noah', 'Davis', 'Receptionist', '123-555-7890', 'noah.davis@example.com'),
(404,'Charlotte', 'King', 'Housekeeping', '123-456-1111', 'charlotte.king@example.com'),
(405,'Henry', 'Walker', 'Receptionist', '123-555-2222', 'henry.walker@example.com'),
(406,'Amelia', 'Scott', 'Manager', '123-456-3333', 'amelia.scott@example.com'),
(407,'Benjamin', 'Wright', 'Housekeeping', '123-555-4444', 'benjamin.wright@example.com'),
(408,'Ella', 'Hill', 'Receptionist', '123-456-5555', 'ella.hill@example.com'),
(409,'Mason', 'Green', 'Manager', '123-555-6666', 'mason.green@example.com'),
(410,'Harper', 'Adams', 'Housekeeping', '123-456-7777', 'harper.adams@example.com'),
(411,'William', 'Nelson', 'Receptionist', '123-555-8888', 'william.nelson@example.com'),
(412,'Grace', 'Carter', 'Manager', '123-456-9999', 'grace.carter@example.com'),
(413,'Jackson', 'Mitchell', 'Housekeeping', '123-555-0000', 'jackson.mitchell@example.com'),
(414,'Sophia', 'Parker', 'Receptionist', '123-456-1234', 'sophia.parker@example.com'),
(415,'Logan', 'Edwards', 'Manager', '123-555-5678', 'logan.edwards@example.com'),
(416,'Zoe', 'Phillips', 'Housekeeping', '123-456-9012', 'zoe.phillips@example.com'),
(417,'Levi', 'Turner', 'Receptionist', '123-555-3456', 'levi.turner@example.com');
select*from staff;
----------------------------------------------------------------------------------------
create table service(service_id int primary key auto_increment,
service_name varchar(100),
service_desc varchar(100),
service_cost decimal(10,2));
INSERT INTO Service(service_id, service_name, service_desc, service_cost)
VALUES
(1, 'Spa', 'Full-body massage and spa treatments for relaxation and rejuvenation.', 150.00),
(2, 'Room Service', '24/7 room service offering meals, drinks, and snacks delivered to your room.', 30.00),
(3, 'Gym', 'Access to a fully equipped gym with cardio machines, weights, and personal trainers.', 20.00),
(4, 'Laundry', 'Laundry service including washing, drying, and ironing of clothes.', 25.00),
(5, 'Airport Shuttle', 'Transportation to and from the airport for guests.', 50.00),
(6, 'Wi-Fi', 'High-speed wireless internet access throughout the hotel.', 10.00),
(7, 'Parking', 'Secure parking space for guest vehicles.', 15.00),
(8, 'Breakfast', 'Complimentary breakfast including a variety of dishes.', 20.00),
(9, 'Conference Room', 'Rental of fully equipped conference rooms for meetings and events.', 100.00),
(10, 'Swimming Pool', 'Access to the hotel’s outdoor swimming pool and poolside services.', 35.00),
(11, 'Mini Bar', 'In-room mini bar with a selection of drinks and snacks.', 50.00),
(12, 'Car Rental', 'Rental cars available for guest transportation during their stay.', 80.00),
(13, 'Tours', 'Guided city and adventure tours available for guests.', 120.00),
(14, 'Pet Care', 'Pet care services including walking, feeding, and grooming.', 60.00),
(15, 'Valet Parking', 'Valet parking service for guests, ensuring convenience and security.', 25.00);
select*from service;
-----------------------------------------------------------------------------------------------------------
create table sp(
usage_id int primary key auto_increment,
booking_id int,
service_id int,
usage_date date,
quantity int,
total_service_cost decimal(10,2));
INSERT INTO sp (usage_id, booking_id, service_id, usage_date, quantity, total_service_cost)
VALUES
(111, 202, 1, '2024-01-16', 1, 150.00), 
(112, 203, 2, '2024-01-21', 2, 60.00), 
(113, 204, 3, '2024-02-06', 1, 20.00), 
(114, 205, 4, '2024-02-11', 3, 75.00), 
(115, 206, 5, '2024-02-16', 1, 50.00), 
(116, 207, 6, '2024-03-02', 2, 20.00), 
(117, 208, 7, '2024-03-11', 1, 15.00),
(118, 209, 8, '2024-03-16', 1, 20.00), 
(119, 210, 9, '2024-03-21', 1, 100.00), 
(110, 211, 10, '2024-04-02', 1, 35.00), 
(211, 212, 11, '2024-04-06', 2, 100.00),
(212, 213, 12, '2024-04-11', 1, 80.00), 
(213, 214, 13, '2024-04-16', 1, 120.00), 
(214, 215, 14, '2024-04-21', 1, 60.00), 
(215, 216, 15, '2024-04-26', 1, 25.00); 
select*from sp;
desc sp;
alter table sp add constraint fk_personsp foreign key(booking_id) references book(booking_id);
alter table sp add constraint fk_personsp1 foreign key(service_id) references service(service_id);