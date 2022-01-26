DROP TABLE IF EXISTS nflplayers;

CREATE TABLE nflplayers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lastname TEXT,
    firstname TEXT,
    position TEXT,
    week INTEGER,
    fantasypoints FLOAT,
    injured BOOLEAN,
    image_url TEXT
);

INSERT INTO nflplayers (lastname, firstname, position, week, fantasypoints, injured, image_url)
    VALUES (
    "Rodgers",
    "Aaron",
    "QB",
    1,
    20.7,
    1,
    "http//www.placekitten.com/150/150"
);

INSERT INTO nflplayers (lastname, firstname, position, week, fantasypoints, injured, image_url)
    VALUES (
    "McCaffrey", 
    "Christian",
    "RB",
    1,
    0,
    0,
    "http//www.placekitten.com/200/200"
);

INSERT INTO nflplayers (lastname, firstname, position, week, fantasypoints, injured, image_url)
    VALUES (
    "Kupp",
    "Cooper",
    "WR",
    1,
    26.2,
    1,
    "http//www.placekitten.com/300/300"
);

-- QUESTION: why didnt sqlite3 database.db "SELECT id, lastname, firstname FROM nflplayers;" return anything? Just says loading resources from /.sqliterc