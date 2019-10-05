CREATE TABLE [zc].[PSP_SrodekPrzewozowy] (
    [IdDok]           VARCHAR (30) NOT NULL,
    [IdPozycji]       TINYINT      NOT NULL,
    [NrSrodkaPrzewoz] VARCHAR (40) NULL,
    [Kraj]            CHAR (2)     NULL,
    [KrajPid]         INT          NULL,
    CONSTRAINT [PK_PSP_SrodekPrzewozowy] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DT_Dokument_KrajPid] FOREIGN KEY ([KrajPid]) REFERENCES [pdr].[s007] ([s007_id]),
    CONSTRAINT [FK_PSP_SrodekPrzewozowy_IdDok_PSP_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[PSP_Dokument] ([IdDok])
);

