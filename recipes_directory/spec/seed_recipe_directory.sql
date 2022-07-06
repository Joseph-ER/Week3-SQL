-- As a food lover,
-- So I can stay organised and decide what to cook,
-- I'd like to keep a list of all my recipes with their names.

-- As a food lover,
-- So I can stay organised and decide what to cook,
-- I'd like to keep the average cooking time (in minutes) for each recipe.

-- As a food lover,
-- So I can stay organised and decide what to cook,
-- I'd like to give a rating to each of the recipes (from 1 to 5).

-- table- recipes
-- columns- 
--- recipe_id (serial primary key), name (text), cooking_time (int or float?), rating (int)

-- CREATE TABLE recipes (
--   id SERIAL PRIMARY KEY,
--   name text,
--   cooking_time int,
--   rating int
-- );

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, cooking_time, rating) VALUES ('Rice', 10, 2);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Pad Thai', 60, 5);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Dahl', 40, 3);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Sandwich', 10, 2);