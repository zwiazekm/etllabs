CREATE TABLE [aimp2].[DSK_PodmiotLancuchDostawTowar] (
    [IdWpisu]                  NUMERIC (19)  NOT NULL,
    [IdTowarDSK]               NUMERIC (19)  NOT NULL,
    [NumerIdDodatkowegoAktora] NVARCHAR (17) NOT NULL,
    [RolaPodmiot]              NCHAR (3)     NOT NULL,
    CONSTRAINT [DSK_PodmiotLancuchDostawTowar_PK] PRIMARY KEY CLUSTERED ([IdWpisu] ASC)
);

