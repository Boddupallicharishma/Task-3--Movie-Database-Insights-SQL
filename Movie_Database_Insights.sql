
-- -----------------------------
-- 1. Top 10 Highest Grossing Movies
-- -----------------------------
SELECT title, revenue
FROM movies
ORDER BY revenue DESC
LIMIT 10;

-- -----------------------------
-- 2. Average Rating by Genre
-- -----------------------------
SELECT m.genre, AVG(r.rating) AS avg_rating
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.genre
ORDER BY avg_rating DESC;

-- -----------------------------
-- 3. Top 5 Directors by Average Rating
-- -----------------------------
SELECT d.name, AVG(r.rating) AS avg_director_rating
FROM directors d
JOIN movie_directors md ON d.director_id = md.director_id
JOIN ratings r ON md.movie_id = r.movie_id
GROUP BY d.name
ORDER BY avg_director_rating DESC
LIMIT 5;

-- -----------------------------
-- 4. Number of Movies Released Each Year
-- -----------------------------
SELECT release_year, COUNT(*) AS total_movies
FROM movies
GROUP BY release_year
ORDER BY release_year;

-- -----------------------------
-- 5. Top 10 Most Active Actors
-- -----------------------------
SELECT a.name, COUNT(ma.movie_id) AS total_movies
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
GROUP BY a.name
ORDER BY total_movies DESC
LIMIT 10;

-- -----------------------------
-- 6. Highly Rated and High-Grossing Movies
-- -----------------------------
SELECT m.title, AVG(r.rating) AS avg_rating, m.revenue
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title, m.revenue
HAVING AVG(r.rating) > 8 AND m.revenue > 100000000;

-- -----------------------------
-- 7. Movies with Highest ROI (Revenue-to-Budget Ratio)
-- -----------------------------
SELECT title, revenue, budget, (revenue / NULLIF(budget, 0)) AS roi
FROM movies
WHERE budget > 0
ORDER BY roi DESC
LIMIT 10;
