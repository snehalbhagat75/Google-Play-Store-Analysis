
# Apps with Maximum Installs
/*
SELECT
App,
Installs
FROM google_playstore_cleaned
ORDER BY Installs DESC
LIMIT 20;
*/ 

# Average Rating by App Type
/*
SELECT
Type,
ROUND(AVG(Rating),2) AS Avg_Rating
FROM google_playstore_cleaned
GROUP BY Type;
*/ 

# Average Price of Paid Apps
/*
SELECT
ROUND(AVG(Price),2) AS Average_Price
FROM google_playstore_cleaned
WHERE Type='Paid';
*/ 

# Top Paid Apps
/*
SELECT
App,
Price
FROM google_playstore_cleaned
WHERE Type='Paid'
ORDER BY Price DESC;
*/ 

# Most Installed Categories
/*
SELECT
Category,
SUM(Installs) AS Total_Installs
FROM google_playstore_cleaned
GROUP BY Category
ORDER BY Total_Installs DESC;
*/ 

# Rating Distribution
/*
SELECT
ROUND(Rating,1) AS Rating,
COUNT(*) AS Apps
FROM google_playstore_cleaned
GROUP BY Rating
ORDER BY Rating DESC;
*/ 













