CREATE TABLE [zc].[PDS_KolejnyUrzadWprowadzenia] (
    [Id]                DECIMAL (19)  NOT NULL,
    [UCWprowadzenia]    VARCHAR (8)   NULL,
    [UCWprowadzeniaPid] INT           NULL,
    [Nazwa]             VARCHAR (255) NULL,
    [UlicaNumer]        VARCHAR (35)  NULL,
    [KodPocztowy]       VARCHAR (9)   NULL,
    [Miejscowosc]       VARCHAR (35)  NULL,
    [Kraj]              CHAR (2)      NULL,
    [KrajPid]           INT           NULL,
    [IdDokPDS]          DECIMAL (19)  NULL,
    CONSTRAINT [PK_PDS_KolejnyUrzadWprowadzenia] PRIMARY KEY CLUSTERED ([Id] ASC)
);

