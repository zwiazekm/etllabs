CREATE TABLE [zc].[SAD_Opakowanie] (
    [IdDok]               BIGINT       NOT NULL,
    [IdPozycji]           SMALLINT     NOT NULL,
    [IdPozycjiOpakowanie] SMALLINT     NOT NULL,
    [RodzajOpakKod]       CHAR (2)     NULL,
    [RodzajOpakKodPid]    INT          NULL,
    [ZnakiOpak]           VARCHAR (42) NULL,
    [LiczbaOpak]          INT          NULL,
    [IloscSztuk]          INT          NULL,
    CONSTRAINT [PK_SAD_Opakowanie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiOpakowanie] ASC)
);

