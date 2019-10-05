CREATE TABLE [intr2].[intr_zdarzenie] (
    [typ]          NCHAR (1)      NULL,
    [operator]     NVARCHAR (15)  NULL,
    [data_oper_od] DATETIME2 (3)  NULL,
    [data_oper_do] DATETIME2 (3)  NULL,
    [typ_pliku]    NVARCHAR (3)   NULL,
    [nazwa_pliku]  NVARCHAR (255) NULL,
    [wynik]        NCHAR (1)      NULL,
    [raport]       NVARCHAR (255) NULL,
    [id_zdarzen]   BIGINT         NOT NULL,
    CONSTRAINT [intr_zdarzenie$PK_INTR_ZDARZENIE] PRIMARY KEY CLUSTERED ([id_zdarzen] ASC) ON [FG_INTR2]
);

