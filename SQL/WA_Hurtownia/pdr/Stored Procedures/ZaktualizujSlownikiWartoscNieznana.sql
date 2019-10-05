




CREATE PROCEDURE [pdr].[ZaktualizujSlownikiWartoscNieznana]
AS

	IF NOT EXISTS(SELECT 1 FROM [pdr].[c001] WHERE c001_id = -1) BEGIN
		INSERT INTO [pdr].[c001]
		(c001_id, creation_tm, kod_pocztowy, kod_urzedu, kraj, last_modification_tm, miejscowosc, nazwa_krotka, nazwa_pelna, ulica, version_)
		VALUES (-1, GETDATE(), '??-???', 'Nieznany', '??', '19000101', 'Nieznana', 'Nieznana', 'Nieznana', 'Nieznana', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s002] WHERE s002_id = -1) BEGIN
		INSERT INTO [pdr].[s002]
		(s002_id, code, creation_tm, [description], description_eng, last_modification_tm, version_)
		VALUES (-1, '???', GETDATE(), 'Nieznany', 'No description', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s003] WHERE s003_id = -1) BEGIN
		INSERT INTO [pdr].[s003]
		(s003_id, code, creation_tm, [description], description_eng, last_modification_tm, version_)
		VALUES (-1, '??', GETDATE(), 'Nieznany', 'No description', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s004] WHERE s004_id = -1) BEGIN
		INSERT INTO [pdr].[s004]
		(s004_id, code, creation_tm, [description], last_modification_tm, version_)
		VALUES (-1, '??', GETDATE(), 'Nieznany', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s005] WHERE s005_id = -1) BEGIN
		INSERT INTO [pdr].[s005]
		(s005_id, code, creation_tm, [description], description_eng, last_modification_tm, version_)
		VALUES (-1, '??', GETDATE(), 'Nieznany', 'No description', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s007] WHERE s007_id = -1) BEGIN
		INSERT INTO [pdr].[s007]
		(s007_id, code, creation_tm, [description], last_modification_tm, version_)
		VALUES (-1, '??', GETDATE(), 'Nieznany', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s013] WHERE s013_id = -1) BEGIN
		INSERT INTO [pdr].[s013]
		(s013_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s014] WHERE s014_id = -1) BEGIN
		INSERT INTO [pdr].[s014]
		(s014_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '???', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s015] WHERE s015_id = -1) BEGIN
		INSERT INTO [pdr].[s015]
		(s015_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s016] WHERE s016_id = -1) BEGIN
		INSERT INTO [pdr].[s016]
		(s016_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?????', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[S017] WHERE S017_id = -1) BEGIN
		INSERT INTO [pdr].[S017]
		(S017_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s018] WHERE s018_id = -1) BEGIN
		INSERT INTO [pdr].[s018]
		(s018_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?????', GETDATE(), 'Nieznany', 'Unknown', '19000101', '19000101', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s026] WHERE s026_id = -1) BEGIN
		INSERT INTO [pdr].[s026]
		(s026_id, code, creation_tm, [description], description_eng, last_modification_tm, valid_from, valid_to,  version_)
		VALUES (-1, '???',  GETDATE(), 'Nieznany','Unknown', '19000101', '19000101', '19000101', 0)
	END	
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s025] WHERE s025_id = -1) BEGIN
		INSERT INTO [pdr].[s025]
		(s025_id, code, creation_tm, [description], description_eng, last_modification_tm, valid_from, valid_to,  version_)
		VALUES (-1, '????',  GETDATE(), 'Nieznany','Unknown', '19000101', '19000101', '19000101', 0)
	END	
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s028] WHERE s028_id = -1) BEGIN
		INSERT INTO [pdr].[s028]
		(s028_id, code, [description], creation_tm, last_modification_tm, version_)
		VALUES (-1, 'Nieznany', 'Nieznany', GETDATE(), '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s028b] WHERE s028b_id = -1) BEGIN
		INSERT INTO [pdr].[s028b]
		([s028b_id],[code],[creation_tm],[last_modification_tm],[valid_from],[valid_to],[description],[description_eng],[version_])
		VALUES (-1,'Nieznany',GETDATE(),'19000101',NULL,NULL,'Nieznany','Unknown',0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s031] WHERE s031_id = -1) BEGIN
		INSERT INTO [pdr].[s031]
		(s031_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s033] WHERE s033_id = -1) BEGIN
		INSERT INTO [pdr].[s033]
		(s033_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '??', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s034] WHERE s034_id = -1) BEGIN
		INSERT INTO [pdr].[s034]
		(s034_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '????', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s036] WHERE s036_id = -1) BEGIN
		INSERT INTO [pdr].[s036]
		(s036_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?????', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s076] WHERE s076_id = -1) BEGIN
		INSERT INTO [pdr].[s076]
		(s076_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '???', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s069] WHERE s069_id = -1) BEGIN
		INSERT INTO [pdr].[s069]
		(s069_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', '19000101', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s077] WHERE s077_id = -1) BEGIN
		INSERT INTO [pdr].[s077]
		(s077_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', '19000101', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s078] WHERE s078_id = -1) BEGIN
		INSERT INTO [pdr].[s078]
		(s078_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', '19000101', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s079] WHERE s079_id = -1) BEGIN
		INSERT INTO [pdr].[s079]
		(s079_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s080] WHERE s080_id = -1) BEGIN
		INSERT INTO [pdr].[s080]
		(s080_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s081] WHERE s081_id = -1) BEGIN
		INSERT INTO [pdr].[s081]
		(s081_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s082] WHERE s082_id = -1) BEGIN
		INSERT INTO [pdr].[s082]
		(s082_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s083] WHERE s083_id = -1) BEGIN
		INSERT INTO [pdr].[s083]
		(s083_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s085] WHERE s085_id = -1) BEGIN
		INSERT INTO [pdr].[s085]
		(s085_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s086] WHERE s086_id = -1) BEGIN
		INSERT INTO [pdr].[s086]
		(s086_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?????', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s088] WHERE s088_id = -1) BEGIN
		INSERT INTO [pdr].[s088]
		(s088_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '????', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s100] WHERE s100_id = -1) BEGIN
		INSERT INTO [pdr].[s100]
		(s100_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s109] WHERE s109_id = -1) BEGIN
		INSERT INTO [pdr].[s109]
		(s109_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '????', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s110] WHERE s110_id = -1) BEGIN
		INSERT INTO [pdr].[s110]
		(s110_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s111] WHERE s111_id = -1) BEGIN
		INSERT INTO [pdr].[s111]
		(s111_id, code, creation_tm, [description], [description_eng], last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '??', GETDATE(), 'Nieznany', 'Unknown', '19000101', NULL, NULL, 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[c350234] WHERE c350234_id = -1) BEGIN
		INSERT INTO [pdr].[c350234]
		(c350234_id, code, [nazwa], creation_tm, last_modification_tm, version_)
		VALUES (-1, '?????', 'Nieznany', GETDATE(), '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s060] WHERE s060_id = -1) BEGIN
		INSERT INTO [pdr].[s060]
		(s060_id, code, creation_tm, [description], description_eng, last_modification_tm, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'No description', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s061] WHERE s061_id = -1) BEGIN
		INSERT INTO [pdr].[s061]
		(s061_id, code, creation_tm, [description], description_eng, last_modification_tm, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'No description', '19000101', 0)
	END
	IF NOT EXISTS(SELECT 1 FROM [pdr].[s068] WHERE s068_id = -1) BEGIN
		INSERT INTO [pdr].[s068]
		(s068_id, code, creation_tm, [description], description_eng, last_modification_tm, valid_from, valid_to, version_)
		VALUES (-1, '?', GETDATE(), 'Nieznany', 'No description', '19000101', '19000101', '19000101', 0)
	END




RETURN 0