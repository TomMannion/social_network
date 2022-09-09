```
As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.
```

```
Nouns:
account
email address
username

posts
title
content
views



```

|   Record  | Properties          |
|-----------|---------------------|
| accounts     email, username 
| posts        title, content, views


1. first table `accounts`
  Column names: username, email

2. second table `posts`
  Column names: title content, views


```
Table: Users


Table: Posts

```

### Table relationship

accounts will contain many posts

The foreign key will be posts (account_id)

```sql
  CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    username text,
    email text
  );

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

```