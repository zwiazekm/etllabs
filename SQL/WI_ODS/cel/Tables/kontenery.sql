﻿CREATE TABLE [cel].[kontenery] (
    [id_dok] VARCHAR (30) NOT NULL,
    [PozId]  NUMERIC (2)  NOT NULL,
    [Nr]     VARCHAR (40) NULL,
    CONSTRAINT [PK_KONTENERY] PRIMARY KEY CLUSTERED ([id_dok] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_KONTENER_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

