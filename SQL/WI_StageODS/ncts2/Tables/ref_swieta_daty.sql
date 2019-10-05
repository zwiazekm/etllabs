CREATE TABLE [ncts2].[ref_swieta_daty] (
    [id]             BIGINT       NOT NULL,
    [swieto_id]      BIGINT       NULL,
    [swieto_ruchome] BIT          NULL,
    [dzien]          NVARCHAR (2) NULL,
    [miesiac]        NVARCHAR (2) NULL,
    [rok]            SMALLINT     NULL,
    CONSTRAINT [ref_swieta_daty_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

