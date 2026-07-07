use world;
select * from country
limit 5; # it gives me top 5 data rows

select * from country
limit 5 offset 20; # with offset top 20 rows are ignored and then with limit it is giving you the top 5

 
# select * from country
# offset 20 limit 5; # this one is wrong limit will be in front

# ----------- order by ----------------

select * from country
order by Population; # sorting accending order by population

select * from country
order by Population desc; # sorting decending order by population

select code,Name,continent from country
order by continent;

select code,Name,continent from country
order by continent,Name;

select code,Name,continent from country
order by continent,Name desc;


select * from country
order by Population;

select * from country
order by Population desc limit 1 offset 33; # 34th ranked country by population

select * from country
order by Population desc limit 1 offset 66; # 67th ranked country by population

select Name,Population from country
order by Population limit 1 offset 76;


# ------------------ Data filtering --------------------
# ------- Where operator-----------

select * from Country
where continent = "Asia"; # we can do data filtering with this

select * from country
where Region = "Middle East";

select * from country
where IndepYear = 1971;

select * from country
where Region = "Middle East" 
order by Name;

select Name,Continent,Population from country
where Region = "Middle East"
order by Name,Population desc;

select * from country
where IndepYear = 1971;

select * from country
where Region = "Middle East"
order by Name;



## Relational Operators (>,<,=,>=,<=,       <>)
   #--------- Neumeric Values-------------

select Name, Continent, IndepYear from country
where IndepYear > 1971;


select Name, Continent, IndepYear from country
where IndepYear > 1971
order by IndepYear;

select Name, Continent, IndepYear from country
where IndepYear >= 1971
order by IndepYear;

select name, Region, Population, GNP, LifeExpectancy, IndepYear from country
where LifeExpectancy <=60 
order by LifeExpectancy;


select name, Region, Population, GNP, LifeExpectancy, IndepYear from country
where LifeExpectancy <=60 
order by LifeExpectancy
limit 10;

select name, Continent, Region, Population, GNP, LifeExpectancy, IndepYear from country
where Continent <> "Asia"
order by Continent;

     ##------------- textual values-------------
     
     
select * from country
where Name > "India"
order by Name; # it will sort by alphabetic order

select * from country
where Name < "India"
order by Name;


## -----------------Logical Operators----------------------
    # ----------------And-------------------
    
select * from country
where continent = "Europe" and Population > 1000000;
    
    
select * from country
where continent = "Europe" and GNP > 1000000
order by GNP;


select * from country
where continent = "Europe" and GNP > 1000000 and SurfaceArea < 300000
order by GNP;

select * from country
where continent = "Europe" and GNP > 1000000 and SurfaceArea > 300000
order by GNP;


    # ------------------------Or-------------------
    
select * from country
where continent = "Europe" or GNP > 1000000
order by Continent;
    
select * from country
where continent = "Europe" or GNP > 100000
order by Continent;


    #------------------------ Not---------------------

select * from country
where not continent = "Europe" ; # this not operator showing us to not follow the condition (continent = "Europe") 

select * from country
where continent <> "Europe" ; # here (continent <> "Europe") is a condition

select * from country
where not continent = "Europe" and not GNP > 1000000
order by Continent;

select * from country
where not continent = "Europe" or not GNP > 1000000
order by Continent;

# LIKE, IN and BETWEEN Operator
# -----------------IN---------------------- (for multiple same operator)
select Name,GNP,Population,continent from country
where Continent = "Europe" or Continent = "Asia" or Continent = "North America"
order by Continent;

select Name,GNP,Population,continent from country
where Continent in ("North America","Asia","Europe")
order by Continent;

select Name,GNP,Population,continent from country
where Continent not in ("North America","Asia","Europe")
order by Continent;

# ---------------- BETWEEN------------------------- (finding the value in certain range)
select Name,Population,continent,LifeExpectancy from country
where LifeExpectancy between 70 and 80
order by LifeExpectancy;

select Name,Population,continent,LifeExpectancy from country
where Name between "Bangladesh" and "Iran" and LifeExpectancy between 70 and 80
order by Name;


#-------------- Like----------------

select * from country;

# All the countries where all the name starts with "A"

select * from country
where Name like 'A%'; # it means the characters form name it starts form 'A' and any character after 'A'
                       #  the percentage demands character after 'A' just only 'A' with just only look for 'A'

select * from country
where Name like 'A_'; # it is trying to find one fixed character

select * from country
where Name like 'A_________'; # trying to find fixed number of charater after 'A' after 'A' there are 9 '_' 
							 # it is trying to find 9 character after 'A'
                             

select * from country
where Name like '%A'; # looking for ending with 'A'

select * from country
where Name like '___A'; #fixed character before 'A'

select * from country
where Name like '_____A';

## % -----> any number of character 
## _ ------> fixed number of character
## Space -------> Individualise a word
 

Select * from country
where Name like "%__A";
# 'A' means ending with 'A'
# __ - exactly 2 character
# % - any number of character
## "%___A" -----> Means text ending with atleast 4 characters and ending with 'A'
Select * from country
where Name like "__A%";
## "__A%" ------> Means text starting with atleast 3 character and 'A' as 3rd character and end with any other charater 
Select * from country
where Name like "__A__%";
##"__A__%" -----> means there will be atleast 5 characters and 2 characters before "A" and 2 character After "A" the other characeter 

Select * from country
where Name like "%_____A";


# -------------------Aliases---------------------------
## Alias given for column
Select Name, LifeExpectancy as LE from country; ## changing the name of the column but it does not change the name in the main table

select Name, Continent, SurfaceArea as SA, LifeExpectancy as LE, IndepYear as IY from country;


# Aliases for Expression
select Name, Continent, GNP, Population as Pop, (GNP * 1000000/Population) from country;

select Name, Continent, GNP, Population as Pop, (GNP * 1000000/Population) as GNP_Per_Cap from country
order by GNP_Per_Cap desc;


#------------------ Building Functions in SQL----------------------

## Aggregate Fuctions
## the function that is used to aggregate the data
## Sum/Average/Max/Min/Count/Count distinct

select sum(SurfaceArea)/1000000 as total_sur_area from country;

select avg(SurfaceArea)/1000000 as AVG_sur_area from country;

select count(distinct Continent) as total_continents from country; 

select count(distinct Name) as total_countries from country;


#---------------------- Group by Operator------------------------

select Continent, sum(Population)/1000000 as Pop_in_mn from country
group by Continent; # the entire data is grouped by continent

select Continent, avg(Population) as Avg_Pop from country
group by Continent
order by Avg_Pop desc;

select Region, Continent, sum(SurfaceArea) as TSA from country
group by Region,Continent;

select Continent, count(distinct Region) as total_regions, sum(Population)/1000000 as Pop_in_mn from country
group by Continent;

#--------- having------------

Select Region, Continent, count(Name) as no_of_countries from country
group by Region, Continent
having Continent in('Asia','Africa','Europe') # in place of 'where' we are using 'having' because inside the groupe by we use 'having'
order by continent;
 
Select Region, Continent, count(Name) as no_of_countries from country
group by Region, Continent
having no_of_countries>10
order by no_of_countries desc;


## country with highest life expectancy

SELECT Name, LifeExpectancy as Max_LE
FROM country
WHERE LifeExpectancy = (
    SELECT MAX(LifeExpectancy)
    FROM country
);































