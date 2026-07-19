
-- Popula tabelas

INSERT INTO web_page_phishing (unique_id, url_length, n_redirection, phishing)
SELECT unique_id, url_length, n_redirection, phishing
FROM raw_phishing_dataset;

INSERT INTO phishing_dataset (
    unique_id, n_dots, n_hyphens, n_underline, n_slash, n_questionmark,
    n_equal, n_at, n_and, n_exclamation, n_space, n_tilde, n_comma,
    n_plus, n_asterisk, n_hashtag, n_dollar, n_percent
)
SELECT
    unique_id, n_dots, n_hypens, n_underline, n_slash, n_questionmark,
    n_equal, n_at, n_and, n_exclamation, n_space, n_tilde, n_comma,
    n_plus, n_asterisk, n_hastag, n_dollar, n_percent
FROM raw_phishing_dataset;

