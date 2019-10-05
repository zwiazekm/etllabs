CREATE TABLE [aes2].[MEX_DaneCelne] (
    [Id]             NUMERIC (19)    NOT NULL,
    [MasaBrutto]     NUMERIC (18, 3) NULL,
    [MRN]            NVARCHAR (35)   NULL,
    [LiczbaOpakowan] INT             NULL,
    [NrPozycji]      INT             NULL,
    [LiczbaSztuk]    INT             NULL,
    [WywozCzesciowy] TINYINT         NULL,
    [IdTowarMEX]     NUMERIC (19)    NULL,
    CONSTRAINT [MEX_DaneCelne$PK_MEX_DaneCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

