/*How many airplanes have listed speeds?'*/
SELECT COUNT(speed) from planes
where speed is not null;


/*What is the minimum listed speed and the maximum listed speed?*/
SELECT MIN(speed) as 'MINIMUM', MAX(speed) as 'MAXIMUM' from planes
where speed is not null;

/*2. What is the total distance flown by all of the planes in 
January 2013? */
SELECT sum(distance) from flights
where year ='2013' AND month='1';

/*What is the total distance flown by all of 
the planes in January 2013 where the tailnum is 
missing?*/
SELECT sum(distance) from flights
where year ='2013' AND month='1' AND tailnum is NULL;

/*3. What is the total distance flown for all planes on July 5, 
2013 grouped by aircraft manufacturer? */
SELECT manufacturer, sum(distance) from flights 
inner join planes ON planes.tailnum=flights.tailnum 
where flights.year='2013' AND flights.month='7' AND flights.day='5' 
group by planes.manufacturer;



/*Write this 
statement first using an INNER JOIN, then using a LEFT 
OUTER JOIN. How do your results compare?*/
SELECT manufacturer, sum(distance) from flights 
inner join planes ON planes.tailnum=flights.tailnum 
where flights.year='2013' AND flights.month='7' AND flights.day='5' 
group by planes.manufacturer;

SELECT manufacturer, sum(distance) from flights 
left join planes ON planes.tailnum=flights.tailnum 
where flights.year='2013' AND flights.month='7' AND flights.day='5' 
group by planes.manufacturer;

SELECT manufacturer, sum(distance) from flights 
cross join planes ON planes.tailnum=flights.tailnum 
where flights.year='2013' AND flights.month='7' AND flights.day='5' 
group by planes.manufacturer;
-- The results are the same for all three. Using a full left join in union with a full outer join would change the results.

/*4. Write and answer at least one question of your own 
choosing that joins information from at least three of 
the tables in the flights database.*/

-- What tailnum had the most delays by manufacturer?
Select manufacturer, flights.dest, avg(arr_delay), avg(dep_time), avg(dep_delay) from flights
inner join planes ON planes.tailnum=flights.tailnum
where origin= 'LGA' OR origin='JFK'
group by planes.manufacturer, flights.dest;


