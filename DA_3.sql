
# Apps with Above Average Rating
/*
SELECT
    App,
    Category,
    Rating
FROM google_playstore_cleaned
WHERE Rating >
(
    SELECT AVG(Rating)
    FROM google_playstore_cleaned
);
*/ 

# Highest Rated App in Every Category
/*
SELECT
Category,
App,
Rating
FROM
(
SELECT *,
ROW_NUMBER() OVER
(
PARTITION BY Category
ORDER BY Rating DESC
) AS rn
FROM google_playstore_cleaned
) x
WHERE rn=1;
*/

# Rank Apps by Reviews
/*
SELECT
App,
Category,
Reviews,
RANK() OVER
(
ORDER BY Reviews DESC
) AS Review_Rank
FROM google_playstore_cleaned;
*/ 

# Rank Apps Within Each Category
/*
SELECT
App,
Category,
Rating,
DENSE_RANK() OVER
(
PARTITION BY Category
ORDER BY Rating DESC
) AS Rank_In_Category
FROM google_playstore_cleaned;
*/

# Running Total of Installs
/*
SELECT
App,
Installs,
SUM(Installs)
OVER(
ORDER BY Installs
) AS Running_Total
FROM google_playstore_cleaned;
*/ 

# Moving Average of Ratings
/*
SELECT
App,
Rating,
AVG(Rating)
OVER(
ORDER BY Rating
ROWS BETWEEN 2 PRECEDING
AND CURRENT ROW
) AS Moving_Average
FROM google_playstore_cleaned;
*/ 


# Apps Updated Every Year
/*
SELECT
YEAR(`Last Updated`) AS Year,
COUNT(*) AS Apps
FROM google_playstore_cleaned
GROUP BY YEAR(`Last Updated`)
ORDER BY Year;
*/ 

# Average Rating by Content Rating
/*
SELECT
`Content Rating`,
ROUND(AVG(Rating),2) AS Avg_Rating
FROM google_playstore_cleaned
GROUP BY `Content Rating`
ORDER BY Avg_Rating DESC;
*/ 

# Most Popular Genres
/*
SELECT
Genres,
COUNT(*) AS Apps
FROM google_playstore_cleaned
GROUP BY Genres
ORDER BY Apps DESC
LIMIT 15;
*/ 

# Categories Having More Than 500 Apps
/*
SELECT
Category,
COUNT(*) AS Apps
FROM google_playstore_cleaned
GROUP BY Category
HAVING COUNT(*)>500;
*/ 

# Apps with Reviews Greater Than Category Average
/*
SELECT
App,
Category,
Reviews
FROM google_playstore_cleaned g1
WHERE Reviews >
(
SELECT AVG(Reviews)
FROM google_playstore_cleaned g2
WHERE g1.Category=g2.Category
);
*/ 

# Top 3 Apps from Each Category
/*
SELECT
App,
Category,
Rating
FROM
(
SELECT *,
ROW_NUMBER() OVER
(
PARTITION BY Category
ORDER BY Rating DESC
) rn
FROM google_playstore_cleaned
)x
WHERE rn<=3;
*/ 

# Category-wise Statistics
/*
SELECT
Category,
COUNT(*) AS Apps,
ROUND(AVG(Rating),2) AS Avg_Rating,
SUM(Installs) AS Total_Installs,
ROUND(AVG(Reviews),0) AS Avg_Reviews
FROM google_playstore_cleaned
GROUP BY Category
ORDER BY Total_Installs DESC;
*/ 





