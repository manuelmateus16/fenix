SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO CONTENT (EXECUTION_PATH,VISIBLE,KEY_MODULE_ROOT_DOMAIN_OBJECT,MAXIMIZABLE,PREFIX,KEY_INITIAL_CONTENT,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (null,null,null,null,'/',null,'39c3f7d9-27b3-43d1-a180-6fb101fc1fac','2009-05-04 17:01:29','pt15:vinte_tres_anos','pt17:Vinte e tres anos',null,'pt17:Vinte e tres anos','pt15:vinte_tres_anos',null,null,1,null,'net.sourceforge.fenixedu.domain.functionalities.Module')  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (8,1,1,'3f3bf92b-128b-4894-8a8e-58f98270dd3f:39c3f7d9-27b3-43d1-a180-6fb101fc1fac',1,2,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(1,'39c3f7d9-27b3-43d1-a180-6fb101fc1fac','3f3bf92b-128b-4894-8a8e-58f98270dd3f:39c3f7d9-27b3-43d1-a180-6fb101fc1fac') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(2,'3f3bf92b-128b-4894-8a8e-58f98270dd3f','3f3bf92b-128b-4894-8a8e-58f98270dd3f:39c3f7d9-27b3-43d1-a180-6fb101fc1fac') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (9,1,1,'3f3bf92b-128b-4894-8a8e-58f98270dd3f:5c8e9512-0c1a-4841-a1e7-93599c019a71',3,4,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

INSERT INTO CONTENT (EXECUTION_PATH,VISIBLE,KEY_MODULE_ROOT_DOMAIN_OBJECT,MAXIMIZABLE,PREFIX,KEY_INITIAL_CONTENT,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (null,null,null,null,'/',null,'5c8e9512-0c1a-4841-a1e7-93599c019a71','2009-05-04 17:01:49','pt13:segundo_ciclo','pt13:Segundo Ciclo',null,'pt13:Segundo Ciclo','pt13:segundo_ciclo',null,null,1,null,'net.sourceforge.fenixedu.domain.functionalities.Module')  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(3,'5c8e9512-0c1a-4841-a1e7-93599c019a71','3f3bf92b-128b-4894-8a8e-58f98270dd3f:5c8e9512-0c1a-4841-a1e7-93599c019a71') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(4,'3f3bf92b-128b-4894-8a8e-58f98270dd3f','3f3bf92b-128b-4894-8a8e-58f98270dd3f:5c8e9512-0c1a-4841-a1e7-93599c019a71') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO CONTENT (EXECUTION_PATH,VISIBLE,KEY_EXECUTION_PATH_VALUE,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES ('candidacies/caseHandlingOver23CandidacyIndividualProcess.do?method=prepareCandidacyCreation',null,5,'c18bf081-dd19-4a5c-8d2d-c61a26890851','2009-05-04 17:02:14','pt6:acesso','pt6:Acesso',null,'pt6:Acesso','pt6:acesso',null,null,1,null,'net.sourceforge.fenixedu.domain.functionalities.Functionality')  ;

INSERT INTO EXECUTION_PATH (EXECUTION_PATH,CONTENT_ID,KEY_FUNCTIONALITY,KEY_ROOT_DOMAIN_OBJECT) VALUES ('candidacies/caseHandlingOver23CandidacyIndividualProcess.do?method=prepareCandidacyCreation','3c06a7b0-6205-4397-8ca1-0369c7bf8d66',6,1)  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (0,1,1,'39c3f7d9-27b3-43d1-a180-6fb101fc1fac:c18bf081-dd19-4a5c-8d2d-c61a26890851',7,8,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(5,'TOKEN(EXECUTION_PATH,2554)','c18bf081-dd19-4a5c-8d2d-c61a26890851') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(6,'c18bf081-dd19-4a5c-8d2d-c61a26890851','3c06a7b0-6205-4397-8ca1-0369c7bf8d66') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(7,'c18bf081-dd19-4a5c-8d2d-c61a26890851','39c3f7d9-27b3-43d1-a180-6fb101fc1fac:c18bf081-dd19-4a5c-8d2d-c61a26890851') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(8,'39c3f7d9-27b3-43d1-a180-6fb101fc1fac','39c3f7d9-27b3-43d1-a180-6fb101fc1fac:c18bf081-dd19-4a5c-8d2d-c61a26890851') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO EXECUTION_PATH (EXECUTION_PATH,CONTENT_ID,KEY_FUNCTIONALITY,KEY_ROOT_DOMAIN_OBJECT) VALUES ('candidacies/caseHandlingSecondCycleCandidacyIndividualProcess.do?method=prepareCandidacyCreation','d0a00a97-f759-421f-b74f-6f42258503d9',9,1)  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (0,1,1,'5c8e9512-0c1a-4841-a1e7-93599c019a71:5f7ef6ac-80e8-42cd-ae9b-010a275a3abb',10,11,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

INSERT INTO CONTENT (EXECUTION_PATH,VISIBLE,KEY_EXECUTION_PATH_VALUE,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES ('candidacies/caseHandlingSecondCycleCandidacyIndividualProcess.do?method=prepareCandidacyCreation',null,12,'5f7ef6ac-80e8-42cd-ae9b-010a275a3abb','2009-05-04 17:02:39','pt6:acesso','pt6:Acesso',null,'pt6:Acesso','pt6:acesso',null,null,1,null,'net.sourceforge.fenixedu.domain.functionalities.Functionality')  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(9,'5f7ef6ac-80e8-42cd-ae9b-010a275a3abb','d0a00a97-f759-421f-b74f-6f42258503d9') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(10,'5f7ef6ac-80e8-42cd-ae9b-010a275a3abb','5c8e9512-0c1a-4841-a1e7-93599c019a71:5f7ef6ac-80e8-42cd-ae9b-010a275a3abb') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(11,'5c8e9512-0c1a-4841-a1e7-93599c019a71','5c8e9512-0c1a-4841-a1e7-93599c019a71:5f7ef6ac-80e8-42cd-ae9b-010a275a3abb') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(12,'d0a00a97-f759-421f-b74f-6f42258503d9','5f7ef6ac-80e8-42cd-ae9b-010a275a3abb') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO CONTENT (ENABLED,MODIFICATION_DATE,MAXIMIZABLE,PREFIX,KEY_INITIAL_CONTENT,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (null,null,null,null,null,'630e2bf2-2477-48de-82ce-690b51bd8410','2009-05-04 17:03:12','pt15:vinte_tres_anos',null,null,null,'pt15:vinte_tres_anos',null,null,1,null,'net.sourceforge.fenixedu.domain.Section')  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (5,1,0,'e0334bcd-53b2-4011-8b99-a320dec48f2e:630e2bf2-2477-48de-82ce-690b51bd8410',13,14,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(13,'630e2bf2-2477-48de-82ce-690b51bd8410','e0334bcd-53b2-4011-8b99-a320dec48f2e:630e2bf2-2477-48de-82ce-690b51bd8410') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(14,'e0334bcd-53b2-4011-8b99-a320dec48f2e','e0334bcd-53b2-4011-8b99-a320dec48f2e:630e2bf2-2477-48de-82ce-690b51bd8410') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (0,1,1,'630e2bf2-2477-48de-82ce-690b51bd8410:da5ad9b1-3527-41dc-94b3-6183dfd7456b',15,16,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

INSERT INTO CONTENT (KEY_FUNCTIONALITY,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (17,'da5ad9b1-3527-41dc-94b3-6183dfd7456b','2009-05-04 17:03:24',null,null,null,null,null,null,null,1,null,'net.sourceforge.fenixedu.domain.contents.FunctionalityCall')  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(15,'da5ad9b1-3527-41dc-94b3-6183dfd7456b','630e2bf2-2477-48de-82ce-690b51bd8410:da5ad9b1-3527-41dc-94b3-6183dfd7456b') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(16,'630e2bf2-2477-48de-82ce-690b51bd8410','630e2bf2-2477-48de-82ce-690b51bd8410:da5ad9b1-3527-41dc-94b3-6183dfd7456b') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(17,'c18bf081-dd19-4a5c-8d2d-c61a26890851','da5ad9b1-3527-41dc-94b3-6183dfd7456b') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (4,1,0,'04e440d6-88fc-4cbd-b811-db9058c81ddf:d3d92169-07ce-40c5-bfad-7b90dab2714b',18,19,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

INSERT INTO CONTENT (ENABLED,MODIFICATION_DATE,MAXIMIZABLE,PREFIX,KEY_INITIAL_CONTENT,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (null,null,null,null,null,'d3d92169-07ce-40c5-bfad-7b90dab2714b','2009-05-04 17:03:40','pt13:segundo_ciclo',null,null,null,'pt13:segundo_ciclo',null,null,1,null,'net.sourceforge.fenixedu.domain.Section')  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(18,'d3d92169-07ce-40c5-bfad-7b90dab2714b','04e440d6-88fc-4cbd-b811-db9058c81ddf:d3d92169-07ce-40c5-bfad-7b90dab2714b') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(19,'04e440d6-88fc-4cbd-b811-db9058c81ddf','04e440d6-88fc-4cbd-b811-db9058c81ddf:d3d92169-07ce-40c5-bfad-7b90dab2714b') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO CONTENT (KEY_FUNCTIONALITY,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_PORTAL,KEY_AVAILABILITY_POLICY,KEY_ROOT_DOMAIN_OBJECT,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (20,'18f34d18-fa82-4202-a574-e4f905299a41','2009-05-04 17:03:49',null,null,null,null,null,null,null,1,null,'net.sourceforge.fenixedu.domain.contents.FunctionalityCall')  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_CHILD,KEY_PARENT,KEY_ROOT_DOMAIN_OBJECT,OJB_CONCRETE_CLASS) VALUES (0,1,1,'d3d92169-07ce-40c5-bfad-7b90dab2714b:18f34d18-fa82-4202-a574-e4f905299a41',21,22,1,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(20,'5f7ef6ac-80e8-42cd-ae9b-010a275a3abb','18f34d18-fa82-4202-a574-e4f905299a41') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(21,'18f34d18-fa82-4202-a574-e4f905299a41','d3d92169-07ce-40c5-bfad-7b90dab2714b:18f34d18-fa82-4202-a574-e4f905299a41') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(22,'d3d92169-07ce-40c5-bfad-7b90dab2714b','d3d92169-07ce-40c5-bfad-7b90dab2714b:18f34d18-fa82-4202-a574-e4f905299a41') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;



COMMIT;