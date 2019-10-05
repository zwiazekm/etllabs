﻿CREATE TABLE [aes2].[TRS_DokumentyDeklaracji] (
    [Id]                 NUMERIC (19)  NOT NULL,
    [IdPozycjiTRS]       NUMERIC (19)  NULL,
    [NrPozycjiWywozowej] INT           NULL,
    [KodDokumentu]       NVARCHAR (4)  NULL,
    [NumerDokumentu]     NVARCHAR (35) NULL,
    [Uwagi]              NVARCHAR (26) NULL,
    [Wersja]             INT           NOT NULL,
    CONSTRAINT [TRS_DokumentyDeklaracji$PK_TRS_DokumentyDeklaracji] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__TRS_DokumentyDeklaracji_IdPozycjiTRS__TRS_Pozycje_id] FOREIGN KEY ([IdPozycjiTRS]) REFERENCES [aes2].[TRS_Pozycje] ([Id])
);

