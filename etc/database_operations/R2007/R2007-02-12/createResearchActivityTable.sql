DROP TABLE IF EXISTS RESEARCH_ACTIVITY;

CREATE TABLE `RESEARCH_ACTIVITY` (
  `ID_INTERNAL` int(11) NOT NULL auto_increment,
  `NAME` longtext NOT NULL,
  `OJB_CONCRETE_CLASS` VARCHAR(255) NOT NULL,
  `LOCATION_TYPE` VARCHAR(255),
  `EVENT_TYPE` VARCHAR(255),
  `EVENT_LOCATION` VARCHAR(255),
  `START_DATE` VARCHAR(255),
  `END_DATE` VARCHAR(255),
  `COOPERATION_TYPE` VARCHAR(255),
  `KEY_UNIT` int(11),
  `KEY_ROOT_DOMAIN_OBJECT` int(11) NOT NULL default '1',

  PRIMARY KEY  (`ID_INTERNAL`),
  KEY `KEY_UNIT` (`KEY_UNIT`),
  KEY `KEY_ROOT_DOMAIN_OBJECT` (`KEY_ROOT_DOMAIN_OBJECT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS RESEARCH_ACTIVITY_PARTICIPATION;

CREATE TABLE `RESEARCH_ACTIVITY_PARTICIPATION` (
  `ID_INTERNAL` int(11) NOT NULL auto_increment,
  `ROLE` varchar(255) NOT NULL,
  `KEY_ROOT_DOMAIN_OBJECT` int(11) NOT NULL default '1',
  `KEY_PARTY` int(11) NOT NULL ,
  `KEY_RESEARCH_ACTIVITY` int(11) NOT NULL ,

  PRIMARY KEY  (`ID_INTERNAL`),
  KEY `KEY_ROOT_DOMAIN_OBJECT` (`KEY_ROOT_DOMAIN_OBJECT`),
  KEY `KEY_PARTY` (`KEY_PARTY`),
  KEY `KEY_RESEARCH_ACTIVITY` (`KEY_RESEARCH_ACTIVITY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


