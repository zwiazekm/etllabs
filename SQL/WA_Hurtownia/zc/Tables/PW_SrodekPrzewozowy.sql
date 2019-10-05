CREATE TABLE [zc].[PW_SrodekPrzewozowy] (
    [IdDok]           VARCHAR (30) NOT NULL,
    [IdPozycji]       TINYINT      NOT NULL,
    [NrSrodkaPrzewoz] VARCHAR (40) NULL,
    [Kraj]            CHAR (2)     NULL,
    [KrajPid]         INT          NULL,
    CONSTRAINT [PK_PW_SrodekPrzewozowy] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PW_SrodekPrzewozowy_IdDok_PW_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[PW_Dokument] ([IdDok]),
    CONSTRAINT [FK_PW_SrodekPrzewozowy_KrajPid] FOREIGN KEY ([KrajPid]) REFERENCES [pdr].[s007] ([s007_id])
);

