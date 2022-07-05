-- As a person who loves movies,
-- So I can list all my favourite movies
-- I want to see a list of movies' titles.

-- As a person who loves movies,
-- So I can list all my favourite movies
-- I want to see a list of movies' genres.

-- As a person who loves movies,
-- So I can list all my favourite movies
-- I want to see a list of movies' release year.

-- table- favourite_movies
-- columns- title, genre, release_year

CREATE TABLE favourite_movies(
  id SERIAL PRIMARY KEY,
  title text,
  genre text,
  release_year int
);