CREATE TABLE [ncts2].[SafeTIRRejAwaryjne] (
    [Id]                        BIGINT          NOT NULL,
    [NumerKarnetuTIR]           NVARCHAR (10)   NULL,
    [MRN]                       NVARCHAR (18)   NULL,
    [KodUC]                     NVARCHAR (8)    NULL,
    [Status]                    NVARCHAR (20)   NULL,
    [DataKontroli]              DATETIME        NULL,
    [NumerStronyKarnetuTIR]     NVARCHAR (2)    NULL,
    [TypRozladunku]             NVARCHAR (1)    NULL,
    [NumerRozladunku]           NVARCHAR (2)    NULL,
    [ZwolnienieZastrzezenia]    BIT             NULL,
    [IdKomunkatuUtworzenia]     NVARCHAR (1024) NULL,
    [IdKomunikatuUsuniecia]     NVARCHAR (1024) NULL,
    [AwaryjnyNumerReferencyjny] NVARCHAR (16)   NULL,
    [StatusData]                DATETIME        NULL,
    [KodBledu]                  INT             NULL,
    [IdUzytkownika]             BIGINT          NULL,
    CONSTRAINT [SafeTIRRejAwaryjne_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2]
);

