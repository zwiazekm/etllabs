CREATE TABLE [zc].[DS_SrodekPrzewozowy] (
    [IdDok]              BIGINT       NOT NULL,
    [IdPozycji]          SMALLINT     NOT NULL,
    [RodzajTransp]       CHAR (1)     NULL,
    [RodzajTranspPid]    INT          NULL,
    [ZnakiSrodkaPrzewoz] VARCHAR (27) NULL,
    [Kraj]               CHAR (2)     NULL,
    [KrajPid]            INT          NULL,
    CONSTRAINT [PK_DS_SrodekPrzewozowy] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DS_SrodekPrzewozowy_IdDok_DS_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[DS_Dokument] ([IdDok]),
    CONSTRAINT [FK_DS_SrodekPrzewozowy_KrajPid] FOREIGN KEY ([KrajPid]) REFERENCES [pdr].[s007] ([s007_id]),
    CONSTRAINT [FK_DS_SrodekPrzewozowy_RodzajTranspPid] FOREIGN KEY ([RodzajTranspPid]) REFERENCES [pdr].[s005] ([s005_id])
);

