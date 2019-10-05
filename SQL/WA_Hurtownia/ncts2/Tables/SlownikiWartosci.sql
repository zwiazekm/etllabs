﻿CREATE TABLE [ncts2].[SlownikiWartosci] (
    [Id]             BIGINT          NOT NULL,
    [IdTypuSlownika] BIGINT          NULL,
    [Kod]            NVARCHAR (100)  NULL,
    [WaznyOd]        DATETIME        NULL,
    [WaznyDo]        DATETIME        NULL,
    [OpisKodu]       NVARCHAR (2000) NULL,
    [OpisKoduENG]    NVARCHAR (2000) NULL,
    CONSTRAINT [SlownikiWartosci_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [SlownikiWartosci_IdTypuSlownika_SlownikiTypy_fk] FOREIGN KEY ([IdTypuSlownika]) REFERENCES [ncts2].[SlownikiTypy] ([Id])
);

