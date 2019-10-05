CREATE TABLE [fk].[Decyzja65] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [IdPodmiotu]           INT             NULL,
    [IdKomorki]            VARCHAR (20)    NULL,
    [IDRodzajuDokumentu]   CHAR (4)        NULL,
    [NumerDecyzji]         VARCHAR (30)    NULL,
    [DataDecyzji]          DATETIME        NULL,
    [OdsetkiZaplacone]     DECIMAL (38, 2) NULL,
    [Status]               CHAR (1)        NULL,
    [NumerDokumentuSprawy] VARCHAR (30)    NULL,
    CONSTRAINT [PK_DEC65] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

