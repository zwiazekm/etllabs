CREATE TABLE [fk].[SprawozdanieMeldunkowe] (
    [IdDok]                    VARCHAR (30) NOT NULL,
    [IdJednostki]              VARCHAR (20) NULL,
    [IdJednostkiPid]           INT          NULL,
    [IdRodzajuDokumentu]       CHAR (4)     NULL,
    [SymbolDokumentu]          VARCHAR (30) NULL,
    [DataWystawieniaDokumentu] DATETIME     NULL,
    [Status]                   CHAR (1)     NULL,
    [DataZamkniecia]           DATETIME     NULL,
    [DataWykonania]            DATETIME     NULL,
    [DataDo]                   DATETIME     NULL,
    [OkresOd]                  INT          NULL,
    [OkresDo]                  INT          NULL,
    CONSTRAINT [PK_SprawozdanieMeldunkowe] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

