WITH review as
(
    SELECT *
    FROM {{ ref('fct_reviews') }}
    WHERE review_date IS NOT NULL
),

listings as
(
    SELECT *
    FROM {{ ref('dim_listings_cleansed') }}
    WHERE created_at IS NOT NULL
)

SELECT 
r.listing_id,
r.review_date,
l.created_at

FROM review r
LEFT JOIN listings l
    ON r.listing_id = l.listing_id

WHERE r.review_date < l.created_at