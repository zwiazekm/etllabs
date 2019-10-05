CREATE TABLE [cel].[v2_sad_nadawca] (
    [idDokNr] BIGINT       NOT NULL,
    [idKntr]  INT          NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [EORI]    VARCHAR (20) NULL,
    CONSTRAINT [PK_V2_SAD_NADAWCA] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [idKntr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

