CREATE TABLE [zc].[MEX_DaneCelne] (
    [Id]             DECIMAL (19)    NOT NULL,
    [MRN]            VARCHAR (35)    NULL,
    [WywozCzesciowy] TINYINT         NULL,
    [NrPozycji]      INT             NULL,
    [LiczbaOpakowan] INT             NULL,
    [LiczbaSztuk]    INT             NULL,
    [MasaBrutto]     DECIMAL (18, 3) NULL,
    [IdTowarMEX]     DECIMAL (19)    NULL,
    CONSTRAINT [PK_MEX_DaneCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_MEX_DaneCelne_IdTowarMEX_MEX_Towar_Id] FOREIGN KEY ([IdTowarMEX]) REFERENCES [zc].[MEX_Towar] ([Id])
);

