SELECT @UNIT_ID := ID_INTERNAL FROM PARTY WHERE ACRONYM LIKE '%ACD%';
select @SITE_ID := KEY_SITE FROM PARTY WHERE ID_INTERNAL=@UNIT_ID;

update CONTENT set OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.StudentsSite' WHERE ID_INTERNAL=@SITE_ID;
