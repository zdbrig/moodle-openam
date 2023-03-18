CREATE DATABASE IF NOT EXISTS moodle;
GRANT ALL PRIVILEGES ON moodle.* TO 'moodle_user'@'%' IDENTIFIED BY 'moodle_password';
FLUSH PRIVILEGES;

USE moodle;

-- Create Moodle tables
-- Replace <prefix> with the prefix defined in the Moodle config.php file
-- You can use any prefix you want as long as it matches the config.php file
CREATE TABLE IF NOT EXISTS <prefix>config (
  name VARCHAR(255) NOT NULL DEFAULT '',
  value TEXT NOT NULL,
  CONSTRAINT PRIMARY KEY (name)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS <prefix>user (
  id BIGINT(10) NOT NULL AUTO_INCREMENT,
  auth VARCHAR(20) NOT NULL DEFAULT 'manual',
  confirmed TINYINT(1) NOT NULL DEFAULT 0,
  policyagreed TINYINT(1) NOT NULL DEFAULT 0,
  deleted TINYINT(1) NOT NULL DEFAULT 0,
  mnethostid BIGINT(10) NOT NULL DEFAULT 0,
  username VARCHAR(100) NOT NULL DEFAULT '',
  password VARCHAR(100) NOT NULL DEFAULT '',
  firstname VARCHAR(100) NOT NULL DEFAULT '',
  lastname VARCHAR(100) NOT NULL DEFAULT '',
  email VARCHAR(100) NOT NULL DEFAULT '',
  emailstop TINYINT(1) NOT NULL DEFAULT 0,
  city VARCHAR(120) NOT NULL DEFAULT '',
  country VARCHAR(2) NOT NULL DEFAULT '',
  lang VARCHAR(30) NOT NULL DEFAULT '',
  timezone VARCHAR(100) NOT NULL DEFAULT '',
  lastaccess BIGINT(10) NOT NULL DEFAULT 0,
  lastlogin BIGINT(10) NOT NULL DEFAULT 0,
  currentlogin BIGINT(10) NOT NULL DEFAULT 0,
  lastip VARCHAR(45) NOT NULL DEFAULT '',
  secret VARCHAR(32) NOT NULL DEFAULT '',
  picture VARCHAR(100) NOT NULL DEFAULT '',
  url VARCHAR(255) NOT NULL DEFAULT '',
  description LONGTEXT NOT NULL,
  mailformat TINYINT(1) NOT NULL DEFAULT 1,
  maildigest TINYINT(1) NOT NULL DEFAULT 0,
  maildisplay TINYINT(2) NOT NULL DEFAULT 2,
  htmleditor TINYINT(1) NOT NULL DEFAULT 1,
  ajax TINYINT(1) NOT NULL DEFAULT 1,
  autosubscribe TINYINT(1) NOT NULL DEFAULT 1,
  trackforums TINYINT(1) NOT NULL DEFAULT 0,
  timemodified BIGINT(10) NOT NULL DEFAULT 0,
  trustbitmask INT(10) NOT NULL DEFAULT 0,
  imagealt TEXT NOT NULL,
  lastnamephonetic VARCHAR(100) NOT NULL DEFAULT '',
  firstnamephonetic VARCHAR(100) NOT NULL DEFAULT '',
  middlename VARCHAR(100) NOT NULL DEFAULT '',
  alternatename VARCHAR(100) NOT NULL DEFAULT '',
  CONSTRAINT PRIMARY KEY (id),
  UNIQUE KEY username (username),
  KEY user_mne_uix (mnethostid, username),
  KEY user_mne_cix (confirmed, mnethostid, deleted, email)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Create additional tables if needed
-- For example, to enable PostgreSQL full-text search, run the following SQL statement
-- CREATE EXTENSION IF NOT EXISTS pg_trgm;
