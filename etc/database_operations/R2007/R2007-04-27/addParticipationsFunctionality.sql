INSERT INTO `ACCESSIBLE_ITEM` (`OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `VISIBLE`, `KEY_SITE`, `SECTION_ORDER`, `KEY_FUNCTIONALITY`) 
	SELECT 'net.sourceforge.fenixedu.domain.FunctionalitySection', 1, 1, -1, 5, AI.ID_INTERNAL
	FROM `ACCESSIBLE_ITEM` AS AI WHERE AI.UUID = '405b9767-a4d7-4bd7-93ec-00fe1e21d941';
	
UPDATE `ACCESSIBLE_ITEM` AS AI, `SITE` AS S
	SET AI.`KEY_SITE` = S.`ID_INTERNAL`
	WHERE AI.`OJB_CONCRETE_CLASS` LIKE 'net.sourceforge.fenixedu.domain.FunctionalitySection'
		AND AI.`KEY_SITE` = -1
		AND S.`OJB_CONCRETE_CLASS` LIKE 'net.sourceforge.fenixedu.domain.SiteTemplate'
		AND S.`SITE_TYPE` LIKE 'net.sourceforge.fenixedu.domain.homepage.Homepage';


