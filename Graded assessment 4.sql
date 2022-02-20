create database TravelOnTheGo;
use TravelOnTheGo;
create table `PASSENGER`
(
`Passenger_name` varchar (50) not null,
 `Category` varchar(30),
 `Gender` varchar(50),
 `Boarding_City` varchar(40), 
 `Destination_City` varchar(60),
 `Distance` int(20), 
 `Bus_Type` varchar(55) 
 );

create table `PRICE`
(
 Bus_Type varchar(40),
 Distance int,
 Price int
 );

 # Insert for PASSENGER records
 
insert into `PASSENGER`
(Passenger_name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)
 values("Sejal","AC","F"," Bengaluru","Chennai",'350',"Sleeper"),
("Anmol","Non-AC","M"," Mumbai","Hyderabad",'700',"Sitting"),
("Pallavi ","AC","F"," Panaji","Bengaluru",'600',"Sleeper"),
("Khusboo ","AC","F","Chennai","Mumbai",'1500',"Sleeper"),
("Udit","Non-AC","M","Trivandrum","panaji",'1000',"Sleeper"),
("Ankur","AC","M","Nagpur","Hyderabad",'500',"Sitting"),
("Hemant","Non-AC","M"," Panji","Mumbai",'700',"Sleeper"),
("Manish","Non-AC","M"," Hyderabad","Bengaluru",'500',"Sitting"),
("Piyush","AC","M"," Pune","Nagpur",'700',"Sitting");

 # Insert for Price records
insert into `PRICE`(Bus_Type, Distance, Price)
 values("Sleeper",'350','770'),
 ("Sleeper",'500','1100'),
 ("Sleeper",'600','1320'),
 ("Sleeper",'700','1540'),
 ("Sleeper",'1000',2200),
 ("Sleeper",'1200','2640'),
 ("Sleeper",'1500','2700'),
 ("sitting",'500','620'),
 ("Sitting",'600','744'),
 ("sitting",'700','868'),
 ("Sitting",'1000','1240'),
 ("sitting",'1200','1488'),
 ("sitting",'1500','1860');

select * from passenger;
select * from PRICE;

# 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?
select gender,count(gender) from passenger
where passenger.distance >= 600  group by gender;

# 4) Find the minimum ticket price for Sleeper Bus. 
select price.Bus_Type, min(price) as min_Ticket_Price from price where bus_type = 'sleeper';

# 5) Select passenger names whose names start with character 'S'
select passenger_name from passenger where Passenger_name like 's%'; 

#  6) Calculate price charged for each passenger displaying Passenger name, Boarding City, 
         # Destination City, Bus_Type, Price in the output
         
select p.Passenger_name,p.Boarding_City,p.Destination_City,p.Bus_Type,pr.Price
  from passenger as p left join price as pr
  on pr.distance = p.distance and pr.bus_type = p.bus_type;
  
# 7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
    #for a distance of 1000 KM s
select Passenger_name,price from passenger as p join price as pr
on pr.distance = p.distance and pr.bus_type = p.bus_type
where p.distance = 1000 and p.bus_type='sitting';


# 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

select pr.Bus_Type,pr.price from price as pr 
where pr.Distance = 600 group by pr.Bus_Type;

 # 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order
 
select  passenger_name,distance from passenger group by Distance order by Distance desc;

# 10) Display the passenger name and percentage of distance travelled by that passenger 
# from the total distance travelled by all passengers without using user variables

select passenger_name,distance * 100 /(select sum(distance) from passenger) as percentage from passenger;

# 11) Display the distance, price in three categories in table Price
# a) Expensive if the cost is more than 1000
# b) Average Cost if the cost is less than 1000 and greater than 500
# c) Cheap otherwise

select distance,price,
CASE 
	 WHEN  price > 1000  THEN 'Expensive'
	 WHEN  price > 500 THEN 'Average Cost'
	 ELSE 'Cheap'
END AS categories
from price ;
