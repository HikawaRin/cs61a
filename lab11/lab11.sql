.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = 'blue' and pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = 'blue' and pet = 'dog';


CREATE TABLE smallest_int_having AS
  SELECT time, MIN(smallest) FROM students GROUP BY smallest Having COUNT(smallest) = 1;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students AS a, students AS b
  WHERE a.time < b.time and a.pet = b.pet and a.song = b.song;

