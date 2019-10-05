CREATE TABLE [stat].[dgt_info] (
    [in_id]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [in_opis] VARCHAR (1000) NULL,
    [in_czas] DATETIME       NULL
);


GO
CREATE CLUSTERED INDEX [CI_dgt_info]
    ON [stat].[dgt_info]([in_id] ASC)
    ON [StatDane];

