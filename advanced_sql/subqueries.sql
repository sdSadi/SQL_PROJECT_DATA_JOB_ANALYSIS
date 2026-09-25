SELECT *
FROM ( -- SubQuery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;
-- SubQUery end here

WITH january_jobs AS ( -- CTE definition starts here
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE definition ends here

SELECT *
FROM january_jobs
LIMIT 100;

-- SubQuery example
SELECT
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT
            company_id
    FROM
            job_postings_fact
    WHERE
            job_no_degree_mention = true
    
)
LIMIT 100;