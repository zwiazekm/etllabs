CREATE TABLE [intr2].[istat_komunikat_popup] (
    [id]            NUMERIC (19)    NOT NULL,
    [content]       NVARCHAR (1000) NOT NULL,
    [creation_date] DATETIME2 (3)   NULL,
    CONSTRAINT [istat_komunikat_popup$pk_istat_komunikat_popup] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_INTR2]
);

