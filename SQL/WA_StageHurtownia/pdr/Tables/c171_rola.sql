CREATE TABLE [pdr].[c171_rola] (
    [c171_rola_id]    INT         NOT NULL,
    [rola]            VARCHAR (3) NOT NULL,
    [transport]       VARCHAR (3) NOT NULL,
    [c171_pozycja_id] INT         NULL,
    PRIMARY KEY CLUSTERED ([c171_rola_id] ASC)
);

