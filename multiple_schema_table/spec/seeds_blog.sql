-- As a blogger
-- So I can write interesting stuff
-- I want to write posts having a title.

-- As a blogger
-- So I can write interesting stuff
-- I want to write posts having a content.

-- As a blogger
-- So I can let people comment on interesting stuff
-- I want to allow comments on my posts.

-- As a blogger
-- So I can let people comment on interesting stuff
-- I want the comments to have a content.

-- As a blogger
-- So I can let people comment on interesting stuff
-- I want the author to include their name in comments.


-- table name- posts
-- columns- title(text), content(), comment_id(int), 

-- table name-comment
-- columns- content(text), commentor(text)
DROP TABLE IF EXISTS "public"."comments";
CREATE SEQUENCE IF NOT EXISTS id_seq;
DROP TABLE IF EXISTS "public"."posts";
CREATE SEQUENCE IF NOT EXISTS posts_id_seq;


CREATE TABLE posts(
  id SERIAL,
  title text,
  content text,
  PRIMARY KEY ("id")
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  comment text,
  commentor text,
  comment_id int,
  constraint fk_posts foreign key(comment_id) references posts(id)
);

INSERT INTO "public"."posts"("title", "content") VALUES
('First post!', 'This is my first post'),
('Second attempt at a post!', 'Not much to say in the comment'),
('Daniel making a post!', 'Title says it all');

INSERT INTO  "public"."comments"("comment", "commentor","comment_id") VALUES
('Nice work Joe', 'Daniel', 1),
('Not bad Joe', 'Daniel', 2),
('Great one Dan','Joe', 3),
('Yeah Dan!', 'Hannah', 3),
('Go Dan!', 'Toby', 3);

