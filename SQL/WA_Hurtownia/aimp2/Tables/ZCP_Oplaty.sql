CREATE TABLE [aimp2].[ZCP_Oplaty] (
    [IdOplaty]                    NUMERIC (19)    NOT NULL,
    [IdDecyzjiAdmin]              NUMERIC (19)    NULL,
    [IdPODZ]                      NUMERIC (19)    NULL,
    [Kwota]                       NUMERIC (16, 2) NULL,
    [KwotaDoZabezpieczenia]       NUMERIC (16, 2) NULL,
    [PodstawaOplaty]              NUMERIC (16, 2) NULL,
    [DataOtrzymaniaPowiadomienia] DATETIME2 (3)   NULL,
    [DataPowiadomieniaODlugu]     DATETIME2 (3)   NULL,
    [KwotaZabezpieczona]          BIT             NOT NULL,
    [KwotaZaplacona]              BIT             NOT NULL,
    [MetodaPlatnosci]             NVARCHAR (1)    NULL,
    [MetodaPlatnosciPid]          INT             NULL,
    [Stawka]                      NUMERIC (17, 2) NULL,
    [TypOplaty]                   NVARCHAR (3)    NULL,
    [TypOplatyPid]                INT             NULL,
    CONSTRAINT [ZCP_Oplaty_PK] PRIMARY KEY CLUSTERED ([IdOplaty] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_Oplaty$FK_ZCP_DecyzjaAdministracyjna] FOREIGN KEY ([IdDecyzjiAdmin]) REFERENCES [aimp2].[ZCP_DecyzjaAdministracyjna] ([IdDecyzji])
);

