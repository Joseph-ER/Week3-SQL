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
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS cohorts;
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type


CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
  starting_date INT4
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id) references cohorts(id)
);

INSERT INTO "public"."cohorts"("id", "name", "starting_date") VALUES
(1, 'June', 2022),
(2, 'September', 2020);

INSERT INTO  "public"."students"("id","name", "cohort_id") VALUES
(1,'Joe', 1),
(2,'Ahmed', 1),
(3,'Ev', 1),
(4,'paris', 1),
(5, 'Symi', 2),
(6, 'John', 2);

