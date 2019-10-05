CREATE TABLE [ncts2].[ref_swieta_daty] (
    [id]             BIGINT       NOT NULL,
    [swieto_id]      BIGINT       NULL,
    [swieto_ruchome] BIT          NULL,
    [dzien]          NVARCHAR (2) NULL,
    [miesiac]        NVARCHAR (2) NULL,
    [rok]            SMALLINT     NULL,
    CONSTRAINT [ref_swieta_daty_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ref_swieta_daty_swieto_id_id_fk] FOREIGN KEY ([swieto_id]) REFERENCES [ncts2].[ref_swieta] ([id])
);

