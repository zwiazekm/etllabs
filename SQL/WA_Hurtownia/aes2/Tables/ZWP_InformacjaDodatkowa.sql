﻿CREATE TABLE [aes2].[ZWP_InformacjaDodatkowa] (
    [Id]              NUMERIC (19)  NOT NULL,
    [KodInfDod]       NVARCHAR (5)  NULL,
    [KodInfDodPid]    NVARCHAR (5)  NULL,
    [Tekst]           NVARCHAR (70) NULL,
    [KodJezykaInfDod] NVARCHAR (2)  NULL,
    [IdTowarZWP]      NUMERIC (19)  NULL,
    CONSTRAINT [ZWP_InformacjaDodatkowa$PK_ZWP_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWP_InformacjaDodatkowa_IdTowarZWP__ZWP_Towar_id] FOREIGN KEY ([IdTowarZWP]) REFERENCES [aes2].[ZWP_Towar] ([id])
);

