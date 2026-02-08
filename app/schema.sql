DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS admins;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE NOT NULL,
    password TEXT,
    firstName TEXT,
    lastName TEXT
);

CREATE TABLE admins (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE NOT NULL,
    password TEXT,
    firstName TEXT,
    lastName TEXT
);

CREATE TABLE courses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    description TEXT,
    price REAL,
    imageUrl TEXT,
    creatorId INTEGER,
    FOREIGN KEY (creatorId) REFERENCES admins(id)
);

CREATE TABLE purchases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    userId INTEGER,
    courseId INTEGER,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (courseId) REFERENCES courses(id)
);

