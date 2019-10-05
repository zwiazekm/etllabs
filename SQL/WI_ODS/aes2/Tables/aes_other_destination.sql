CREATE TABLE [aes2].[aes_other_destination] (
    [id]                 NUMERIC (19)    NOT NULL,
    [decl_id]            NUMERIC (19)    NOT NULL,
    [mrn]                NVARCHAR (35)   NULL,
    [gross_mass]         NUMERIC (22, 6) NULL,
    [assigned_date]      DATETIME2 (3)   NULL,
    [return_date]        DATETIME2 (3)   NULL,
    [quantity]           NUMERIC (22, 6) NULL,
    [type]               NVARCHAR (35)   NULL,
    [measure_unit]       NVARCHAR (3)    NULL,
    [kind_of_packages]   NVARCHAR (2)    NULL,
    [number_of_packages] INT             NULL,
    [marks_of_packages]  NVARCHAR (512)  NULL,
    [reamarks]           NVARCHAR (1024) NULL,
    CONSTRAINT [aes_other_destination$pk_aes_other_destination] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [aes_other_destination$fk_aes_other] FOREIGN KEY ([decl_id]) REFERENCES [aes2].[aes_other] ([decl_id])
);

