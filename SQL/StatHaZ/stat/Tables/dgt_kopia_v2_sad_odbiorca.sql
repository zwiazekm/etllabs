CREATE TABLE [stat].[dgt_kopia_v2_sad_odbiorca] (
    [idDokNr]     BIGINT   NOT NULL,
    [idKntr]      INT      NOT NULL,
    [PozId]       SMALLINT NOT NULL,
    [generacjaId] INT      NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_sad_odbiorca] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [idKntr] ASC, [PozId] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [PozId]
    ON [stat].[dgt_kopia_v2_sad_odbiorca]([PozId]);

