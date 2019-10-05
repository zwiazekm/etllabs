CREATE TABLE [intr2].[slowniki] (
    [id_rodz_slow] NVARCHAR (6)    NOT NULL,
    [id_slown]     NVARCHAR (8)    NOT NULL,
    [symbol]       NVARCHAR (50)   NULL,
    [kwota]        NUMERIC (20, 2) NULL,
    [kwota2]       NUMERIC (20, 2) NULL,
    [data]         DATETIME2 (3)   NULL,
    [opis]         NVARCHAR (350)  NULL,
    [data_od]      DATETIME2 (3)   NULL,
    [data_do]      DATETIME2 (3)   NULL,
    [operator]     NVARCHAR (40)   NULL,
    CONSTRAINT [slowniki$pk_slowniki] PRIMARY KEY CLUSTERED ([id_rodz_slow] ASC, [id_slown] ASC)
);

