CREATE TABLE [stat].[dgt_kopia_v2_sad_transport] (
    [idDokNr]      BIGINT       NOT NULL,
    [Wewn_Granica] CHAR (1)     NOT NULL,
    [Rodzaj]       CHAR (1)     NULL,
    [Znaki]        VARCHAR (27) NULL,
    [Kraj]         VARCHAR (2)  NULL,
    [generacjaId]  INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_sad_transport] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [Wewn_Granica] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [Znaki]
    ON [stat].[dgt_kopia_v2_sad_transport]([Znaki]);

