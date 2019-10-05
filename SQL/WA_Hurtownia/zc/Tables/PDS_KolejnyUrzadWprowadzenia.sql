CREATE TABLE [zc].[PDS_KolejnyUrzadWprowadzenia] (
    [Id]             DECIMAL (19)  NOT NULL,
    [UCWprowadzenia] VARCHAR (8)   NULL,
    [Nazwa]          VARCHAR (255) NULL,
    [UlicaNumer]     VARCHAR (35)  NULL,
    [KodPocztowy]    VARCHAR (9)   NULL,
    [Miejscowosc]    VARCHAR (35)  NULL,
    [Kraj]           CHAR (2)      NULL,
    [IdDokPDS]       DECIMAL (19)  NULL,
    CONSTRAINT [PK_PDS_KolejnyUrzadWprowadzenia] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PDS_KolejnyUrzadWprowadzenia_IdDokPDS_PDS_Dokument_Id] FOREIGN KEY ([IdDokPDS]) REFERENCES [zc].[PDS_Dokument] ([Id])
);

