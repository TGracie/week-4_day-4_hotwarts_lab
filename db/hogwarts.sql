DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students;

CREATE TABLE houses(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  student_id INT4 REFERENCES students(id) ON DELETE CASCADE,
  url  VARCHAR(255)
);

CREATE TABLE students (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  house VARCHAR(255),
  age INT2
);

-- Students need a house id not the other way round as the students are the many the house is the 1
--  could add alumni/ teachers table 
