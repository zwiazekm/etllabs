CREATE TABLE [pdr].[c4003_kanalykomunikacji] (
    [c4003_kanalykomunikacji_id] BIGINT         NOT NULL,
    [adreskanalu]                VARCHAR (400)  NULL,
    [datado]                     DATE           NULL,
    [dataod]                     DATE           NULL,
    [haslokanalu]                NVARCHAR (255) NULL,
    [loginkanalu]                NVARCHAR (100) NULL,
    [nazwaepuap]                 NVARCHAR (100) NULL,
    [odciskpalcakanalu]          VARCHAR (1000) NULL,
    [system]                     VARCHAR (20)   NULL,
    [typkanalu]                  CHAR (1)       NOT NULL,
    [c4003_id]                   BIGINT         NULL,
    PRIMARY KEY CLUSTERED ([c4003_kanalykomunikacji_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_kanalykomunikacji_c4003_id_fkey] FOREIGN KEY ([c4003_id]) REFERENCES [pdr].[c4003] ([c4003_id])
);

