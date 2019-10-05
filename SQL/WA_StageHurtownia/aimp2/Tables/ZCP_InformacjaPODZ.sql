CREATE TABLE [aimp2].[ZCP_InformacjaPODZ] (
    [IdInformacji]                   NUMERIC (19)    NOT NULL,
    [IdTowarZCP]                     NUMERIC (19)    NULL,
    [KwotaPODZ]                      NUMERIC (16, 2) NOT NULL,
    [UzytaKwota]                     NUMERIC (16, 2) NULL,
    [KomentarzDoPODZ]                NVARCHAR (1024) NULL,
    [KodDostepu]                     NVARCHAR (4)    NULL,
    [KodInnegoRodzajuZabezpieczenia] NVARCHAR (35)   NULL,
    [KodGRN]                         NVARCHAR (50)   NULL,
    [MRN]                            NVARCHAR (18)   NULL,
    [NumerPODZ]                      NUMERIC (5)     NULL,
    [NumerWlasnyPODZ]                NVARCHAR (35)   NULL,
    [IdKontyngentu]                  NUMERIC (19)    NULL,
    [StatusWyslaniaDoOSOZ]           NVARCHAR (20)   NOT NULL,
    [StatusWyslaniaDoZefir]          NVARCHAR (20)   NOT NULL,
    [WyslanoKomunikatZC272]          BIT             NOT NULL,
    [StatusPODZ]                     NVARCHAR (4)    NULL,
    [TIN]                            NVARCHAR (17)   NULL,
    CONSTRAINT [ZCP_InformacjaPODZ_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC)
);

