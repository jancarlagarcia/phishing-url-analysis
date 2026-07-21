-- O comprimento da URL é um forte indicador de se a URL é phishing?

SELECT phishing,
    AVG(url_length) AS media_url_length,
    (SELECT url_length FROM (
            SELECT url_length,
             ROW_NUMBER() OVER (ORDER BY url_length) AS posicao
            FROM web_page_phishing
            WHERE phishing = 0
            )
        WHERE posicao = 31858) AS mediana_url_length,
    MIN(url_length) AS minimo,
    MAX(url_length) AS maximo,
    COUNT(*) AS total_linhas
FROM web_page_phishing
WHERE phishing = 0

UNION ALL

SELECT phishing,
    AVG(url_length) AS media_url_length,
    (SELECT url_length FROM (
            SELECT url_length,
             ROW_NUMBER() OVER (ORDER BY url_length) AS posicao
            FROM web_page_phishing
            WHERE phishing = 1
            )
        WHERE posicao IN (18181, 18182)) AS mediana_url_length,
    MIN(url_length) AS minimo,
    MAX(url_length) AS maximo,
    COUNT(*) AS total_linhas
FROM web_page_phishing
WHERE phishing = 1
