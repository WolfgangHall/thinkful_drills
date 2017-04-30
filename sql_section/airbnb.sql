# What's the most expensive listing? What else can you tell me about the listing?
# https://www.screencast.com/t/aBohwJadN
SELECT
    *
FROM
    listings
WHERE
    listings.price = (SELECT MAX(listings.price) FROM listings)


# What neighborhoods seem to be the most popular?
# https://www.screencast.com/t/pmn37pC5XU
SELECT
    listings.neighbourhood,
    count(*)
FROM
    listings
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10


# What time of year is the cheapest time to go to your city? What about the busiest?

# cheapest
# https://www.screencast.com/t/X4EVPYzp4p
SELECT
    strftime('%m', DATE(reviews.date)) Month,
    AVG(listings.price) avg_listing_price
FROM
    listings
JOIN
    reviews
ON
    listings.id = reviews.listing_id
GROUP BY 1
ORDER BY 2


# Busiest
# https://www.screencast.com/t/xLFdV1CnAAEJ
SELECT
    strftime('%m', DATE(reviews.date)) Month,
    count(*) number_of_reviews
FROM
    reviews
GROUP BY 1
ORDER BY 2 DESC
