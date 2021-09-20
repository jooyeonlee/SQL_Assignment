-- QUESTION 1: How many actors are there with the last name 'Wahlberg'
SELECT COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg';
-- Answer: 2

-- QUESTION 2: How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- Answer: 5607

-- QUESTION 3: What film does the store have the most of? (search in inventory)
SELECT film.title, inventory.film_id, COUNT(inventory.film_id) AS number_of_inventory 
FROM inventory
JOIN film ON inventory.film_id = film.film_id
GROUP BY inventory.film_id, film.title
ORDER BY COUNT(inventory.film_id) DESC;
-- Answer: 72 films have stock of 8 each. 
-- Grit Clockwork, Lose Inch, Curtain Videotape, Dynamite Tarzan, Loathing Legally, Dogma Family, Goodfellas Salute, Invasion Cyclone, Juggler Hardly
-- Married Go, Rush Goodfellas, Zorro Ark, Pulp Beverly, Network Peak, Butterfly Chocolat, Wife Turn, Kiss Glory, Confidential Interview
-- Trip Newton, Rugrats Shakespeare, Dancing Fever, Ridgemont Submarine, Heavyweights Beast, Moon Bunch, Sweethearts Suspects, Shock Cabin
-- Swarm Gold, Torque Bound, Innocent Usual, Frost Head, Greatest North, Forward Temple, Cat Coneheads, Dinosaur Secretary, Streetcar Intentions
-- Sting Personal, Operation Operation, Rocketeer Mother, Mockingbird Hollywood, Bound Cheaper, Pity Bound, Bucket Brotherhood, Harry Idaho, Cupboard Sinners,
-- Roses Treasure, Muscle Bright, Seabiscuit Punk, Crossroads Casualties, Storm Happiness, Beverly Outlaw, Academy Dinasaur, Expendable Stallion,
-- Virginian Pluto, Hustler Party, Scalawag Duck, Spy Mile, Gilmore Boiled, Apache Divine, Deer Virginian, Family Sweet, Garden Island, Gleaming Jawbreaker, Metropolis Coma,
-- Horror Reign, Titans Jerk, Telemark Heartbreakers, Bingo Talented, Primary Glass, Saturday Lambs, Hobbit Alien, Boogie Amelie, Giant Troopers

-- QUESTION 4. How many customers have the last name 'William'?
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William%';
-- answer: 2

-- QUESTION 5: What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(staff_id) AS num_of_rental
FROM rental
GROUP BY staff_id;
-- answer: staff_id 1 (sold 8040)

-- QUESTION 6: How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
-- answer: 378

-- QUESTION 7: What film has the most actors in it? (use film_actor table and get film_id)F
SELECT film_id, COUNT(actor_id) AS num_of_actors
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;
-- answer: film_id 508 (15 actors)

-- QUESTION 8: From stord_id 1, how many customers have a last name ending with 'es'? (use customer table)
SELECT COUNT(last_name)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';
-- answer: 13

-- QUESTION 9: How many payment amount(4.99,5.99, etc) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having >250)
SELECT amount, COUNT(rental_id) AS rental_num
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
ORDER BY rental_num DESC;
-- answer: 3 (2.99, 4.99, 0.99)

-- QUESTION 10: Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT rating, COUNT(film_id) AS film_num
FROM film
GROUP BY rating
ORDER BY film_num DESC;
-- answer: PG-13 (223)
