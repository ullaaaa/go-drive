-- DDL

CREATE TABLE drives
(
    name   VARCHAR
        PRIMARY KEY,
    type   VARCHAR NOT NULL,
    config VARCHAR NOT NULL
);

CREATE TABLE groups
(
    name VARCHAR
        PRIMARY KEY
);

CREATE TABLE path_permissions
(
    path       VARCHAR,
    subject    VARCHAR NOT NULL,
    permission INTEGER NOT NULL,
    policy     INTEGER NOT NULL,
    depth      INTEGER NOT NULL,
    PRIMARY KEY (path, subject)
);

CREATE TABLE user_groups
(
    group_name VARCHAR,
    username   VARCHAR,
    PRIMARY KEY (group_name, username)
);

CREATE TABLE users
(
    username VARCHAR
        PRIMARY KEY,
    password VARCHAR NOT NULL
);

-- Init data

INSERT INTO users(username, password)
VALUES ('admin', '$2y$10$Xqn8qV2D2KY2ceI5esM/JOiKTPKJFbkSzzuhce89BxygvCqnhyk3m');
-- 123456

INSERT INTO groups(name)
VALUES ('admin');

INSERT INTO user_groups(username, group_name)
VALUES ('admin', 'admin');

INSERT INTO path_permissions(path, subject, permission, policy, depth)
VALUES ('', 'ANY', 1, 1, 0);
INSERT INTO path_permissions(path, subject, permission, policy, depth)
VALUES ('', 'g:admin', 3, 1, 0);
