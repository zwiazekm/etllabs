CREATE TABLE [zc].[DS_Towar] (
    [IdDok]          BIGINT          NOT NULL,
    [IdPozycji]      SMALLINT        NOT NULL,
    [LiczbaOpakowan] INT             NULL,
    [MasaBrutto]     DECIMAL (14, 3) NULL,
    [OpisTowaru]     VARCHAR (1000)  NULL,
    CONSTRAINT [PK_DS_Towar] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

