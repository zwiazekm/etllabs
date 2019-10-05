CREATE TABLE [tr].[SlownikTowarowWrazliwych] (
    [SID]                  INT             NOT NULL,
    [IDJednostkiMiary]     CHAR (3)        NULL,
    [GranicaTerytoriumEWG] CHAR (1)        NULL,
    [IloscReferencyjna]    DECIMAL (14, 3) NULL,
    [KlasaHS]              VARCHAR (6)     NOT NULL,
    [KodTowarowWrazliwych] CHAR (2)        NULL,
    CONSTRAINT [PK_SlownikTowarowWrazliwych] PRIMARY KEY CLUSTERED ([SID] ASC)
);

