﻿CREATE TABLE [aimp2].[DSK_PodmiotLancuchDostawDeklaracja] (
    [IdWpisu]      NUMERIC (19)  NOT NULL,
    [IdDok]        NUMERIC (19)  NOT NULL,
    [IdPodmiotu]   NVARCHAR (17) NOT NULL,
    [RolaPodmiotu] NCHAR (3)     NOT NULL,
    CONSTRAINT [DSK_PodmiotLancuchDostawDeklaracja_PK] PRIMARY KEY CLUSTERED ([IdWpisu] ASC)
);

