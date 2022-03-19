-- SQL TASK: Create new SQL table called Persons with 4 columns:
      #ID, person name, birth date, and phone

CREATE TABLE db_sql_tutorial.persons(
id INT PRIMARY KEY AUTO_INCREMENT,
person_name VARCHAR(40) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL UNIQUE  
)

-- SQL TASK: Add new column called email to table persons
ALTER TABLE persons
ADD email VARCHAR(50) UNIQUE NOT NULL

-- SQL TASK: Delete the new table Persons from database 
DROP TABLE persons


