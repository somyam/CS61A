CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name AS name, s.size AS size FROM dogs as a, sizes as s WHERE a.height <= s.max AND a.height > s.min;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT p.child FROM parents as p, dogs as d WHERE p.parent = d.name ORDER BY - d.height;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child AS sib_1, b.child AS sib_2 FROM parents AS a, parents as b WHERE a.child < b.child and a.parent = b.parent;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT s.sib_1 || " and " || s.sib_2 || " are " || sizing_1.size || " siblings" FROM siblings as s, size_of_dogs as sizing_1, size_of_dogs as sizing_2 WHERE s.sib_1 = sizing_1.name AND s.sib_2 = sizing_2.name AND sizing_1.size = sizing_2.size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here
INSERT INTO stacks_helper SELECT name, height, height FROM dogs;
INSERT INTO stacks_helper(dogs, stack_height, last_height) SELECT dogs || ", " || name, stack_height + height, height FROM dogs, stacks_helper WHERE height > last_height;
INSERT INTO stacks_helper(dogs, stack_height, last_height) SELECT dogs || ", " || name, stack_height + height, height FROM dogs, stacks_helper WHERE height > last_height;
INSERT INTO stacks_helper(dogs, stack_height, last_height) SELECT dogs || ", " || name, stack_height + height, height FROM dogs, stacks_helper WHERE height > last_height;

CREATE TABLE stacks AS
  SELECT dogs, stack_height FROM stacks_helper WHERE stack_height >= 170 ORDER BY stack_height;
