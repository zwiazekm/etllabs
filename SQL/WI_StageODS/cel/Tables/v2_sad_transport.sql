CREATE TABLE [cel].[v2_sad_transport] (
    [idDokNr]      BIGINT       NOT NULL,
    [Wewn_Granica] VARCHAR (1)  NOT NULL,
    [Rodzaj]       VARCHAR (1)  NULL,
    [Znaki]        VARCHAR (27) NULL,
    [Kraj]         VARCHAR (2)  NULL,
    CONSTRAINT [PK_V2_SAD_TRANSPORT] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [Wewn_Granica] ASC) WITH (FILLFACTOR = 90)
);

