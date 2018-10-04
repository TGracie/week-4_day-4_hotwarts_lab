DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  house VARCHAR(255),
  age INT2
);

CREATE TABLE houses(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  student_id INT4 REFERENCES students(id) ON DELETE CASCADE,
  url  VARCHAR(255)
);
