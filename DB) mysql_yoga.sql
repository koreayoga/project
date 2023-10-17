CREATE USER yoga IDENTIFIED BY 'yoga';
GRANT CREATE, SELECT, INSERT, UPDATE, DELETE ON *.* TO yoga;


CREATE TABLE member (
    userid VARCHAR(100) NOT NULL,
    userpw VARCHAR(500) NOT NULL,
    name VARCHAR(100) NOT NULL,
    birth DATE NOT NULL,
    phone VARCHAR(100) NOT NULL,
    address VARCHAR(500) NOT NULL,
    enabled CHAR(1) DEFAULT 'Y' NOT NULL,
    auth INT DEFAULT '3' NOT NULL,
    gender CHAR(1) DEFAULT 'F' NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (userid),
    UNIQUE KEY (name)
);

CREATE TABLE lesson (
    lnum INT NOT NULL AUTO_INCREMENT,
    ccode VARCHAR(100) NOT NULL,
    userid VARCHAR(100) NOT NULL,
    PRIMARY KEY (lnum),
    FOREIGN KEY (ccode) REFERENCES course (ccode),
    FOREIGN KEY (userid) REFERENCES member (userid)
);

CREATE TABLE course (
    ccode VARCHAR(100) NOT NULL,
    cname VARCHAR(100) NOT NULL,
    camount INT NOT NULL,
    cenabled CHAR(1) DEFAULT 'Y' NOT NULL,
    croom VARCHAR(100) NOT NULL,
    ctime VARCHAR(100) NOT NULL,
    cteacher VARCHAR(100) NOT NULL,
    PRIMARY KEY (ccode)
);

CREATE TABLE tbl_board (
    bno INT NOT NULL AUTO_INCREMENT,
    userid VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    hit INT DEFAULT 0 NOT NULL,
    regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    replyCnt INT DEFAULT 0,
    PRIMARY KEY (bno),
    FOREIGN KEY (userid) REFERENCES member (userid)
);

CREATE TABLE tbl_reply (
    rno INT NOT NULL AUTO_INCREMENT,
    bno INT NOT NULL,
    reply VARCHAR(1000) NOT NULL,
    replyer VARCHAR(50) NOT NULL,
    replydate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (rno),
    FOREIGN KEY (bno) REFERENCES tbl_board (bno)
);

CREATE TABLE tbl_attach (
    uuid VARCHAR(500) NOT NULL,
    bno INT NOT NULL,
    uploadPath VARCHAR(200) NOT NULL,
    filename VARCHAR(100) NOT NULL,
    filetype VARCHAR(100) DEFAULT 'I' NOT NULL,
    PRIMARY KEY (uuid),
    FOREIGN KEY (bno) REFERENCES tbl_board (bno)
);

CREATE TABLE persistentLogin (
    series VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    token VARCHAR(100) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);
