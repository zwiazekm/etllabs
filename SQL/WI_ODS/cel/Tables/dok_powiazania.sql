﻿CREATE TABLE [cel].[dok_powiazania] (
    [id_dok]  VARCHAR (30) NOT NULL,
    [typ]     CHAR (1)     NOT NULL,
    [PozId]   INT          NOT NULL,
    [SymDok]  VARCHAR (40) NULL,
    [RodzDok] VARCHAR (4)  NULL,
    CONSTRAINT [PK_DOK_POWIAZANIA] PRIMARY KEY CLUSTERED ([id_dok] ASC, [typ] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_POWI_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

