DROP TABLE IF EXISTS STUDENT_STATUTE;
CREATE TABLE STUDENT_STATUTE (
  ID_INTERNAL int(11) unsigned NOT NULL auto_increment,
  KEY_STUDENT int(11) NOT NULL,
  STATUTE_TYPE VARCHAR(255) NOT NULL,
  KEY_BEGIN_EXECUTION_PERIOD int(11),
  KEY_END_EXECUTION_PERIOD int(11),
  KEY_ROOT_DOMAIN_OBJECT int(11) NOT NULL default '1',
  PRIMARY KEY  (ID_INTERNAL),
  KEY (KEY_ROOT_DOMAIN_OBJECT),
  KEY (KEY_STUDENT)
) ENGINE=InnoDB;
