CREATE TABLE [zc].[DS_SrodekPrzewozowy] (
    [IdDok]              BIGINT       NOT NULL,
    [IdPozycji]          SMALLINT     NOT NULL,
    [RodzajTransp]       CHAR (1)     NULL,
    [RodzajTranspPid]    INT          NULL,
    [ZnakiSrodkaPrzewoz] VARCHAR (27) NULL,
    [Kraj]               CHAR (2)     NULL,
    [KrajPid]            INT          NULL,
    CONSTRAINT [PK_DS_SrodekPrzewozowy] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

