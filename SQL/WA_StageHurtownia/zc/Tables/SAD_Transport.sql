CREATE TABLE [zc].[SAD_Transport] (
    [IdDok]                 BIGINT       NOT NULL,
    [GranicznyWewnetrzny]   CHAR (1)     NOT NULL,
    [ZnakiP18]              VARCHAR (27) NULL,
    [ZnakiP21]              VARCHAR (27) NULL,
    [Kraj]                  CHAR (2)     NULL,
    [KrajPid]               INT          NULL,
    [RodzajTranspNaGran]    CHAR (1)     NULL,
    [RodzajTranspNaGranPid] INT          NULL,
    [RodzajTranspWewn]      CHAR (1)     NULL,
    [RodzajTranspWewnPid]   INT          NULL,
    CONSTRAINT [PK_SAD_Transport] PRIMARY KEY CLUSTERED ([IdDok] ASC, [GranicznyWewnetrzny] ASC)
);

