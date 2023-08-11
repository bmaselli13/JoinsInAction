-- <<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>
-- Do a full outer join to see all records from both tables matched where possible.
-- EXPECTED RESULT: 77 Rows Returned

SELECT * FROM movies LEFT JOIN users on movie_id = favorite_movie_id
UNION
SELECT * FROM movies RIGHT JOIN users on movie_id = favorite_movie_id;

-- Because MySQL does not support "OUTER JOIN" syntax, we must use left and right joins that are brought together with "UNION".

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>>
-- Do a left join to see all records from the movies table and matching records from the users table.
-- EXPECTED RESULT: 75 Rows Returned
SELECT movies.*, users.* FROM movies LEFT JOIN users ON movies.movie_id = users.favorite_movie_id;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>>
-- Do a right join to see all records from the users table and matching records from the movies table.
-- EXPECTED RESULT: 16 Rows Returned
SELECT users.*, movies.* FROM users RIGHT JOIN movies ON users.favorite_movie_id = movies.movie_id WHERE users.favorite_movie_id IS NOT NULL;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>>
-- Do a inner join to get only the rows from the movies tables that have matching rows in the users tables.
-- EXPECTED RESULT: 14 Rows Returned
SELECT movies.* FROM movies INNER JOIN users ON movies.movie_id = users.favorite_movie_id;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>>
-- Determine which lead studio's movies are favorited by users the most.
-- EXPECTED RESULT: Disney
SELECT m.lead_studio, COUNT(u.favorite_movie_id) AS favorite_count FROM movies m LEFT JOIN users u ON m.movie_id = u.favorite_movie_id
GROUP BY m.lead_studio ORDER BY favorite_count DESC LIMIT 1;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>>
-- Get the average Rotten Tomatoes score of all movies that are favorited by a user.
-- EXPECTED RESULT: 52.21
SELECT AVG(m.rotten_tomatoes) AS average_rotten_tomatoes FROM movies m INNER JOIN users u ON m.movie_id = u.favorite_movie_id;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>>
-- Determine which two movies are have duplicate entries in the dataset. (HINT: No join is needed for this problem)
-- EXPECTED RESULT: Mamma Mia!, Gnomeo and Juliet
-- It is important to be able to identify dirty data within a dataset!
SELECT film, COUNT(*) AS duplicate_count FROM movies GROUP BY film HAVING COUNT(*) > 1;


