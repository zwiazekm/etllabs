CREATE TABLE [zc].[DT_Towar] (
    [IdDok]             VARCHAR (30)    NOT NULL,
    [IdPozycji]         NUMERIC (2)     NOT NULL,
    [OpisTowaru]        VARCHAR (1024)  NULL,
    [MasaBrutto]        NUMERIC (14)    NULL,
    [Ilosc]             NUMERIC (14)    NULL,
    [JednostkaMiary]    VARCHAR (10)    NULL,
    [JednostkaMiaryPid] INT             NULL,
    [LiczbaOpakowan]    NUMERIC (14)    NULL,
    [OpisOpakowan]      VARCHAR (255)   NULL,
    [OpisWartosci]      DECIMAL (14, 2) NULL,
    CONSTRAINT [PK_DT_Towar] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DT_Towar_IdDok_DT_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[DT_Dokument] ([IdDok]),
    CONSTRAINT [FK_DT_Towar_JednostkaMiaryPid] FOREIGN KEY ([JednostkaMiaryPid]) REFERENCES [pdr].[s068] ([s068_id])
);

