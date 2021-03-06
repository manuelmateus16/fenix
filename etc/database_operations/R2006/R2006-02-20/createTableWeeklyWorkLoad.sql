create table WEEKLY_WORK_LOAD (
	ID_INTERNAL int(11) NOT NULL auto_increment,
	KEY_ATTENDS int(11) NOT NULL,
	WEEK_OFFSET int(11) NOT NULL,
	CONTACT int(11) default NULL,
	AUTONOMOUS_STUDY int(11) default NULL,
	OTHER int(11) default NULL,
	PRIMARY KEY (ID_INTERNAL),
	UNIQUE (KEY_ATTENDS, WEEK_OFFSET)
) TYPE=InnoDB;
