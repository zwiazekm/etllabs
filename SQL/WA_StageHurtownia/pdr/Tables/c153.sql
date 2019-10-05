CREATE TABLE [pdr].[c153] (
    [c153_id]                INT            NOT NULL,
    [aktywne]                BIT            NOT NULL,
    [creation_tm]            DATETIME       NULL,
    [czas_na_dt]             INT            NULL,
    [data_wydania]           DATE           NOT NULL,
    [froma]                  VARCHAR (1)    NOT NULL,
    [last_modification_tm]   DATETIME       NULL,
    [nr]                     NVARCHAR (40)  NOT NULL,
    [odroczenie_platnosci]   BIT            NULL,
    [powiadomienie_zbiorcze] BIT            NULL,
    [termin_rozliczenia]     INT            NULL,
    [tin]                    VARCHAR (17)   NULL,
    [typ_rozliczenia]        VARCHAR (1)    NULL,
    [urzad_wydania]          VARCHAR (8)    NOT NULL,
    [uwagi]                  NVARCHAR (512) NULL,
    [valid_from]             DATE           NOT NULL,
    [valid_to]               DATE           NULL,
    [version_]               BIGINT         DEFAULT ((0)) NOT NULL,
    [wpgp]                   BIT            NULL,
    [id_old_pdr]             VARCHAR (20)   NULL,
    PRIMARY KEY CLUSTERED ([c153_id] ASC)
);

