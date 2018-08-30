-- ************************************************************
-- Sequel Pro SQL dump
-- Version 4541
--
-- http://www.sequelpro.com/
-- https://github.com/sequelpro/sequelpro
-- ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Export von Tabelle author
-- ------------------------------------------------------------

DROP TABLE IF EXISTS author;

CREATE SEQUENCE author_seq;

CREATE TABLE author (
  id int check (id > 0) NOT NULL DEFAULT NEXTVAL ('author_seq'),
  firstname varchar(255) NOT NULL DEFAULT '',
  lastname varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
) ;

/*!40000 ALTER TABLE `author` DISABLE KEYS */;

INSERT INTO author (id, firstname, lastname)
VALUES
    (1,'Walter','White'),
    (2,'Jesse','Pinkman');

/*!40000 ALTER TABLE `author` ENABLE KEYS */;


-- Export von Tabelle post
-- ------------------------------------------------------------

DROP TABLE IF EXISTS post;

CREATE SEQUENCE post_seq;

CREATE TABLE post (
  id int check (id > 0) NOT NULL DEFAULT NEXTVAL ('post_seq'),
  text text NOT NULL,
  created_at timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  author_id int check (author_id > 0) NOT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT post_ibfk_1 FOREIGN KEY (author_id) REFERENCES author (id) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX post_author_id ON post (author_id);

/*!40000 ALTER TABLE `post` DISABLE KEYS */;

INSERT INTO post (id, text, created_at, author_id)
VALUES
    (1,'Say my name.','2018-07-17 15:27:43',1),
    (2,'Yeah, Mr. White! Yeah, Science!','2018-07-17 15:27:58',2),
    (3,'I won.','2018-07-17 15:28:27',1),
    (4,'I am the one who knocks.','2018-07-17 15:28:57',1);

/*!40000 ALTER TABLE `post` ENABLE KEYS */;


-- Export von Tabelle comment
-- ------------------------------------------------------------

DROP TABLE IF EXISTS comment;

CREATE SEQUENCE comment_seq;

CREATE TABLE comment (
  id int check (id > 0) NOT NULL DEFAULT NEXTVAL ('comment_seq'),
  text text,
  created_at timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  post_id int check (post_id > 0) NOT NULL,
  author_id int check (author_id > 0) NOT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT comment_ibfk_1 FOREIGN KEY (post_id) REFERENCES post (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT comment_ibfk_2 FOREIGN KEY (author_id) REFERENCES author (id) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX comment_post_id ON comment (post_id);
CREATE INDEX comment_author_id ON comment (author_id);

/*!40000 ALTER TABLE `comment` DISABLE KEYS */;

INSERT INTO comment (id, text, created_at, post_id, author_id)
VALUES
    (1,'Heisenberg!','2018-07-17 15:31:06',1,2);

/*!40000 ALTER TABLE `comment` ENABLE KEYS */;






/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
