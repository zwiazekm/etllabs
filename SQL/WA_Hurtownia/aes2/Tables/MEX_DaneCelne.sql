CREATE TABLE [aes2].[MEX_DaneCelne] (
    [Id]             NUMERIC (19)    NOT NULL,
    [MasaBrutto]     NUMERIC (18, 3) NULL,
    [MRN]            NVARCHAR (35)   NULL,
    [LiczbaOpakowan] INT             NULL,
    [NrPozycji]      INT             NULL,
    [LiczbaSztuk]    INT             NULL,
    [WywozCzesciowy] TINYINT         NULL,
    [IdTowarMEX]     NUMERIC (19)    NULL,
    CONSTRAINT [MEX_DaneCelne$PK_MEX_DaneCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__MEX_DaneCelne_IdTowarMEX__MEX_Towar_id] FOREIGN KEY ([IdTowarMEX]) REFERENCES [aes2].[MEX_Towar] ([Id])
);

