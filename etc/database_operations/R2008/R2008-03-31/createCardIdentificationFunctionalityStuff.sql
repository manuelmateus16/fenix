SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_ROOT_DOMAIN_OBJECT,KEY_PARENT,KEY_CHILD,OJB_CONCRETE_CLASS) VALUES (41,1,1,'382b0518-1431-102b-8308-0016ec91a6df:8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81',1,1,2,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

INSERT INTO CONTENT (EXECUTION_PATH,VISIBLE,KEY_MODULE_ROOT_DOMAIN_OBJECT,MAXIMIZABLE,PREFIX,KEY_INITIAL_CONTENT,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_ROOT_DOMAIN_OBJECT,KEY_AVAILABILITY_POLICY,KEY_PORTAL,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (null,null,null,null,'/identificationCardManager',null,'8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81','2008-03-27 19:10:35','pt35:Gestão da Cartões de Indentificação',null,null,null,'pt35:gestao-da-cartoes-de-indentificacao',1,null,null,null,'net.sourceforge.fenixedu.domain.functionalities.Module')  ;

UPDATE NODE SET NODE_ORDER=41,ASCENDING=1,VISIBLE=1,CONTENT_ID='382b0518-1431-102b-8308-0016ec91a6df:8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81',KEY_ROOT_DOMAIN_OBJECT=1,KEY_PARENT=3,KEY_CHILD=4,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '382b0518-1431-102b-8308-0016ec91a6df:8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81'  ;

UPDATE CONTENT SET EXECUTION_PATH=null,VISIBLE=null,KEY_MODULE_ROOT_DOMAIN_OBJECT=null,MAXIMIZABLE=null,PREFIX='/identificationCardManager',KEY_INITIAL_CONTENT=null,CONTENT_ID='8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81',CREATION_DATE='2008-03-27 19:10:35',NAME='pt35:Gestão da Cartões de Indentificação',TITLE=null,BODY=null,DESCRIPTION=null,NORMALIZED_NAME='pt35:gestao-da-cartoes-de-indentificacao',KEY_ROOT_DOMAIN_OBJECT=1,KEY_AVAILABILITY_POLICY=null,KEY_PORTAL=null,KEY_CREATOR=null,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.functionalities.Module' WHERE CONTENT_ID = '8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(1,'382b0518-1431-102b-8308-0016ec91a6df','382b0518-1431-102b-8308-0016ec91a6df:8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(2,'8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81','382b0518-1431-102b-8308-0016ec91a6df:8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(3,'382b0518-1431-102b-8308-0016ec91a6df','382b0518-1431-102b-8308-0016ec91a6df:8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(4,'8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81','382b0518-1431-102b-8308-0016ec91a6df:8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_ROOT_DOMAIN_OBJECT,KEY_PARENT,KEY_CHILD,OJB_CONCRETE_CLASS) VALUES (0,1,1,'8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81:d6a89247-5c66-4777-bc59-a126349478ac',1,5,6,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

INSERT INTO EXECUTION_PATH (EXECUTION_PATH,CONTENT_ID,KEY_FUNCTIONALITY,KEY_ROOT_DOMAIN_OBJECT) VALUES ('/index.do','1d0322b8-eaec-4f25-9f1b-a724ce54bd4c',7,1)  ;

INSERT INTO CONTENT (EXECUTION_PATH,VISIBLE,KEY_EXECUTION_PATH_VALUE,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_ROOT_DOMAIN_OBJECT,KEY_AVAILABILITY_POLICY,KEY_PORTAL,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES ('/index.do',null,8,'d6a89247-5c66-4777-bc59-a126349478ac','2008-03-27 19:10:58','pt14:Página Inicial',null,null,null,'pt14:pagina-inicial',1,null,null,null,'net.sourceforge.fenixedu.domain.functionalities.Functionality')  ;

UPDATE NODE SET NODE_ORDER=0,ASCENDING=1,VISIBLE=1,CONTENT_ID='8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81:d6a89247-5c66-4777-bc59-a126349478ac',KEY_ROOT_DOMAIN_OBJECT=1,KEY_PARENT=9,KEY_CHILD=10,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81:d6a89247-5c66-4777-bc59-a126349478ac'  ;

UPDATE EXECUTION_PATH SET EXECUTION_PATH='/index.do',CONTENT_ID='1d0322b8-eaec-4f25-9f1b-a724ce54bd4c',KEY_FUNCTIONALITY=11,KEY_ROOT_DOMAIN_OBJECT=1 WHERE CONTENT_ID = '1d0322b8-eaec-4f25-9f1b-a724ce54bd4c'  ;

UPDATE CONTENT SET EXECUTION_PATH='/index.do',VISIBLE=null,KEY_EXECUTION_PATH_VALUE=12,CONTENT_ID='d6a89247-5c66-4777-bc59-a126349478ac',CREATION_DATE='2008-03-27 19:10:58',NAME='pt14:Página Inicial',TITLE=null,BODY=null,DESCRIPTION=null,NORMALIZED_NAME='pt14:pagina-inicial',KEY_ROOT_DOMAIN_OBJECT=1,KEY_AVAILABILITY_POLICY=null,KEY_PORTAL=null,KEY_CREATOR=null,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.functionalities.Functionality' WHERE CONTENT_ID = 'd6a89247-5c66-4777-bc59-a126349478ac'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(5,'8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81','8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81:d6a89247-5c66-4777-bc59-a126349478ac') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(6,'d6a89247-5c66-4777-bc59-a126349478ac','8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81:d6a89247-5c66-4777-bc59-a126349478ac') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(7,'d6a89247-5c66-4777-bc59-a126349478ac','1d0322b8-eaec-4f25-9f1b-a724ce54bd4c') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(8,'1d0322b8-eaec-4f25-9f1b-a724ce54bd4c','d6a89247-5c66-4777-bc59-a126349478ac') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(9,'8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81','8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81:d6a89247-5c66-4777-bc59-a126349478ac') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(10,'d6a89247-5c66-4777-bc59-a126349478ac','8d8e5f9a-fc18-461b-a2f8-e5b4c333fe81:d6a89247-5c66-4777-bc59-a126349478ac') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(11,'d6a89247-5c66-4777-bc59-a126349478ac','1d0322b8-eaec-4f25-9f1b-a724ce54bd4c') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(12,'1d0322b8-eaec-4f25-9f1b-a724ce54bd4c','d6a89247-5c66-4777-bc59-a126349478ac') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO CONTENT (ENABLED,MODIFICATION_DATE,MAXIMIZABLE,PREFIX,KEY_INITIAL_CONTENT,CONTENT_ID,CREATION_DATE,NAME,TITLE,BODY,DESCRIPTION,NORMALIZED_NAME,KEY_ROOT_DOMAIN_OBJECT,KEY_AVAILABILITY_POLICY,KEY_PORTAL,KEY_CREATOR,OJB_CONCRETE_CLASS) VALUES (null,null,null,null,null,'1e68dba1-0f24-40cc-882a-48c774825cd9','2008-03-27 19:11:42','pt24:Cartões de Identificação',null,null,null,'pt24:cartoes-de-identificacao',1,null,null,null,'net.sourceforge.fenixedu.domain.Section')  ;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_ROOT_DOMAIN_OBJECT,KEY_PARENT,KEY_CHILD,OJB_CONCRETE_CLASS) VALUES (55,1,1,'382b0734-1431-102b-8308-0016ec91a6df:1e68dba1-0f24-40cc-882a-48c774825cd9',1,1,2,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

UPDATE CONTENT SET ENABLED=null,MODIFICATION_DATE=null,MAXIMIZABLE=null,PREFIX=null,KEY_INITIAL_CONTENT=null,CONTENT_ID='1e68dba1-0f24-40cc-882a-48c774825cd9',CREATION_DATE='2008-03-27 19:11:42',NAME='pt24:Cartões de Identificação',TITLE=null,BODY=null,DESCRIPTION=null,NORMALIZED_NAME='pt24:cartoes-de-identificacao',KEY_ROOT_DOMAIN_OBJECT=1,KEY_AVAILABILITY_POLICY=null,KEY_PORTAL=null,KEY_CREATOR=null,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.Section' WHERE CONTENT_ID = '1e68dba1-0f24-40cc-882a-48c774825cd9'  ;

UPDATE NODE SET NODE_ORDER=55,ASCENDING=1,VISIBLE=1,CONTENT_ID='382b0734-1431-102b-8308-0016ec91a6df:1e68dba1-0f24-40cc-882a-48c774825cd9',KEY_ROOT_DOMAIN_OBJECT=1,KEY_PARENT=3,KEY_CHILD=4,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '382b0734-1431-102b-8308-0016ec91a6df:1e68dba1-0f24-40cc-882a-48c774825cd9'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(1,'382b0734-1431-102b-8308-0016ec91a6df','382b0734-1431-102b-8308-0016ec91a6df:1e68dba1-0f24-40cc-882a-48c774825cd9') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(2,'1e68dba1-0f24-40cc-882a-48c774825cd9','382b0734-1431-102b-8308-0016ec91a6df:1e68dba1-0f24-40cc-882a-48c774825cd9') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(3,'382b0734-1431-102b-8308-0016ec91a6df','382b0734-1431-102b-8308-0016ec91a6df:1e68dba1-0f24-40cc-882a-48c774825cd9') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(4,'1e68dba1-0f24-40cc-882a-48c774825cd9','382b0734-1431-102b-8308-0016ec91a6df:1e68dba1-0f24-40cc-882a-48c774825cd9') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO NODE (NODE_ORDER,ASCENDING,VISIBLE,CONTENT_ID,KEY_ROOT_DOMAIN_OBJECT,KEY_PARENT,KEY_CHILD,OJB_CONCRETE_CLASS) VALUES (0,1,null,'1e68dba1-0f24-40cc-882a-48c774825cd9:d6a89247-5c66-4777-bc59-a126349478ac',1,5,6,'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode')  ;

UPDATE NODE SET NODE_ORDER=0,ASCENDING=1,VISIBLE=null,CONTENT_ID='1e68dba1-0f24-40cc-882a-48c774825cd9:d6a89247-5c66-4777-bc59-a126349478ac',KEY_ROOT_DOMAIN_OBJECT=1,KEY_PARENT=7,KEY_CHILD=8,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode' WHERE CONTENT_ID = '1e68dba1-0f24-40cc-882a-48c774825cd9:d6a89247-5c66-4777-bc59-a126349478ac'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(5,'1e68dba1-0f24-40cc-882a-48c774825cd9','1e68dba1-0f24-40cc-882a-48c774825cd9:d6a89247-5c66-4777-bc59-a126349478ac') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(6,'d6a89247-5c66-4777-bc59-a126349478ac','1e68dba1-0f24-40cc-882a-48c774825cd9:d6a89247-5c66-4777-bc59-a126349478ac') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(7,'1e68dba1-0f24-40cc-882a-48c774825cd9','1e68dba1-0f24-40cc-882a-48c774825cd9:d6a89247-5c66-4777-bc59-a126349478ac') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(8,'d6a89247-5c66-4777-bc59-a126349478ac','1e68dba1-0f24-40cc-882a-48c774825cd9:d6a89247-5c66-4777-bc59-a126349478ac') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;

INSERT INTO AVAILABILITY_POLICY (EXPRESSION,TARGET_GROUP,CONTENT_ID,KEY_ROOT_DOMAIN_OBJECT,KEY_CONTENT,OJB_CONCRETE_CLASS) VALUES ('role(IDENTIFICATION_CARD_MANAGER)','role(IDENTIFICATION_CARD_MANAGER)','f49ba18b-7cc4-4806-ab33-929d814de102',1,9,'net.sourceforge.fenixedu.domain.functionalities.ExpressionGroupAvailability')  ;

UPDATE CONTENT SET ENABLED=null,MODIFICATION_DATE=null,MAXIMIZABLE=null,PREFIX=null,KEY_INITIAL_CONTENT=null,CONTENT_ID='1e68dba1-0f24-40cc-882a-48c774825cd9',CREATION_DATE='2008-03-27 19:11:42',NAME='pt24:Cartões de Identificação',TITLE=null,BODY=null,DESCRIPTION=null,NORMALIZED_NAME='pt24:cartoes-de-identificacao',KEY_ROOT_DOMAIN_OBJECT=1,KEY_AVAILABILITY_POLICY=10,KEY_PORTAL=null,KEY_CREATOR=null,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.Section' WHERE CONTENT_ID = '1e68dba1-0f24-40cc-882a-48c774825cd9'  ;

UPDATE AVAILABILITY_POLICY SET EXPRESSION='role(IDENTIFICATION_CARD_MANAGER)',TARGET_GROUP='role(IDENTIFICATION_CARD_MANAGER)',CONTENT_ID='f49ba18b-7cc4-4806-ab33-929d814de102',KEY_ROOT_DOMAIN_OBJECT=1,KEY_CONTENT=11,OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.functionalities.ExpressionGroupAvailability' WHERE CONTENT_ID = 'f49ba18b-7cc4-4806-ab33-929d814de102'  ;

CREATE TEMPORARY TABLE UUID_TEMP_TABLE(COUNTER integer, UUID varchar(255), FROM_UUID varchar(255));

INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(9,'1e68dba1-0f24-40cc-882a-48c774825cd9','f49ba18b-7cc4-4806-ab33-929d814de102') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(10,'f49ba18b-7cc4-4806-ab33-929d814de102','1e68dba1-0f24-40cc-882a-48c774825cd9') ;
INSERT INTO UUID_TEMP_TABLE(COUNTER,UUID,FROM_UUID) VALUES(11,'1e68dba1-0f24-40cc-882a-48c774825cd9','f49ba18b-7cc4-4806-ab33-929d814de102') ;
ALTER TABLE UUID_TEMP_TABLE ADD INDEX (COUNTER), ADD INDEX (UUID), ADD INDEX (FROM_UUID); 


UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PARENT=CT.ID_INTERNAL WHERE T.KEY_PARENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE NODE T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CHILD=CT.ID_INTERNAL WHERE T.KEY_CHILD=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_INITIAL_CONTENT=CT.ID_INTERNAL WHERE T.KEY_INITIAL_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, EXECUTION_PATH CT set T.KEY_EXECUTION_PATH_VALUE=CT.ID_INTERNAL WHERE T.KEY_EXECUTION_PATH_VALUE=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_PORTAL=CT.ID_INTERNAL WHERE T.KEY_PORTAL=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE CONTENT T, UUID_TEMP_TABLE UIT, AVAILABILITY_POLICY CT set T.KEY_AVAILABILITY_POLICY=CT.ID_INTERNAL WHERE T.KEY_AVAILABILITY_POLICY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE AVAILABILITY_POLICY T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_CONTENT=CT.ID_INTERNAL WHERE T.KEY_CONTENT=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
UPDATE EXECUTION_PATH T, UUID_TEMP_TABLE UIT, CONTENT CT set T.KEY_FUNCTIONALITY=CT.ID_INTERNAL WHERE T.KEY_FUNCTIONALITY=UIT.COUNTER AND T.CONTENT_ID = UIT.FROM_UUID AND CT.CONTENT_ID=UIT.UUID;
DROP TABLE UUID_TEMP_TABLE;



COMMIT;
