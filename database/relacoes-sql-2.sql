-- Active: 1673873946987@@127.0.0.1@3306

-- Práticas

CREATE TABLE users (
 id PRIMARY KEY UNIQUE NOT NULL,
 name TEXT NOT NULL,
 email TEXT UNIQUE NOT NULL,
 password TEXT NOT NULL,
 create_at  TEXT DEFAULT (DATETIME()) NOT NULL

);

INSERT INTO users (id, name, email, password)
VALUES
   ("U001", "FUlana", "fulana@gmail.com", "fulana123"),
   ("U002", "Ciclano", "ciclano@gmail.com", "cliclano99"),
   ("U003", "Beltrano", "beltrano@gmail.com", "beltrano00");


   SELECT *FROM users;

   ---Pratica 2

   CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followed_id) REFERENCES users (id)

   );


  INSERT INTO follows (follower_id, followed_id)
  VALUES
     ("U001", "u002"),  --pessoa A segue B
     ("U001", "u003"),  -- pessoa A segue c
     ("U002", "u001");  --pessoa B segue A



  SELECT *FROM follows;
  
  -- Mostra somente quem está seguindo


  SELECT *FROM follows
  RIGHT JOIN users
  ON follows.follower_id = users.id;

-- Prática 3

-- Mostra quem está seguindo e quem não seguiu
-- A = follows e B = users , portanto RIGHT JOIN
SELECT * FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id;

-- Tb Mostra quem está seguindo e quem não seguiu,
-- mas muda a perspectiva A e B
-- A = users e B = follows , portanto LEFT JOIN
SELECT * FROM users
LEFT JOIN follows
ON follows.follower_id = users.id;

-- Mostrando os dados da pessoa q foi seguida
SELECT
    follows.follower_id AS followerId,
    follows.followed_id AS followedId,
    users.name AS followerName,
    followedUsers.name AS followedName,
    users.email AS followerEmail
FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id
LEFT JOIN users AS followedUsers
ON follows.followed_id = followedUsers.id;

  