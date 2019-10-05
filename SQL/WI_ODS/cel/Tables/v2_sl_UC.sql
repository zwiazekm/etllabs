CREATE TABLE [cel].[v2_sl_UC] (
    [UC]              VARCHAR (8)  NULL,
    [UCNad]           VARCHAR (8)  NULL,
    [Nazwa]           VARCHAR (35) NULL,
    [UlicaNumer]      VARCHAR (35) NULL,
    [KodPocztowy]     VARCHAR (9)  NULL,
    [Miejscowosc]     VARCHAR (35) NULL,
    [Kraj]            VARCHAR (4)  NULL,
    [kod_izby_celnej] CHAR (2)     NULL
) ON [FG_CEL];

