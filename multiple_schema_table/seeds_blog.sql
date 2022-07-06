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

DROP TABLE IF EXISTS "public"."posts";
DROP TABLE IF EXISTS "public"."comments";

CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  title text,
  content text
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  comment text,
  commentor text,
  post_id int,
  constraint fk_posts foreign key(post_id) references posts(id)
);