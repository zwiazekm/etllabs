﻿CREATE TABLE [akc].[AKCEN_Deklaracja] (
    [IdDok]                            VARCHAR (30)    NOT NULL,
    [IdKomorki]                        VARCHAR (20)    NULL,
    [IdKomorkiPid]                     INT             NULL,
    [IdPodmiotu]                       INT             NULL,
    [RodzajDokumentu]                  CHAR (4)        NULL,
    [NumerDokumentu]                   VARCHAR (30)    NULL,
    [IdDokStowarzysz]                  VARCHAR (30)    NULL,
    [NumerDokumentuStowarzysz]         VARCHAR (30)    NULL,
    [IzbaCelnaZlozeniaDok]             VARCHAR (20)    NULL,
    [IzbaCelnaZlozeniaDokPid]          INT             NULL,
    [MiejsceZlozeniaDok]               VARCHAR (20)    NULL,
    [MiejsceZlozeniaDokPid]            INT             NULL,
    [ZnacznikKorekty]                  SMALLINT        NULL,
    [Status]                           CHAR (1)        NULL,
    [DataRejestrDokWSyst]              DATETIME        NULL,
    [DeklaracjaZaOkres]                DATE            NULL,
    [DataZlozeniaDok]                  DATE            NULL,
    [DataWplywuDok]                    DATE            NULL,
    [TerminPlatnosci]                  DATE            NULL,
    [KwotaPodatkuAkc]                  DECIMAL (19, 3) NULL,
    [ZwolnieniaObnizenia]              DECIMAL (19, 3) NULL,
    [DoZaplaty]                        DECIMAL (19, 3) NULL,
    [DataZlozeniaDeklaracjiPierwotnej] DATE            NULL,
    [CzyOstatniaWersjaDeklaracji]      BIT             NULL,
    CONSTRAINT [PK_AKCEN_Deklaracja] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

