alter table LIBRARY_CARD add column CARD_EMITION_DATE timestamp NULL default NULL;
alter table LIBRARY_CARD add column LETTER_GENERATION_DATE timestamp NULL default NULL;

update LIBRARY_CARD set CARD_EMITION_DATE = "2008-01-01 00:00:00" where IS_CARD_EMITED=1;
update LIBRARY_CARD set LETTER_GENERATION_DATE ="2008-01-01 00:00:00" where IS_LETTER_GENERATED=1;




