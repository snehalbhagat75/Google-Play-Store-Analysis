# Total Apps
/*
SELECT COUNT(*) AS Total_Apps
FROM google_playstore_cleaned;
*/

# Free vs Paid Apps
/*
SELECT
Type,
COUNT(*) AS Total_Apps
FROM google_playstore_cleaned
GROUP BY Type;
*/ 

# Top Categories by Number of Apps
/*
SELECT
Category,
COUNT(*) AS Total_Apps
FROM google_playstore_cleaned
GROUP BY Category
ORDER BY Total_Apps DESC
LIMIT 10;
*/

# Highest Rated Categories
/*
SELECT
Category,
ROUND(AVG(Rating),2) AS Avg_Rating
FROM google_playstore_cleaned
GROUP BY Category
ORDER BY Avg_Rating DESC;
*/

# Apps with Highest Ratings
/*
SELECT
App,
Category,
Rating
FROM google_playstore_cleaned
ORDER BY Rating DESC
LIMIT 20;
*/ 

# Most Reviewed Apps
/*
SELECT
App,
Reviews
FROM google_playstore_cleaned
ORDER BY Reviews DESC
LIMIT 20;
*/ 






















