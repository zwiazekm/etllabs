CREATE TABLE [zc].[PWD_Transport] (
    [IdDok]               BIGINT       NOT NULL,
    [IdPozycji]           SMALLINT     NOT NULL,
    [RodzajTransportu]    CHAR (1)     NULL,
    [RodzajTransportuPid] INT          NULL,
    [ZnakiTransportu]     VARCHAR (27) NULL,
    [Kraj]                CHAR (2)     NULL,
    [KrajPid]             INT          NULL,
    CONSTRAINT [PK_PWD_Transport] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

