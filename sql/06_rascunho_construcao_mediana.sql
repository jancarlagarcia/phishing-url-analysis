-- Processo de construção para chegar na query de comprimento_url

SELECT phishing,
    AVG(url_length) AS media_url_length
FROM web_page_phishing
GROUP BY phishing;

SELECT phishing,
    AVG(url_length) AS media_url_length,
    MIN(url_length) AS minimo,
    MAX(url_length) AS maximo,
    COUNT(*) AS total_linhas
FROM web_page_phishing
GROUP BY phishing;

SELECT url_length,
        ROW_NUMBER() OVER (ORDER BY url_length) AS posicao
    FROM web_page_phishing
    WHERE phishing = 0

SELECT url_length
FROM (
    SELECT url_length,
        ROW_NUMBER() OVER (ORDER BY url_length) AS posicao
    FROM web_page_phishing
    WHERE phishing = 0
    )
WHERE posicao = 31858;

SELECT AVG(url_length)
FROM (
    SELECT url_length,
        ROW_NUMBER() OVER (ORDER BY url_length) AS posicao
    FROM web_page_phishing
    WHERE phishing = 1
    )
WHERE posicao IN (18181,18182);


