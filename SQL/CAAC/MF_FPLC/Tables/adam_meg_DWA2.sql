CREATE TABLE [MF\FPLC].[adam_meg_DWA2] (
    [decl_id]        NUMERIC (19)   NOT NULL,
    [Okres]          VARCHAR (9)    NULL,
    [id]             NUMERIC (19)   NOT NULL,
    [MRN]            NVARCHAR (35)  NULL,
    [MRNzPoz]        NVARCHAR (44)  NULL,
    [decl_type]      NVARCHAR (3)   NULL,
    [od]             DATETIME       NULL,
    [do]             DATETIME       NULL,
    [ZROBIONO]       DATETIME       NOT NULL,
    [log_co]         NVARCHAR (8)   NULL,
    [exp_co_of_exit] NVARCHAR (8)   NULL,
    [KotTrsp]        NVARCHAR (255) NULL,
    [AEO]            VARCHAR (1)    NOT NULL,
    [KodZalacznika]  VARCHAR (1)    NOT NULL,
    [UprawnAEO]      VARCHAR (1)    NOT NULL,
    [krajTraf]       NVARCHAR (255) NULL,
    [typ]            FLOAT (53)     NULL
);

