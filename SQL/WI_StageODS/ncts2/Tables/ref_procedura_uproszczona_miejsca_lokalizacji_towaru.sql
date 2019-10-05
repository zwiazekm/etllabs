CREATE TABLE [ncts2].[ref_procedura_uproszczona_miejsca_lokalizacji_towaru] (
    [id]                                               BIGINT        NOT NULL,
    [pozwolenie_na_procedure_uproszczona_id]           BIGINT        NULL,
    [numer_miejsca]                                    NVARCHAR (17) NULL,
    [czas_decyzje_tranzyt]                             INT           NULL,
    [zgoda_po_godzinach_pracy_urzedu_uc_wyjscia]       BIT           NULL,
    [zgoda_po_godzinach_pracy_urzedy_uc_przeznaczenia] BIT           NULL,
    [kod_urzedu]                                       NVARCHAR (8)  NULL,
    CONSTRAINT [ref_procedura_uproszczona_miejsca_lokalizacji_towaru_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

