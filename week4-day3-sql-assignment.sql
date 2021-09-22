-- QUESTION 1: List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer
JOIN address
ON address.address_id = customer.address_id
WHERE district LIKE 'Texas';
-- answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

-- QUESTION 2: Get all payments above $6.99 with the Customer's Full Name
SELECT payment_id, first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;
-- answer: there are 1406 rows of data

-- QUESTION 3: Show all customers names who have made payments over $175 (use subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);
-- answer: Rhonda Kennedy, Clara Shaw, Eleanor Hunt, Marion Snyder, Tommy Collazo, Karl Seal

-- QUESTION 4: List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, city, country
FROM customer
JOIN address
ON address.address_id = customer.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON country.country_id = city.country_id
WHERE country LIKE 'Nepal';
-- answer: Kevin Schuler

-- QUESTION 5: Which staff member had the most transctions?
SELECT staff.first_name, staff.last_name, COUNT(payment.payment_id)
FROM staff
JOIN payment
ON payment.staff_id = staff.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(payment.payment_id) DESC
-- answer: Jon Stephens

-- QUESTION 6: How many movies of each rating are there?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id);
-- answer: G:178 / PG:194 / R:195 / NC-17:210 / PG-13: 223
-- IF the question asks how many inventorys of each rating
SELECT rating, COUNT(inventory_id)
FROM inventory
JOIN film
ON film.film_id = inventory.film_id
GROUP BY film.rating
ORDER BY COUNT(inventory_id);
-- anwswer: G: 791 / R: 904 / PG: 924 / NC-17: 944 / PG-13: 1018

-- QUESTION 7: Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
);
-- answer: There are 539 rows of data

-- QUESTION 8: How many free rentals did our stores give away?
CREATE OR REPLACE FUNCTION freerental(
	_store_id INTEGER
)
RETURNS INTEGER
AS $$
BEGIN
	RETURN(
		SELECT COUNT(payment.payment_id)
		FROM store
		JOIN payment
		ON store.manager_staff_id = payment.staff_id
		WHERE store_id = _store_id AND payment.amount = 0.00
		GROUP BY store_id
	);
END;
$$
LANGUAGE plpgsql;

SELECT freerental(1);
SELECT freerental(2);
-- answer: store_id 1 has 15 free rentals and store_id 2 has 9 free rentals.