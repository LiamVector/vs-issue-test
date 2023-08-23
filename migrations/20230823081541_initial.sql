CREATE TABLE IF NOT EXISTS info (
    infoid INTEGER PRIMARY KEY,
    dataversion INTEGER NOT NULL,
    scanversion INTEGER NOT NULL,
    scandate DATE
);
CREATE TABLE IF NOT EXISTS crashes (
    reportid INTEGER PRIMARY KEY,
    userid INTEGER,
    platform TEXT,
    version TEXT,
    vernum INTEGER,
    mmoname TEXT,
    reportdate TIMESTAMPTZ NOT NULL,
    reporttime TEXT,
    aser TEXT,
    cond TEXT,
    location TEXT,
    cpu TEXT,
    ram TEXT,
    gpu TEXT,
    gpuver TEXT,
    diskavail INTEGER,
    modded BOOL,
    recognized TEXT,
    stack TEXT,
    loglines TEXT
);
CREATE INDEX ver ON crashes(vernum);
CREATE INDEX usr ON crashes(userid);
CREATE INDEX date ON crashes(reportdate);
CREATE TABLE IF NOT EXISTS users (
    userid INTEGER PRIMARY KEY,
    steamid INTEGER NOT NULL UNIQUE
);
CREATE UNIQUE INDEX steam ON users(steamid);
CREATE TABLE IF NOT EXISTS functions (
    functid INTEGER PRIMARY KEY,
    function TEXT NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS conditions (
    condid INTEGER PRIMARY KEY,
    cond TEXT NOT NULL,
    location TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS issues (
    issueid INTEGER PRIMARY KEY,
    stack1 INTEGER NOT NULL,
    stack2 INTEGER NOT NULL,
    stack3 INTEGER NOT NULL,
    condition INTEGER,
    FOREIGN KEY(stack1) REFERENCES functions(functid),
    FOREIGN KEY(stack2) REFERENCES functions(functid),
    FOREIGN KEY(stack3) REFERENCES functions(functid),
    FOREIGN KEY(condition) REFERENCES conditions(condid)
);
