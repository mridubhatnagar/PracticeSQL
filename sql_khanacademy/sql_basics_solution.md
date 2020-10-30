# SQL Basics Solutions

### Challenge: Box office hits database (Part 2: Querying)

Filter recent movies
Now, add a second query after the first, that retrieves only the movies that were released 
in the year 2000 or later, not before. Sort the results so that the earlier movies are 
listed first. You should have 2 SELECT statements after this step.

```sql
select * from movies;
select * from movies where release_year >= 2000 ORDER BY release_year ASC
```

### Challenge: TODO list database stats

Step 1
Here's a table containing a TODO list with the number of minutes it 
will take to complete each item. Insert another item to your todo list with 
the estimated minutes it will take.

```sql
CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 30);
INSERT INTO todo_list VALUES(4, "Practice sql", 1);
```

Step 2
Select the SUM of minutes it will take to do all of the items on your TODO list. You should only have one SELECT statement.

```sql
select sum(minutes) from todo_list;
```

### Project: Design a store database (solved on interface)