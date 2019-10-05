CREATE TABLE [zc].[MEX_DaneCelne] (
    [Id]             DECIMAL (19)    NOT NULL,
    [MRN]            VARCHAR (35)    NULL,
    [WywozCzesciowy] TINYINT         NULL,
    [NrPozycji]      INT             NULL,
    [LiczbaOpakowan] INT             NULL,
    [LiczbaSztuk]    INT             NULL,
    [MasaBrutto]     DECIMAL (18, 3) NULL,
    [IdTowarMEX]     DECIMAL (19)    NULL,
    CONSTRAINT [PK_MEX_DaneCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

