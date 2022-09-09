--TRUNCATE TABLE posts RESTART IDENTITY;

DROP TABLE IF EXISTS posts CASCADE;

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

INSERT INTO posts (title, content, views, account_id) VALUES
('boring day', 'went to the shop lol', 3000, 1),
('great day', 'went to a better shop lol', 15000, 1),
('terrible morning', 'bad haircut lol', 3, 2),
('the best day', 'i had the best day', 10, 2),
('this is why i wake up', 'funeral at 12pm', 50, 3),
('the worst day', 'i had the worst day', 20, 3),
('never again', 'holiday of a lifetime', 10000, 4),
('biscuits', 'allergic to biscuits today lol', 30, 5),
('new shoes', 'ive got my new shoes on', 40, 6);

