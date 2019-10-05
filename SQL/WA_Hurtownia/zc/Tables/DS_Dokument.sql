﻿CREATE TABLE [zc].[DS_Dokument] (
    [IdDok]                 BIGINT       NOT NULL,
    [Identyfikator]         VARCHAR (40) NULL,
    [RodzajDok]             VARCHAR (4)  NULL,
    [WersjaXML]             VARCHAR (7)  NULL,
    [DataPrzeslania]        DATETIME     NULL,
    [UrzadRejestracji]      VARCHAR (8)  NULL,
    [UrzadRejestracjiPid]   INT          NULL,
    [PasRejestracji]        CHAR (2)     NULL,
    [Status]                CHAR (1)     NULL,
    [Placowka]              VARCHAR (8)  NULL,
    [PlacowkaPid]           INT          NULL,
    [NrCelina]              VARCHAR (40) NULL,
    [DataPrzyjecia]         DATETIME     NULL,
    [NrWlasny]              VARCHAR (14) NULL,
    [LokalizacjaMiejsce]    VARCHAR (17) NULL,
    [LokalizacjaUC]         VARCHAR (8)  NULL,
    [LokalizacjaUCPid]      INT          NULL,
    [LokalizacjaOpis]       VARCHAR (35) NULL,
    [TowarDataPrzedst]      DATETIME     NULL,
    [TerminNaPrzeznaczenie] DATETIME     NULL,
    [PotwierdzenieWywozu]   CHAR (1)     NULL,
    [NrCelina2]             VARCHAR (40) NULL,
    [SkladajacyMiejsce]     VARCHAR (35) NULL,
    [SkladajacyData]        DATETIME     NULL,
    [SprostowanieNrCelina]  VARCHAR (40) NULL,
    [SprostowanieNr]        SMALLINT     NULL,
    [SprostowanieData]      DATETIME     NULL,
    [IdPrzedstawiajacy]     INT          NULL,
    [IdSkladajacy]          INT          NULL,
    CONSTRAINT [PK_DS_Dokument] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DS_Dokument_IdPrzedstawiajacy_DS_Kontrahent_idKontrahenta] FOREIGN KEY ([IdPrzedstawiajacy]) REFERENCES [zc].[DS_Kontrahent] ([idKontrahenta]),
    CONSTRAINT [FK_DS_Dokument_IdSkladajacy_DS_Skladajacy_idSkladajacy] FOREIGN KEY ([IdSkladajacy]) REFERENCES [zc].[DS_Skladajacy] ([idSkladajacy]),
    CONSTRAINT [FK_DS_Dokument_LokalizacjaUCPid] FOREIGN KEY ([LokalizacjaUCPid]) REFERENCES [pdr].[c001] ([c001_id]),
    CONSTRAINT [FK_DS_Dokument_PlacowkaPid] FOREIGN KEY ([PlacowkaPid]) REFERENCES [pdr].[c001] ([c001_id]),
    CONSTRAINT [FK_DS_Dokument_UrzadRejestracjiPid] FOREIGN KEY ([UrzadRejestracjiPid]) REFERENCES [pdr].[c001] ([c001_id])
);

