use hms;


#1.Retrieve all available rooms#
select*from rooms;

select*from rooms where is_available="1";

#2.List all services used by a particular guest’s booking#
select*from guest;
select*from book;
select 
concat(first_name,last_name) as Guest_Name,
guest.address,book.book_id,book.room_id 
from  
guest join book on
book.guest_id=guest.gus_id;

#3.Calculate total payment for a booking#
select*from book;
select sum(total_price) as Total_Price from book;

#4.Retrieve all current guests who are checked into rooms#
select*from guest;
select*from book;
select concat(first_name,last_name) as Guest_Name,
guest.ph_no,book.guest_id,book.room_id,book.check_in_date
from guest join book on book.guest_id=guest.gus_id where book_status="Checked-in";

#5.Get a list of available rooms by type and price#
select*from rooms;
select room_id,room_number,room_type as types,price_per_night as 
price,is_available from rooms where is_available=1 group by 
types,price,room_id,room_number,is_available;

#6.Calculate the total revenue generated from all bookings#
select*from book;
select sum(total_price) as revenue from book order by sum(total_price);


#7. Find all bookings and payment statuses for a specific guest by their ID#
select*from book;
select*from payment;
select*from guest;
alter table guest rename column guest_id to gus_id;
select book.guest_id,book.book_id,book.room_id,book.check_in_date,book.total_price,book.book_status,
payment.payment_id,payment.amount_paid,payment_status from book join payment on
payment.booking_id=book.book_id where guest_id=3;


#8. Display services used by each guest along with the total cost of services for each booking.#
select*from sp;
select*from book;
alter table book rename column booking_id to book_id;
select book.book_id,book.guest_id,service_usage.total_service_cost,service_usage.usage_date from service_usage
left join book on service_usage.booking_id=book.book_id where book_id=203;

#9.List staff members by their roles#
select*from staff;
select concat(first_name,' ',last_name) as Name,roles from staff 
where roles="Receptionist" group by name,roles;

#10.Find all rooms that were booked during a specific date range#
select*from rooms;
select*from book;
select rooms.room_id,book.check_in_date,book.book_status from book 
join rooms on rooms.room_id=book.room_id where check_in_date between "2024-01-10" and "2024-04-07";

#11.List all guests with pending payments#
select*from payment;
select*from guest;
select*from book;
select concat(first_name,' ',last_name) as names,book.book_id,book.room_id,
payment.payment_status from guest join book on book.guest_id=guest.gus_id join payment on
payment.booking_id=book.book_id where payment_status="Pending";

#13.Retrieve a summary of each room’s usage, including
#the number of times it has been booked and total revenue.#
select*from book;
select*from sp;
select*from rooms;
select book.book_status,book.book_id,book.room_id,rooms.room_type,service_usage.quantity,service_usage.usage_id,
service_usage.usage_date,book.total_price from 
book join service_usage on 
service_usage.booking_id=book.book_id 
join rooms on 
rooms.room_id=book.room_id group by book.book_id,book.room_id,
service_usage.usage_id,service_usage.usage_date having book_status="Checked-in";


#12.Calculate the total amount spent by each guest, including room charges and service charges#
select*from book;
select*from guest;
select*from sp;

select concat(first_name,' ',last_name) as names,
sum(total_price + coalesce(service_usage.total_service_cost,0)) as total_spend 
from guest join book on book.guest_id=guest.gus_id left join
service_usage on service_usage.booking_id=book.book_id group by guest_id;