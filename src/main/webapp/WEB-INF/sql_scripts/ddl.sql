DROP TABLE NOTES;
CREATE TABLE NOTES
(
    id				INT PRIMARY KEY AUTO_INCREMENT,
    author			VARCHAR(30),
    email	   		VARCHAR(30),
    date_created    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    content			VARCHAR(4096)
);