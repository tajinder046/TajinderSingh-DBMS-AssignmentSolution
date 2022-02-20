create database travelOnTheGo;

use travelOnTheGo;

create table PASSENGER(
		Passenger_name varchar(50),
        Category varchar(50),
        Gender varchar(50),
        Boarding_City varchar(50),
        Destination_City varchar(50),
        Distance int,
        Bus_Type varchar(50)
        );
        
create table PRICE(
		Bus_Type varchar(50),
        Distance int,
        Price int
        );
        
insert into PASSENGER values('Sejal', 'AC' ,'F' ,'Bengaluru', 'Chennai', '350', 'Sleeper');
insert into PASSENGER values('Anmol','Non-AC','M','Mumbai','Hyderabad','700','Sitting');
insert into PASSENGER values('Pallavi','AC','F','Panaji','Bengaluru','600','Sleeper');
insert into PASSENGER values('Khusboo','AC','F','Chennai','Mumbai','1500','Sleeper');
insert into PASSENGER values('Udit','Non-AC','M','Trivandrum','panaji','1000','Sleeper');
insert into PASSENGER values('Ankur','AC','M','Nagpur','Hyderabad','500','Sitting');
insert into PASSENGER values('Hemant','Non-AC','M','panaji','Mumbai','700','Sleeper');
insert into PASSENGER values('Manish','Non-AC','M','Hyderabad','Bengaluru','500','Sitting');
insert into PASSENGER values('Piyush','AC','M','Pune','Nagpur','700','Sitting');

insert into PRICE values('Sleeper','350','770');
insert into PRICE values('Sleeper','500','1100');
insert into PRICE values('Sleeper','600','1320');
insert into PRICE values('Sleeper','700','1540');
insert into PRICE values('Sleeper','1000','2200');                                            
insert into PRICE values('Sleeper','1200','2640');
insert into PRICE values('Sleeper','1500','2700');
insert into PRICE values('Sitting','500','620');
insert into PRICE values('Sitting','600','744');
insert into PRICE values('Sitting','700','868');
insert into PRICE values('Sitting','1000','1240');
insert into PRICE values('Sitting','1200','1488');
insert into PRICE values('Sitting','1500','1860');

/* 3) How many females and how many male passengers travelled for a minimum distance of 
600 KM s? */

select count(Gender) as No_Of_Males from PASSENGER where Distance>=600 && Gender='M' group by Gender;

select count(Gender) as No_Of_Females from PASSENGER where Distance>=600 && Gender='F' group by Gender;

/* 4) Find the minimum ticket price for Sleeper Bus. */

select min(Price) from PRICE where Bus_Type='Sleeper';

/* 5) Select passenger names whose names start with character 'S' */

select Passenger_name from PASSENGER where Passenger_name like 'S%';

/* 6) Calculate price charged for each passenger displaying Passenger name, Boarding City, 
Destination City, Bus_Type, Price in the output */

select PASSENGER.Passenger_name,PASSENGER.Boarding_City,PASSENGER.Destination_City,PASSENGER.Bus_Type,PRICE.Price
from PASSENGER
left join PRICE
on PASSENGER.Bus_Type=PRICE.Bus_Type
where PASSENGER.Distance=PRICE.Distance;

/* 7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus 
for a distance of 1000 KM s
*/

select Passenger_name,price from passenger as p join price as pr
on pr.distance = p.distance and pr.bus_type = p.bus_type
where p.distance = 7000 and p.bus_type='sitting';

/* 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to 
Panaji?  */

select Price from(select PASSENGER.Passenger_name,PASSENGER.Bus_Type,PRICE.Price
from PASSENGER
left join PRICE
on PASSENGER.Bus_Type=PRICE.Bus_Type
where PASSENGER.Distance=PRICE.Distance && PASSENGER.Passenger_name='Pallavi') as Travels;

/* 9) List the distances from the "Passenger" table which are unique (non-repeated 
distances) in descending order.*/

select Distance from PASSENGER group by Distance order by Distance desc;

/* 10) Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables  */

select Passenger_name,Distance*100/(select sum(distance) from PASSENGER) as percentage from PASSENGER;

/* 11) Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
*/

SELECT Distance,Price,
CASE
    WHEN Price > 1000 THEN "Expensive"
    WHEN Price<1000 && Price>500 THEN "Average Cost"
    ELSE "Cheap"
END as 'Relative Cost'
FROM PRICE;