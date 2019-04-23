
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL
);



CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);



CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);



CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Ben', 'Gao'),
    ('Jon', 'Doe'),
    ('Jane', 'Doe');  

INSERT INTO 
    questions (title, body, user_id)
VALUES
    ('How to create ORM using SQLite3?','I am learning ORM and do not know how to create a connection to database.', (SELECT id FROM users WHERE users.fname = 'Ben' AND users.lname = 'Gao')),
    ('Does anyone else have this problem with SQLzoo?','The terminal is not reading my query correctly, it is telling me the GROUP BY statement is wrong. ', (SELECT id FROM users WHERE users.fname = 'Jon' AND users.lname = 'Doe')),
    ('Who ate my sandwhich?','I was really looking forward to this sandwhich all day, now I am mad >:|', (SELECT id FROM users WHERE users.fname = 'Jane' AND users.lname = 'Doe')),
    ('What is Life?','I''ve wondering that all day.', (SELECT id FROM users WHERE users.fname = 'Ben' AND users.lname = 'Gao'));

INSERT INTO
    question_follows (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE users.fname = 'Ben' AND users.lname = 'Gao'), (SELECT id FROM questions WHERE questions.title LIKE 'How%')),
    ((SELECT id FROM users WHERE users.fname = 'Ben' AND users.lname = 'Gao'), (SELECT id FROM questions WHERE questions.title LIKE 'Who%')),
    ((SELECT id FROM users WHERE users.fname = 'Jon' AND users.lname = 'Doe'), (SELECT id FROM questions WHERE questions.title LIKE 'Does%')),
    ((SELECT id FROM users WHERE users.fname = 'Jane' AND users.lname = 'Doe'), (SELECT id FROM questions WHERE questions.title LIKE 'Who%'));

INSERT INTO
    replies (body, question_id, parent_id, user_id)
VALUES
    ('See ORM exercise on App Academy Open', (SELECT id FROM questions WHERE questions.title LIKE "How%"),NULL,(SELECT id FROM users WHERE users.fname = 'Jon' AND users.lname = 'Doe')),
    ('No, I think it is just you.', (SELECT id FROM questions WHERE questions.title LIKE "Does%"),NULL,(SELECT id FROM users WHERE users.fname = 'Jane' AND users.lname = 'Doe'));

INSERT INTO
    question_likes (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE questions.title LIKE 'How%'), (SELECT id FROM users WHERE users.fname = 'Jane' AND users.lname = 'Doe')),
    ((SELECT id FROM questions WHERE questions.title LIKE 'What%'), (SELECT id FROM users WHERE users.fname = 'Jane' AND users.lname = 'Doe')),
    ((SELECT id FROM questions WHERE questions.title LIKE 'What%'), (SELECT id FROM users WHERE users.fname = 'Jon' AND users.lname = 'Doe')),
    ((SELECT id FROM questions WHERE questions.title LIKE 'Who%'), (SELECT id FROM users WHERE users.fname = 'Ben' AND users.lname = 'Gao'));
