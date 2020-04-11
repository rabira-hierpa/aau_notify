CREATE TABLE comments (
	cid  int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    uid varchar(128) NOT NULL,
    date DATETIME NOT NULL,
    message  TEXT NOT NULL
);
CREATE TABLE user (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
		usrname  varchar(128) NOT NULL,
    passkey varchar(128) NOT NULL
);
