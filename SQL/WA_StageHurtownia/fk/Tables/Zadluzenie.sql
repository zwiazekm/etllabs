CREATE TABLE [fk].[Zadluzenie] (
    [IdDok]                      VARCHAR (30)    NOT NULL,
    [IdKomorki]                  VARCHAR (20)    NULL,
    [IdPodmiotu]                 INT             NULL,
    [NumerSprawy]                VARCHAR (30)    NULL,
    [DataWystawieniaDokumentu]   DATETIME        NULL,
    [NumerTytuluWykonawczego]    VARCHAR (30)    NULL,
    [DataSkierowaniaDoEgzekucji] DATETIME        NULL,
    [DataZakonczeniaEgzekucji]   DATETIME        NULL,
    [SposobZakonczeniaEgzekucji] CHAR (6)        NULL,
    [KwotaNaleznosci]            DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_Zadluzenie] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

