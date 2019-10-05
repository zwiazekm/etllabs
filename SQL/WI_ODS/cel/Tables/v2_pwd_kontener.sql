﻿CREATE TABLE [cel].[v2_pwd_kontener] (
    [idDokNr]        BIGINT       NOT NULL,
    [PozId]          SMALLINT     NOT NULL,
    [Kontener_PozId] SMALLINT     NOT NULL,
    [Nr]             VARCHAR (17) NULL,
    CONSTRAINT [PK_V2_PWD_KONTENER] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Kontener_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_PWD_KONTEN_TOWAR] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_towar] ([idDokNr], [PozId])
);

