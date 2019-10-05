CREATE TABLE [pta].[AD_Wlasciciel] (
    [Id]            BIGINT       NOT NULL,
    [NRA]           VARCHAR (13) NOT NULL,
    [Typ]           VARCHAR (5)  NOT NULL,
    [WlascicielNRA] VARCHAR (13) NOT NULL,
    [WlascicielTyp] VARCHAR (5)  DEFAULT ('AWK') NOT NULL,
    CONSTRAINT [PK_AD_Wlasciciel] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_PTA],
    CONSTRAINT [FK_AD_Wlasciciel_NRATyp_AD_Podmiot_NRATyp] FOREIGN KEY ([NRA], [Typ]) REFERENCES [pta].[AD_Podmiot] ([NRA], [Typ]),
    CONSTRAINT [FK_AD_Wlasciciel_WlascicielNRAWlascicielTyp_AD_Podmiot_NRATyp] FOREIGN KEY ([WlascicielNRA], [WlascicielTyp]) REFERENCES [pta].[AD_Podmiot] ([NRA], [Typ])
);

