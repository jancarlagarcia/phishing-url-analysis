
-- Cria e popula a chave única (unique_id) usando o rowid interno do SQLite

ALTER TABLE raw_phishing_dataset ADD COLUMN unique_id INTEGER;
UPDATE raw_phishing_dataset SET unique_id = rowid;