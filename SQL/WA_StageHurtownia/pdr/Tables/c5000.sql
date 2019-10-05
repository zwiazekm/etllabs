CREATE TABLE [pdr].[c5000] (
    [id]                       INT            NOT NULL,
    [KodJednostki]             VARCHAR (50)   NULL,
    [validFrom]                DATETIME       NULL,
    [validTo]                  DATETIME       NULL,
    [NazwaJednostki]           NVARCHAR (200) NULL,
    [KodJednostkiNadrzednej]   VARCHAR (50)   NULL,
    [NazwaJednostkiNadrzednej] NVARCHAR (200) NULL,
    [KodTypuJednostki]         VARCHAR (50)   NULL,
    [NazwaTypuJednostki]       NVARCHAR (255) NULL,
    [KodRangikomorki]          VARCHAR (20)   NULL,
    [NazwaRangiKomorki]        NVARCHAR (50)  NULL,
    [IsJednostka]              BIT            NULL,
    [CzyKomorka]               BIT            NULL,
    [last_modification_tm]     DATETIME       NULL,
    CONSTRAINT [PK_c5000] PRIMARY KEY CLUSTERED ([id] ASC)
);

