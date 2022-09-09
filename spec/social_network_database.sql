DROP TABLE IF EXISTS posts;

CREATE SEQUENCE IF NOT EXISTS posts_id_seq;


CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  views int,
  account_id int,
  constraint fk_account foreign key(account_id)
  references accounts(id)
  on delete cascade
);

DROP TABLE IF EXISTS accounts;

CREATE SEQUENCE IF NOT EXISTS accounts_id_seq;
  
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  username text,
  email text
);
