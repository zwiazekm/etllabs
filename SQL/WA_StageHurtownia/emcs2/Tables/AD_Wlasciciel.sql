CREATE TABLE [emcs2].[AD_Wlasciciel] (
    [Id]            NUMERIC (38)  NOT NULL,
    [NRA]           VARCHAR (13)  NOT NULL,
    [Typ]           NVARCHAR (15) NOT NULL,
    [WlascicielNRA] VARCHAR (13)  NOT NULL,
    [WlascicielTyp] NVARCHAR (15) NOT NULL,
    CONSTRAINT [AD_Wlasciciel$PK_AD_Wlasciciel] PRIMARY KEY CLUSTERED ([Id] ASC)
);

