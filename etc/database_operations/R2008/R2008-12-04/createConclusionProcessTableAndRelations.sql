alter table CURRICULUM_MODULE add column KEY_CONCLUSION_PROCESS int(11);
alter table CURRICULUM_MODULE add index (KEY_CONCLUSION_PROCESS);
alter table REGISTRATION add column KEY_CONCLUSION_PROCESS int(11);
alter table REGISTRATION add index (KEY_CONCLUSION_PROCESS);

create table CONCLUSION_PROCESS (
  `ID_INTERNAL` int(11) NOT NULL auto_increment,
  `KEY_ROOT_DOMAIN_OBJECT` int(11) NOT NULL DEFAULT '1',
  `OJB_CONCRETE_CLASS` text NOT NULL,
  `KEY_CONCLUSION_YEAR` int(11) NOT NULL,
  `KEY_CYCLE` int(11),
  `KEY_REGISTRATION` int(11),
  primary key (ID_INTERNAL),
  index (KEY_ROOT_DOMAIN_OBJECT),
  index (KEY_CONCLUSION_YEAR),
  index (KEY_CYCLE),
  index (KEY_REGISTRATION)
) type=InnoDB ;

create table CONCLUSION_PROCESS_VERSION (
  `ID_INTERNAL` int(11) NOT NULL auto_increment,
  `KEY_ROOT_DOMAIN_OBJECT` int(11) NOT NULL DEFAULT '1',
  `CREATION_DATE_TIME` DATETIME NOT NULL,
  `CONCLUSION_DATE` varchar(10) NOT NULL,
  `FINAL_AVERAGE` tinyint(2) NOT NULL,
  `AVERAGE` text NOT NULL,
  `CREDITS` text NOT NULL,
  `CURRICULUM` text NOT NULL,
  `NOTES` text,
  `KEY_CONCLUSION_PROCESS` int(11) NOT NULL,
  `KEY_RESPONSIBLE` int(11),
  `KEY_INGRESSION_YEAR` int(11) NOT NULL,
  `KEY_CONCLUSION_YEAR` int(11) NOT NULL,
  `KEY_DISSERTATION_ENROLMENT` int(11),
  `KEY_MASTER_DEGREE_THESIS` int(11),
  primary key (ID_INTERNAL),
  index (KEY_ROOT_DOMAIN_OBJECT),
  index (KEY_CONCLUSION_PROCESS),
  index (KEY_RESPONSIBLE),
  index (KEY_INGRESSION_YEAR),
  index (KEY_CONCLUSION_YEAR),
  index (KEY_DISSERTATION_ENROLMENT),
  index (KEY_MASTER_DEGREE_THESIS)
) type=InnoDB ;
