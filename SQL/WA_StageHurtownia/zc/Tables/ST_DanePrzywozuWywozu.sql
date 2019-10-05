CREATE TABLE [zc].[ST_DanePrzywozuWywozu] (
    [IdDok]               VARCHAR (30)  NOT NULL,
    [Typ]                 CHAR (1)      NOT NULL,
    [Port]                VARCHAR (35)  NULL,
    [LiczbaPasazerow]     NUMERIC (5)   NULL,
    [LiczbaZalogi]        NUMERIC (5)   NULL,
    [LiczbaPozTowarowych] NUMERIC (5)   NULL,
    [CzyKontenery]        BIT           NULL,
    [CzyKonteneryPuste]   BIT           NULL,
    [CzyTowarTranzyt]     BIT           NULL,
    [OpisTowaru]          VARCHAR (140) NULL,
    CONSTRAINT [PK_ST_DanePrzywozuWywozu] PRIMARY KEY CLUSTERED ([IdDok] ASC, [Typ] ASC)
);

