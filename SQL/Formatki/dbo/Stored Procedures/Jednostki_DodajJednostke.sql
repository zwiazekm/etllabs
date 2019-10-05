
CREATE PROCEDURE [dbo].[Jednostki_DodajJednostke]
(
		@KodPocztowy		varchar(9),
		@KodUrzedu			varchar(8),
		@KodUrzeduNadrzedny	varchar(8),
		@Kraj				varchar(2),
		@Miejscowosc		nvarchar(35),
		@NazwaKrotka		nvarchar(35),
		@NazwaPelna			nvarchar(200),
		@Rodzaj				char(1),
		@Ulica				varchar(9),
		@JednostkaId		int,
		@JednostkaIdOLD		int = null
	
)

AS

IF (@JednostkaIdOLD is null) 
BEGIN

INSERT INTO	
	StrukturaOrganizacyjna
	(	
		JednostkaId,
		KodPocztowy,
		KodUrzedu,
		KodUrzeduNadrzedny,
		Kraj,
		Miejscowosc,
		NazwaKrotka,
		NazwaPelna,
		Rodzaj,
		Ulica,
		valid_from
	)
	VALUES
	(
		@JednostkaId,
		@KodPocztowy,
		@KodUrzedu,
		@KodUrzeduNadrzedny,
		@Kraj,
		@Miejscowosc,
		@NazwaKrotka,
		@NazwaPelna,
		@Rodzaj,
		@Ulica,
		getdate()
	)

	select @@ROWCOUNT
	
end
else
begin

	UPDATE StrukturaOrganizacyjna
	SET
		KodPocztowy = @KodPocztowy,
		KodUrzedu = @KodUrzedu,
		KodUrzeduNadrzedny = @KodUrzeduNadrzedny,
		Kraj = @Kraj,
		Miejscowosc = @Miejscowosc,
		NazwaKrotka = @NazwaKrotka,
		NazwaPelna = @NazwaPelna,
		Rodzaj= @Rodzaj,
		Ulica = @Ulica,
		JednostkaId = @JednostkaId
	WHERE
		JednostkaId = @JednostkaIdOLD

	select @@ROWCOUNT

END