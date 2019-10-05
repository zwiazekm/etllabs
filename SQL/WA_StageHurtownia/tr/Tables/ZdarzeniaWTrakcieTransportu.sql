CREATE TABLE [tr].[ZdarzeniaWTrakcieTransportu] (
    [MRN]              VARCHAR (21)  NOT NULL,
    [Sekwencja]        SMALLINT      NOT NULL,
    [IDKrajuZdarzenia] CHAR (2)      NULL,
    [CzyJuzWNCTS]      BIT           NULL,
    [CzyWDrodze]       BIT           NULL,
    [KodJezykaMiejsca] CHAR (2)      NULL,
    [LiczbaPlomb]      DECIMAL (4)   NULL,
    [Miejsce]          VARCHAR (105) NULL,
    CONSTRAINT [PK_ZdarzeniaWTrakcieTransportu] PRIMARY KEY CLUSTERED ([MRN] ASC, [Sekwencja] ASC)
);

