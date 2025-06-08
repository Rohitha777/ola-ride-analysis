create database ola;
use ola;
#Retrieve all successful bookings
create view Successful_Bookings as
select * from Bookings
where Booking_Status='Success';
select * from Successful_Bookings; 

#. Find the average ride distance for each vehicle type
Create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as Avg_Distance 
from Bookings 
group by Vehicle_Type;
select * from ride_distance_for_each_vehicle;

#. Get the total number of cancelled rides by customers:
create view Canceled_rides_by_Customer as
select count(*) from Bookings
where Booking_Status ='Canceled by Customer';
select * from Canceled_rides_by_Customer;

#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID,count(Booking_ID) as total_rides 
from Bookings
group by Customer_ID
order by total_rides desc
limit 5;
select * from top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Canceled_Rides_by_Driver_p_c_issues as
select count(*) from Bookings
where Canceled_Rides_by_Driver='Personal & Car related issue';
select * from Canceled_Rides_by_Driver_p_c_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings
create view min_max_driver_ratings as
select max(Driver_Ratings) as max_rating,min(Driver_Ratings) as min_rating from Bookings
where Vehicle_Type='Prime Sedan';
select * from min_max_driver_ratings ;

#7. Retrieve all rides where payment was made using UPI
Create view payment_UPI as
select * from Bookings where Payment_Method='UPI';
select * from payment_UPI;

#8.. Find the average customer rating per vehicle type:
create view avg_customer_rating as
select Vehicle_Type,avg(Customer_Rating) as avg_customer_rating from Bookings
group by Vehicle_Type;
select * from avg_customer_rating;

#9.. Calculate the total booking value of rides completed successfully
create view total_successful_ride_value as
select sum(Booking_Value) as total_successful_ride_value from Bookings
where Booking_Status='Success';
select * from total_successful_ride_value;

#10List all incomplete rides along with the reason:
Create view Incomplete_Rides_Reasons as
select Booking_ID,Incomplete_Rides_Reason from Bookings
where Incomplete_Rides='Yes';
select * from Incomplete_Rides_Reasons;




