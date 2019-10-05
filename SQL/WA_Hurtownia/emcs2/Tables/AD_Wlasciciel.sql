CREATE TABLE [emcs2].[AD_Wlasciciel] (
    [Id]            NUMERIC (38)  NOT NULL,
    [NRA]           VARCHAR (13)  COLLATE Polish_CS_AS NOT NULL,
    [Typ]           NVARCHAR (15) NOT NULL,
    [WlascicielNRA] VARCHAR (13)  COLLATE Polish_CS_AS NOT NULL,
    [WlascicielTyp] NVARCHAR (15) NOT NULL,
    CONSTRAINT [AD_Wlasciciel$PK_AD_Wlasciciel] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_EMCS2],
    CONSTRAINT [FK_AD_Wlasciciel_1] FOREIGN KEY ([NRA], [Typ]) REFERENCES [emcs2].[AD_Podmiot] ([NRA], [Typ]),
    CONSTRAINT [FK_AD_Wlasciciel_2] FOREIGN KEY ([WlascicielNRA], [WlascicielTyp]) REFERENCES [emcs2].[AD_Podmiot] ([NRA], [Typ])
);


GO
ALTER TABLE [emcs2].[AD_Wlasciciel] NOCHECK CONSTRAINT [FK_AD_Wlasciciel_1];


GO
ALTER TABLE [emcs2].[AD_Wlasciciel] NOCHECK CONSTRAINT [FK_AD_Wlasciciel_2];

