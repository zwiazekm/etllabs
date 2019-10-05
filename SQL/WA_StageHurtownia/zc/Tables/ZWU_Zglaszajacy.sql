CREATE TABLE [zc].[ZWU_Zglaszajacy] (
    [Id]                    DECIMAL (19)  NOT NULL,
    [TIN]                   VARCHAR (17)  NULL,
    [Nazwa]                 NVARCHAR (35) NULL,
    [UlicaNumer]            NVARCHAR (35) NULL,
    [KodPocztowy]           VARCHAR (9)   NULL,
    [Miejscowosc]           NVARCHAR (35) NULL,
    [Kraj]                  CHAR (2)      NULL,
    [KrajPid]               INT           NULL,
    [REGON]                 VARCHAR (14)  NULL,
    [EORI]                  VARCHAR (17)  NULL,
    [Przedstawicielstwo]    CHAR (1)      NULL,
    [PrzedstawicielstwoPid] INT           NULL,
    [WskaznikEksportera]    VARCHAR (5)   NULL,
    [WskaznikEksporteraPid] INT           NULL,
    [DataWpisuNaListe]      DATETIME      NULL,
    [NrWpisuNaListe]        NVARCHAR (35) NULL,
    [IdDokZWU]              DECIMAL (19)  NOT NULL,
    CONSTRAINT [PK_ZWU_Zglaszajacy] PRIMARY KEY CLUSTERED ([Id] ASC)
);

