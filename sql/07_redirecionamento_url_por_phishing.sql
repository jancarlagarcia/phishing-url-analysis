-- O número de redirecionamentos é um forte indicador de phishing?

SELECT phishing,
    AVG(n_redirection) AS media_redirection,
    (SELECT n_redirection FROM (
            SELECT n_redirection,
             ROW_NUMBER() OVER (ORDER BY n_redirection) AS posicao
            FROM web_page_phishing
            WHERE phishing = 0
            )
        WHERE posicao = 31858) AS mediana_redirection,
    MIN(n_redirection) AS minimo,
    MAX(n_redirection) AS maximo,
    COUNT(*) AS total_linhas
FROM web_page_phishing
WHERE phishing = 0

UNION ALL

SELECT phishing,
    AVG(n_redirection) AS media_redirection,
    (SELECT n_redirection FROM (
            SELECT n_redirection,
             ROW_NUMBER() OVER (ORDER BY n_redirection) AS posicao
            FROM web_page_phishing
            WHERE phishing = 1
            )
        WHERE posicao IN (18181, 18182)) AS mediana_redirection,
    MIN(n_redirection) AS minimo,
    MAX(n_redirection) AS maximo,
    COUNT(*) AS total_linhas
FROM web_page_phishing
WHERE phishing = 1