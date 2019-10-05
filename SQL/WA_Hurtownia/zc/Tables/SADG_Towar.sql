CREATE TABLE [zc].[SADG_Towar] (
    [IdDok]          VARCHAR (30)   NOT NULL,
    [IdPozycji]      NUMERIC (2)    NOT NULL,
    [OpisTowaru]     VARCHAR (1024) NULL,
    [MasaBrutto]     NUMERIC (14)   NULL,
    [LiczbaOpakowan] NUMERIC (14)   NULL,
    [OpisOpakowan]   VARCHAR (255)  NULL,
    CONSTRAINT [PK_SADG_Towar] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SADG_Towar_IdDok_SADG_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[SADG_Dokument] ([IdDok])
);

