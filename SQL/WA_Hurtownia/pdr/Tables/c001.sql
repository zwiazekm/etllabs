CREATE TABLE [pdr].[c001] (
    [c001_id]              INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [email]                VARCHAR (70)   NULL,
    [fax]                  VARCHAR (40)   NULL,
    [geo_info]             VARCHAR (6)    NULL,
    [kod_pocztowy]         VARCHAR (9)    NOT NULL,
    [kod_urzedu]           VARCHAR (8)    NOT NULL,
    [kraj]                 VARCHAR (2)    NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [miejscowosc]          NVARCHAR (35)  NOT NULL,
    [nazwa_krotka]         NVARCHAR (35)  NOT NULL,
    [nazwa_pelna]          NVARCHAR (255) NOT NULL,
    [poczta]               NVARCHAR (35)  NULL,
    [rodzaj]               VARCHAR (1)    NULL,
    [telefon]              VARCHAR (40)   NULL,
    [uc_nadrzedny]         VARCHAR (8)    NULL,
    [ulica]                NVARCHAR (35)  NOT NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c001_id] ASC) ON [FG_PDR]
);


GO
CREATE NONCLUSTERED INDEX [IX_c001_KodUrzedu]
    ON [pdr].[c001]([kod_urzedu] ASC)
    INCLUDE([valid_from], [valid_to])
    ON [FG_PDR];

