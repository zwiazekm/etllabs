CREATE TABLE [pdr].[c228_towar] (
    [c228_towar_id] INT             NOT NULL,
    [ilosc]         NUMERIC (38, 5) NULL,
    [jm]            VARCHAR (3)     NULL,
    [kod_dodatkowy] VARCHAR (4)     NULL,
    [kod_towaru]    VARCHAR (10)    NOT NULL,
    [waluta]        VARCHAR (3)     NULL,
    [wartosc]       BIGINT          NULL,
    [c228_id]       INT             NULL,
    PRIMARY KEY CLUSTERED ([c228_towar_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c228_towar_c228_id] FOREIGN KEY ([c228_id]) REFERENCES [pdr].[c228] ([c228_id])
);

