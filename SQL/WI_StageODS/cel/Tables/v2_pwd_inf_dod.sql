CREATE TABLE [cel].[v2_pwd_inf_dod] (
    [idDokNr]     BIGINT        NOT NULL,
    [PozId]       SMALLINT      NOT NULL,
    [Towar_PozId] SMALLINT      NOT NULL,
    [Kod]         VARCHAR (5)   NULL,
    [Tekst]       VARCHAR (255) NULL,
    CONSTRAINT [PK_V2_PWD_INF_DOD] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Towar_PozId] ASC)
);

