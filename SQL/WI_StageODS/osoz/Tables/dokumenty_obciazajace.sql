CREATE TABLE [osoz].[dokumenty_obciazajace] (
    [id]                       BIGINT          NOT NULL,
    [czas_modyfikacji]         DATETIME        NULL,
    [kwota_naleznosci]         NUMERIC (19, 2) NULL,
    [numer_dokumentu]          NVARCHAR (100)  NOT NULL,
    [termin_zaplaty_dokumentu] DATETIME        NULL,
    CONSTRAINT [PK__dokument__3213E83F11A48CA0] PRIMARY KEY CLUSTERED ([id] ASC)
);

