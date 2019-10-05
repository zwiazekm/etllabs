CREATE TABLE [zab].[ZlozenieZabezpieczenia] (
    [IdZlozeniaZabezp]               INT             NOT NULL,
    [Zrodlo]                         CHAR (3)        NOT NULL,
    [FormaZlozeniaZabezpieczeniaPid] INT             NOT NULL,
    [IdGwarancji]                    INT             NULL,
    [IdPotwierdzenia]                INT             NULL,
    [IdHipoteki]                     INT             NULL,
    [IdPokwitowaniaPotwierdzenia]    INT             NULL,
    [IdZabezpieczenia]               INT             NULL,
    [KwotaUdzielonaNaZabezp]         DECIMAL (19, 2) NULL,
    [Opis]                           VARCHAR (4000)  NULL,
    CONSTRAINT [PK_ZlozenieZabezpieczenia] PRIMARY KEY CLUSTERED ([IdZlozeniaZabezp] ASC, [Zrodlo] ASC)
);

