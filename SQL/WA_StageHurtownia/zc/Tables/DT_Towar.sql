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
    CONSTRAINT [PK_DT_Towar] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

