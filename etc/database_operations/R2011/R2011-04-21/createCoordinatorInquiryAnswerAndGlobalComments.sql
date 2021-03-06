alter table `INQUIRY_ANSWER` drop LAST_MODIFIED_DATE, add `OID_COORDINATOR` bigint unsigned;
alter table `INQUIRY_ANSWER` add `OID_EXECUTION_SEMESTER` bigint unsigned;
alter table `INQUIRY_ANSWER` add index (OID_EXECUTION_SEMESTER), add index (OID_COORDINATOR);
create table `INQUIRY_GLOBAL_COMMENT` (`COMMENT_ON_TEACHER` tinyint(1), `OID` bigint unsigned, `OID_TEACHER` bigint unsigned, `OID_EXECUTION_SEMESTER` bigint unsigned, `OID_EXECUTION_DEGREE` bigint unsigned, `OID_EXECUTION_COURSE` bigint unsigned, `OID_ROOT_DOMAIN_OBJECT` bigint unsigned, `ID_INTERNAL` int(11) NOT NULL auto_increment, primary key (ID_INTERNAL), index (OID), index (OID_TEACHER), index (OID_EXECUTION_SEMESTER), index (OID_EXECUTION_DEGREE), index (OID_EXECUTION_COURSE), index (OID_ROOT_DOMAIN_OBJECT)) ENGINE=InnoDB, character set latin1;
alter table `INQUIRY_RESULT_COMMENT` add `OID_INQUIRY_GLOBAL_COMMENT` bigint unsigned, add index (OID_INQUIRY_GLOBAL_COMMENT);
