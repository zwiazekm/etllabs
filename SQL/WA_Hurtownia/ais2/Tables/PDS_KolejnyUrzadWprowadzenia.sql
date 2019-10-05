CREATE TABLE [ais2].[PDS_KolejnyUrzadWprowadzenia] (
    [Id]                NUMERIC (19)  NOT NULL,
    [Miejscowosc]       VARCHAR (35)  NULL,
    [Kraj]              VARCHAR (2)   NULL,
    [KrajPid]           VARCHAR (2)   NULL,
    [KodPocztowy]       VARCHAR (9)   NULL,
    [UlicaNumer]        VARCHAR (35)  NULL,
    [UCWprowadzenia]    VARCHAR (8)   NULL,
    [UCWprowadzeniaPid] INT           NULL,
    [Nazwa]             VARCHAR (255) NULL,
    [IdDokPDS]          NUMERIC (19)  NULL,
    CONSTRAINT [PDS_KolejnyUrzadWprowadzenia$PK_PDS_KolejnyUrzadWprowadzenia] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AIS2],
    CONSTRAINT [FK__PDS_KolejnyUrzadWprowadzenia_IdDokPDS__PDS_Dokument_id] FOREIGN KEY ([IdDokPDS]) REFERENCES [ais2].[PDS_Dokument] ([Id])
);

