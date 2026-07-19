
-- Cria tabelas finais definindo chave estrangeira

CREATE TABLE web_page_phishing (
    unique_id INTEGER PRIMARY KEY,
    url_length INTEGER NOT NULL,
    n_redirection INTEGER NOT NULL,
    phishing INTEGER NOT NULL CHECK (phishing IN (0, 1))
);

CREATE TABLE phishing_dataset (
    unique_id INTEGER PRIMARY KEY,
    n_dots INTEGER NOT NULL,
    n_hyphens INTEGER NOT NULL,
    n_underline INTEGER NOT NULL,
    n_slash INTEGER NOT NULL,
    n_questionmark INTEGER NOT NULL,
    n_equal INTEGER NOT NULL,
    n_at INTEGER NOT NULL,
    n_and INTEGER NOT NULL,
    n_exclamation INTEGER NOT NULL,
    n_space INTEGER NOT NULL,
    n_tilde INTEGER NOT NULL,
    n_comma INTEGER NOT NULL,
    n_plus INTEGER NOT NULL,
    n_asterisk INTEGER NOT NULL,
    n_hashtag INTEGER NOT NULL,
    n_dollar INTEGER NOT NULL,
    n_percent INTEGER NOT NULL,
    FOREIGN KEY (unique_id) REFERENCES web_page_phishing(unique_id)
);