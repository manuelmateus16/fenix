ALTER TABLE EXTRA_WORK_REQUEST CHANGE KEY_WORKING_UNIT KEY_UNIT  int(11) NOT NULL;  
ALTER TABLE EXTRA_WORK_REQUEST CHANGE `SUNDAY_HOURAS` SUNDAY_HOURS int(11) default NULL;
ALTER TABLE EXTRA_WORK_REQUEST DROP key u1;
ALTER TABLE EXTRA_WORK_REQUEST CHANGE `YEAR_MONTH` PARTIAL_DATE text NOT NULL;