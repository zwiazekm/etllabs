CREATE TABLE [aimp2].[ZCP_TowarInformacjaWDZ] (
    [IdInformacji]                   NUMERIC (19)    NOT NULL,
    [IdTowarZCP]                     NUMERIC (19)    NULL,
    [KwotaWDZ]                       NUMERIC (16, 2) NOT NULL,
    [UzytaKwotaZabezpieczenia]       NUMERIC (16, 2) NULL,
    [KomentarzDoWDZ]                 NVARCHAR (1024) NULL,
    [KodDostepu]                     NVARCHAR (4)    NULL,
    [KodInnegoRodzajuZabezpieczenia] NVARCHAR (35)   NULL,
    [KodGRN]                         NVARCHAR (50)   NULL,
    [MRN]                            NVARCHAR (18)   NULL,
    [NumerKolejnegoWDZ]              NUMERIC (5)     NULL,
    [IdKontyngentu]                  NUMERIC (19)    NULL,
    [StatusWyslaniaDoOSOZ]           NVARCHAR (20)   NOT NULL,
    [StatusWyslaniaDoZefira]         NVARCHAR (20)   NOT NULL,
    [WyslanoKomunikatZC272]          BIT             NOT NULL,
    [StatusWDZ]                      NVARCHAR (4)    NULL,
    [TIN]                            NVARCHAR (17)   NULL,
    [NumerWDZ]                       NUMERIC (5)     NULL,
    CONSTRAINT [ZCP_TowarInformacjaWDZ_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC)
);

