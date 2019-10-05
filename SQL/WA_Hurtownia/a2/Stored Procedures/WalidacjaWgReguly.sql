-- ==========================================================================================
-- Autor:		    Kamil Nowiński
-- Data modyf.:     19.11.2014
-- Opis:            Błędnie były wyliczane kolumny klucza głównego gdy w bazie występowały 
--                  więzy integralności typu PRIMARY KEY o tej samej nazwie w różnych schematach.
-- Data utworzenia: 04.11.2014
-- Opis:            Procedura przeprowadza walidację wg wskazanej reguły 
--					zapisując jej wyniki do tabeli a2.BledyWalidacji
-- ==========================================================================================

CREATE PROCEDURE [a2].[WalidacjaWgReguly] 
	@RegulaId INT
as

	DECLARE 
			@Tabela VARCHAR(100),
			@Kolumna varchar(60), 
			@WarunekBledu as VARCHAR(400),
			@BazaDanych as SYSNAME,
			@SQL as nvarchar(MAX),
			@PKList as varchar(200),
			@PKValueOUT as nvarchar(500),
			@Info as varchar(1000),
			@id as bigint,
			@dbid as smallint
			;

	SELECT    @Tabela = TabelaWalidowana
			, @Kolumna = KolumnaWalidowana
			, @WarunekBledu = WarunekBledu
			, @BazaDanych = COALESCE(BazaDanych, DB_NAME())
			, @dbid = DB_ID(COALESCE(BazaDanych, DB_NAME()))
	FROM a2.RegulyWalidacyjne WHERE Id = @RegulaId;

	SET @Info = '@RegulaId=' + CAST(@RegulaId as VARCHAR(20)) + ': ' + @BazaDanych + '.' + @Tabela + ' WHERE ' + @WarunekBledu;
	EXEC @id = a2.DziennikWpisInfo @Info, @@PROCID, 0;

	DECLARE @objectId BIGINT = OBJECT_ID(@BazaDanych + '.' + @Tabela);
	IF @objectId IS NULL BEGIN
		SET @Info = 'Nie znaleziono obiektu o nazwie: ' + @BazaDanych + '.' + @Tabela;
		exec a2.DziennikWpisError @Info, @@PROCID;
		RETURN -1;
	END

	--Ustalanie kolumn PK dynamicznym skryptem (ponieważ możliwe odwołanie do innej bazy)
	set @SQL = '
	DECLARE @PkName SYSNAME = NULL;
	DECLARE @SchemaName SYSNAME = NULL;
	SELECT @PkName = c.[name], @SchemaName = s.[name] from '+@BazaDanych+'.sys.key_constraints as c
	INNER JOIN '+@BazaDanych+'.sys.schemas as s on s.schema_id = c.schema_id
	WHERE c.parent_object_id = @objId and c.[type] = ''PK'';
	
	IF @PkName IS NULL BEGIN
		SET @PkValue = NULL;
	END ELSE BEGIN
		with pkbase as (
		SELECT A.CONSTRAINT_NAME, A.TABLE_SCHEMA, B.TABLE_NAME, B.COLUMN_NAME
		FROM   '+@BazaDanych+'.INFORMATION_SCHEMA.TABLE_CONSTRAINTS A,   
			   '+@BazaDanych+'.INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE B  
		WHERE  B.CONSTRAINT_NAME = A.CONSTRAINT_NAME   
			   AND A.TABLE_SCHEMA = B.TABLE_SCHEMA
			   AND B.TABLE_NAME = A.TABLE_NAME   
			   AND CONSTRAINT_TYPE = ''PRIMARY KEY ''  
			   AND A.CONSTRAINT_NAME = @PkName
			   AND A.TABLE_SCHEMA = @SchemaName
		)
		SELECT @PKValue = STUFF((SELECT ''+'''',''''+CAST('' + pkbase.COLUMN_NAME + '' as NVARCHAR(500))'' FROM pkbase FOR XML PATH('''')) ,1,5,'''');
	END
	';

	DECLARE @ParamDefinition nvarchar(500) = N'@objId INT, @PKValue nvarchar(500) OUTPUT';
	EXECUTE sp_executesql @SQL, @ParamDefinition, @objId = @objectId, @PKValue = @PKValueOUT OUTPUT;

	--PRINT '@PkValueOUT = ' + @PkValueOUT;

	--Budowanie zapytania SQL
	SET @SQL = 'WITH bw AS ( ' + 
			 + ' SELECT ' + @PkValueOUT + ' as _$PkValue, CAST(' + @Kolumna + ' AS NVARCHAR(50)) as _$BlednaWartosc'
			 + ' FROM ' + @BazaDanych + '.' + @Tabela
			 + ' WHERE ' + @WarunekBledu
			 + ' ) '
			 + ' INSERT INTO a2.BledyWalidacji '
			 + ' ([Czas],[objectId],[WalidacjaPDR],[Kolumna],[BlednaWartosc],[KluczWiersza],[CzyPoprawiony],[KodKlasyBledu],[RegulaId],[databaseId])'
			 + ' SELECT GETDATE(), ' + CAST(@objectId AS VARCHAR(20)) + ', '''', ''' + @Kolumna + ''', bw._$BlednaWartosc, bw._$PkValue, 0, ''REG'', ' + CAST(@RegulaId AS VARCHAR(20)) + ', ' + CAST(@dbid AS VARCHAR(20))
			 + ' FROM bw';

	PRINT '@SQL = ' + @SQL;			 

	--Wykonanie przygotowanego zapytania
	exec sp_executesql @SQL;

	exec a2.DziennikRowCount;
	exec a2.DziennikCzas @id;