CREATE TABLE [int].[INTRASTAT_DeklaracjaWynikowa] (
    [IdDeklWynikowej] VARCHAR (30) NOT NULL,
    [Status]          CHAR (1)     NULL,
    [NIP]             VARCHAR (10) NULL,
    [REGON]           VARCHAR (14) NULL,
    [Typ]             CHAR (1)     NULL,
    [TypPid]          INT          NULL,
    [Rok]             INT          NULL,
    [Miesiac]         INT          NULL,
    [NrWersji]        CHAR (3)     NULL,
    CONSTRAINT [PK_INTRASTAT_DeklaracjaWynikowa] PRIMARY KEY CLUSTERED ([IdDeklWynikowej] ASC)
);

