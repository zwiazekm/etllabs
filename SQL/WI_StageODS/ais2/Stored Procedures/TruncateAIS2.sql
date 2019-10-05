﻿





-- =============================================
-- Author:		Michał Błędowski
-- Create date: 2015-12-10
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego).
-- =============================================
CREATE PROCEDURE [ais2].[TruncateAIS2]


AS
BEGIN
	SET NOCOUNT ON;



TRUNCATE TABLE ais2.ICS_GAN_ZCP_CUST_DATA_DETL
TRUNCATE TABLE ais2.ICS_GAN_ZCP_CUST_DATA
TRUNCATE TABLE ais2.ICS_GAN_CUST_DATA_DETL
TRUNCATE TABLE ais2.ICS_BALANCE_REQ_POS
TRUNCATE TABLE ais2.ICS_ENS_ITEM_ADD_INFO
TRUNCATE TABLE ais2.ICS_ENS_ITEM_CONT
TRUNCATE TABLE ais2.ICS_ENS_ITEM_CUST
TRUNCATE TABLE ais2.ICS_ENS_ITEM_PACK
TRUNCATE TABLE ais2.ICS_ENS_ITEM_TRANS
TRUNCATE TABLE ais2.ICS_ENS_PROD_DOCU
TRUNCATE TABLE ais2.ICS_ENS_SPEC_MENT
TRUNCATE TABLE ais2.ICS_GAN_CUST_DATA
TRUNCATE TABLE ais2.ICS_CHANG
TRUNCATE TABLE ais2.ICS_DIRT_CHANGE
TRUNCATE TABLE ais2.ICS_DIRT_CONTROL_METHOD
TRUNCATE TABLE ais2.ICS_DIRT_IND
TRUNCATE TABLE ais2.ICS_DIRT_INTR
TRUNCATE TABLE ais2.ICS_DIRT_POINTER
TRUNCATE TABLE ais2.ICS_DIRT_POSITION
TRUNCATE TABLE ais2.ICS_ENS_CUST
TRUNCATE TABLE ais2.ICS_ENS_ITEMS
TRUNCATE TABLE ais2.ICS_ENS_ITI
TRUNCATE TABLE ais2.ICS_ENS_SEALS
TRUNCATE TABLE ais2.ICS_ENS_SUBS_ENTR
TRUNCATE TABLE ais2.ICS_GAN_CUST
TRUNCATE TABLE ais2.ICS_GAN_ITEMS
TRUNCATE TABLE ais2.ICS_CANCEL_BALANCE_REQ
TRUNCATE TABLE ais2.ICS_CONTROL_NOTIFICATION_REQ_DOC
TRUNCATE TABLE ais2.ICS_DIRT
TRUNCATE TABLE ais2.ICS_ENS
TRUNCATE TABLE ais2.ICS_GAN
TRUNCATE TABLE ais2.ICS_MESS
TRUNCATE TABLE ais2.ICS_MESS_KANAL
TRUNCATE TABLE ais2.ICS_OPER
TRUNCATE TABLE ais2.ICS_BALANCE_REQ
TRUNCATE TABLE ais2.ICS_CONTROL_NOTIFICATION
TRUNCATE TABLE ais2.ICS_DECL_PARAM
TRUNCATE TABLE ais2.ICS_DECL
TRUNCATE TABLE ais2.ICS_DISREPANCY


END