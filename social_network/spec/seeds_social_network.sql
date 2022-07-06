-- As a social network user,
-- So I can have my information registered,
-- I'd like to have a user account with my email address.

-- As a social network user,
-- So I can have my information registered,
-- I'd like to have a user account with my username.

-- As a social network user,
-- So I can write on my timeline,
-- I'd like to create posts associated with my user account.

-- As a social network user,
-- So I can write on my timeline,
-- I'd like each of my posts to have a title and a content.

-- As a social network user,
-- So I can know who reads my posts,
-- I'd like each of my posts to have a number of views.

-- Table: user_account

-- Columns:
-- id | username | post | email | 

-- Table: post

-- Columns:
-- id | title | content | views | 

DROP TABLE IF EXISTS "public"."posts";
CREATE SEQUENCE IF NOT EXISTS posts_id_seq;


DROP TABLE IF EXISTS "public"."user_accounts";

CREATE SEQUENCE IF NOT EXISTS user_accounts_id_seq;



CREATE TABLE "public"."user_accounts"(
  id SERIAL,
  username text,
  email text,
  PRIMARY KEY ("id")
);

CREATE TABLE "public"."posts"(
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  post_id int,
  constraint fk_user_accounts foreign key(post_id) references user_accounts(id)
);

INSERT INTO "public"."user_accounts"("username", "email") VALUES
('Joseph', 'joseph@mail.com'),
('Colin', 'colin@anothermail.com'),
('Joe','joe@mail.co.uk');

INSERT INTO  "public"."posts"("title","content") VALUES
('Joseph first post!','This is content'),
('Joseph second post','This is content'),
('Colin posting', 'This is content'),
('Joe post now', 'This is content');