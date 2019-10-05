﻿CREATE TABLE [tr].[WersjaOperacjiTranzytowej] (
    [SIDOperacjiTranzytowej] INT         NOT NULL,
    [NumerWersji]            DECIMAL (3) NOT NULL,
    [StatusWersji]           CHAR (1)    NOT NULL,
    [TypWersji]              CHAR (1)    NOT NULL,
    CONSTRAINT [PK_WersjaOperacjiTranzytowej] PRIMARY KEY CLUSTERED ([SIDOperacjiTranzytowej] ASC, [NumerWersji] ASC)
);

