-- As a coach
-- So I can get to know all students
-- I want to see a list of students' names.

-- As a coach
-- So I can get to know all students
-- I want to see a list of cohorts' names.

-- As a coach
-- So I can get to know all students
-- I want to see a list of cohorts' starting dates.

-- As a coach
-- So I can get to know all students
-- I want to see a list of students' cohorts.

--table name- students
-- columns- id(SPK), name(text), cohort(text)

--table name- cohorts
-- columns- name(text), start_date(text)
DROP TABLE IF EXISTS "public"."students";
DROP TABLE IF EXISTS "public"."cohorts";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type


CREATE TABLE cohorts(
  id SERIAL PRIMARY KEY,
  cohort text,
  start_date text
);

CREATE TABLE students(
  id SERIAL PRIMARY KEY,
  name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id) references cohorts(id)
);




-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
-- CREATE TABLE artists (
--   id SERIAL PRIMARY KEY,
--   name text,
-- );

-- -- Then the table with the foreign key first.
-- CREATE TABLE albums (
--   id SERIAL PRIMARY KEY,
--   title text,
--   release_year int,
-- -- The foreign key name is always {other_table_singular}_id
--   artist_id int,
--   constraint fk_artist foreign key(artist_id) references artists(id)
-- );
