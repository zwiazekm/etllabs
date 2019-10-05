CREATE TABLE [ncts2].[UpowOdbiorca] (
    [Id]                    BIGINT        NOT NULL,
    [DataZapytania]         DATETIME      NULL,
    [DataOdpowiedzi]        DATETIME      NULL,
    [Status]                NVARCHAR (10) NULL,
    [TIN]                   NVARCHAR (17) NULL,
    [UrzadPytany]           NVARCHAR (8)  NULL,
    [IdKomunikatZapytania]  BIGINT        NULL,
    [IdKomunikatOdpowiedzi] BIGINT        NULL,
    [KodOdpowiedzi]         NVARCHAR (1)  NULL,
    [UrzadPytajacy]         NVARCHAR (8)  NULL,
    CONSTRAINT [upowazniony_odbiorca_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

