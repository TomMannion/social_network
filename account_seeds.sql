--TRUNCATE TABLE accounts RESTART IDENTITY;

DROP TABLE IF EXISTS accounts CASCADE;

CREATE SEQUENCE IF NOT EXISTS accounts_id_seq;
  
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  username text,
  email text
);

INSERT INTO accounts (username, email) VALUES
('thomasmannion', 'thomasmannion@gmail.com'),
('jasonboylan', 'jasonboylan@yahoo.com'),
('darrenpeanut', 'peanutparty@budweiser.de'),
('Olafsanderson', 'sweden4eva@knut.de'),
('Bingtripple', 'sausageman34@aol.com'),
('momentarylapse12299', 'canada@canada.org');