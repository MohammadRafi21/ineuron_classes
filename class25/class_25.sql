use sakila;

select * from complete_add
order by address_id;

select * from customer;

## String Function

select * from actor;
select * from complete_add;
select * from category;
select * from customer;
select * from film;
   
   #------------Concat - joins two or more actor-------------

select *, concat(first_name, "  ", last_name) as Full_name from actor;

select * from complete_add;

select address,district, concat(address," , ",district) as full_address from complete_add;

   #----------Upper/Lower - for converting in upper and lower case---------------- 


select *, lower(email) as corrected_email from customer;
select Email, lower(email) as lower_case, upper(email) as UPPER_CASE from customer;

   # -----------------Length----------------------------
   
   
select film_id,title, length(title) as counted_char_in_title from film;

select film_id, title, description,length(description) as des_length from film
where length(description) <= 100
order by des_length desc;

   # -------------- Substring----------------

select * from customer;
select first_name,last_name, substring(first_name,1,5) as first_two_char from customer;
select first_name,last_name, substring(first_name,3,7) as middle_to_last from customer;
select first_name,last_name, substring(first_name,-2,2) as last_two_char from customer;
select first_name,last_name, substring(first_name,length(first_name)-1,2) as last_two_char from customer;



  #-------------------------Left/Right-----------------------------

select first_name, left(first_name,2), right(first_name,2) from customer;

  #---------------------------Trim- Removes the whitespaces form left and right of the text--------------------------
  
select trim(first_name), left(first_name,2), right(first_name,2) from customer; # it is used to remove spaces before and after the first name take the characters after trimming 
  
  #------------------------------Replace---------------------------

select first_name, last_name, active, replace(active,1,"Yes") as customer_status from customer;
select first_name, last_name, active, replace(active,0,"No") as customer_status from customer;

select * from payment;
select * from rental;

# current date
select current_date();
# current date
select current_time();
#Now/Current_timestamp()
select current_timestamp();
# date
select date(return_date) from rental;

# time
select time(return_date) from rental;
# Year
select *,year(rental_date) as Rental_year from rental;

select *,month(rental_date) as Rental_month from rental;
select *,day(rental_date) as Rental_day from rental;
select *,dayofweek(rental_date) as Rental_day from rental;
select *,dayname(rental_date) as Rental_day from rental;

# date addition
select *,date_add(rental_date,interval 1 week) as target_return_date from rental;

select *,date(date_add(rental_date,interval 1 week)) as target_return_date from rental; # it moves one week forward

# Date subtraction

select *,date_sub(rental_date,interval 1 week) as target_return_date from rental; # it go back one week

# datediff
select rental_date, return_date, datediff(return_date,rental_date) as Rent_duration from rental;
select rental_date, return_date, datediff(return_date,rental_date) as Rent_duration,
date_add(rental_date,interval 1 week) as target_return_date  from rental;

select customer_id, rental_date, return_date, datediff(return_date,rental_date) as Rent_duration from rental
where datediff(return_date,rental_date)>7
order by Rent_duration desc;















