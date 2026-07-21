SELECT *
FROM phishing_dataset
JOIN web_page_phishing
ON phishing_dataset.unique_id = web_page_phishing.unique_id