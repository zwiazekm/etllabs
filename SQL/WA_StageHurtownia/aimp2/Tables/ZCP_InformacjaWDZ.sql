CREATE TABLE [aimp2].[ZCP_InformacjaWDZ] (
    [IdInformacji]               NUMERIC (19)    NOT NULL,
    [IdDok]                      NUMERIC (19)    NULL,
    [Autor]                      NVARCHAR (255)  NULL,
    [Komentarz]                  NVARCHAR (1024) NULL,
    [MRN]                        NVARCHAR (18)   NULL,
    [NumerWlasnyWDZ]             NVARCHAR (35)   NULL,
    [NumerWlasnyKomunikatuZC282] NVARCHAR (35)   NULL,
    [NumerWlasnyKomunikatuZC283] NVARCHAR (35)   NULL,
    [StatusWDZ]                  NVARCHAR (4)    NULL,
    [TIN]                        NVARCHAR (17)   NULL,
    [NumerWDZ]                   NUMERIC (5)     NULL,
    CONSTRAINT [ZCP_InformacjaWDZ_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC)
);

