CREATE TABLE [pdr].[c3020] (
    [c3020_id]                   INT           NOT NULL,
    [creation_tm]                DATETIME      NULL,
    [idkosztu]                   BIGINT        NOT NULL,
    [kodtytplatikoszwytworzenia] VARCHAR (255) NULL,
    [kodbanderoli]               VARCHAR (20)  NOT NULL,
    [kodtytuluplatnosci]         VARCHAR (10)  NOT NULL,
    [kosztwytworzenia]           VARCHAR (32)  NOT NULL,
    [last_modification_tm]       DATETIME      NULL,
    [nanoszone]                  VARCHAR (30)  NULL,
    [rodzaj]                     VARCHAR (30)  NULL,
    [typbanderoli]               VARCHAR (10)  NOT NULL,
    [valid_from]                 DATE          NOT NULL,
    [valid_to]                   DATE          NULL,
    [version_]                   BIGINT        DEFAULT ((0)) NOT NULL,
    [wartosc]                    NVARCHAR (16) NOT NULL,
    [wyroby]                     VARCHAR (30)  NULL,
    PRIMARY KEY CLUSTERED ([c3020_id] ASC)
);

