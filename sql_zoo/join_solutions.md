### JOIN and UEFA EURO 2012
This tutorial introduces JOIN which allows you to use data from two or more tables. The tables contain all matches and goals from UEFA EURO 2012 Football Championship in Poland and Ukraine.

game
|id|	mdate|	stadium|	team1|	team2|
|--|---------|---------|---------|-------|
|1001|	8 June 2012|	National Stadium, Warsaw|	POL	|GRE|
|1002	|8 June 2012	|Stadion Miejski (Wroclaw)	|RUS	|CZE|
|1003|	12 June 2012|	Stadion Miejski (Wroclaw)|	GRE	|CZE|
|1004	|12 June 2012	|National Stadium, Warsaw	|POL	|RUS|
|...                                                            |


goal
|matchid|	teamid|	player|	gtime|
|-------|---------|--------|------|
|1001|	POL|	Robert Lewandowski|	17|
|1001|	GRE	|Dimitris Salpingidis	|51|
|1002|	RUS	|Alan Dzagoev|	15|
|1002|	RUS	|Roman Pavlyuchenko|	82|
|...                                  |

eteam
|id|	teamname|	coach|
|--|------------|---------|
|POL|	Poland	|Franciszek |Smuda|
|RUS	|Russia	|Dick Advocaat|
|CZE|	Czech Republic|	Michal Bilek|
|GRE	|Greece	|Fernando Santos|
|...                            |


Q1. The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime

Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

```sql
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'
```

Q2. From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.

Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.

Show id, stadium, team1, team2 for just game 1012

```sql
SELECT id,stadium,team1,team2
  FROM game where id=1012
```

Q3. You can combine the two steps into a single query with a JOIN.

```sql
SELECT *
  FROM game JOIN goal ON (id=matchid)
```
The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. (If we wanted to be more clear/specific we could say
ON (game.id=goal.matchid)

The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.

Modify it to show the player, teamid, stadium and mdate for every German goal.

```sql
SELECT player,teamid, stadium, mdate
  FROM goal JOIN game ON game.id=goal.matchid where teamid='GER';
```

Q5. The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id

Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

```sql
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON goal.teamid=eteam.id 
 WHERE gtime<=10
```

Q6. To JOIN game with eteam you could use either
game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)

Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id

List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

```sql
select mdate, teamname from game JOIN eteam ON game.team1=eteam.id where coach like 'Fernando Santos'
```

Q7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'?
```sql
select player from game JOIN goal ON game.id=goal.matchid where stadium like 'National Stadium, Warsaw'
```

### MORE DIFFICULT QUESTIONS

Q8.(TODO) The example query shows all goals scored in the Germany-Greece quarterfinal.
```sql
SELECT player, gtime
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' AND team2='GRE')
```
Instead show the name of all players who scored a goal against Germany.
(Pending)

Q9.Show teamname and the total number of goals scored.

```sql
SELECT teamname, count(gtime)
  FROM goal JOIN eteam ON goal.teamid=eteam.id group by teamname
 ORDER BY teamname
```

Q10.(TODO) Show the stadium and the number of goals scored in each stadium.

Q11.

Problems to be solved - Q4, Q8, Q10, Q11, Q12, Q13