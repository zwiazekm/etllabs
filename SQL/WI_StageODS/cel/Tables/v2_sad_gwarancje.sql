CREATE TABLE [cel].[v2_sad_gwarancje] (
    [idDokNr] BIGINT      NOT NULL,
    [PozId]   SMALLINT    NOT NULL,
    [Rodzaj]  VARCHAR (1) NULL,
    CONSTRAINT [PK_V2_SAD_GWARANCJE] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

