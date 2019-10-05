CREATE TABLE [zc].[PSP_SrodekPrzewozowy] (
    [IdDok]           VARCHAR (30) NOT NULL,
    [IdPozycji]       TINYINT      NOT NULL,
    [NrSrodkaPrzewoz] VARCHAR (40) NULL,
    [Kraj]            CHAR (2)     NULL,
    [KrajPid]         INT          NULL,
    CONSTRAINT [PK_PSP_SrodekPrzewozowy] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

