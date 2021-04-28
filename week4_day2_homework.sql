-- Week 4 - Monday Questions

-- 1. How many actors are there with the last name ‘Wahlberg’? 
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';
-- ANSWER IS: 2

-- 2. How many payments were made between $3.99 and $5.99? 
SELECT COUNT(payment_id)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- ANSWER IS: 5,607 payments

-- 3. What film does the store have the most of? (search in inventory) 
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY film_id;
-- ANSWER IS: film_id 1

-- 4. How many customers have the last name ‘William’? 
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';
-- ANSWER IS: 0 have the last name 'William'...
-- HOWEVER (IN CASE THE QUESTION WAS A TYPO... 1 Has the last name 'Williams')

-- 5. What store employee (get the id) sold the most rentals? 
SELECT staff_id, COUNT(rental_ID)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_ID) DESC;
-- ANSWER IS: staff_id 1

-- 6. How many different district names are there? 
SELECT COUNT(DISTINCT district)
FROM address;
-- ANSWER IS: 378 district names

-- 7. What film has the most actors in it? (use film_actor table and get film_id) 
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;
-- ANSWER IS: film_id 508

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 
SELECT store_id, COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id
ORDER BY store_id;
-- ANSWER IS: 13 Customers

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250) 
SELECT amount, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) >250
ORDER BY COUNT(rental_id) DESC;
-- ANSWER IS: 3 Payment amounts ($2.99 - 290, $4.99 - 281, $0.99 - 269)

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT COUNT(DISTINCT rating)
FROM film;

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;
-- ANSWER IS: 5 Rating Categories and PG-13 has the most movie at 223. 
