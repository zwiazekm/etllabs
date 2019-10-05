CREATE TABLE [stat].[dgt_kopia_slowniki_pk_2010] (
    [symbol]       VARCHAR (8)  NOT NULL,
    [kwota1]       DECIMAL (18) NULL,
    [kwota2]       DECIMAL (18) NULL,
    [id_rodz_slow] VARCHAR (6)  NOT NULL,
    CONSTRAINT [IX_dgt_kopia_slowniki_pk_2010] UNIQUE CLUSTERED ([symbol] ASC, [id_rodz_slow] ASC)
);

