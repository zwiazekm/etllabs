CREATE TABLE [pdr].[c3004] (
    [c3004_id]             INT           NOT NULL,
    [creation_tm]          DATETIME      NULL,
    [kodklasyfikacji]      VARCHAR (120) NULL,
    [last_modification_tm] DATETIME      NULL,
    [valid_to]             DATE          NULL,
    [version_]             BIGINT        DEFAULT ((0)) NOT NULL,
    [czescbudzetowa]       INT           NOT NULL,
    [kodgrupaekonomiczna]  VARCHAR (10)  NULL,
    [kodgrupazatrudnienia] VARCHAR (10)  NULL,
    [kodrodzajbudzetu]     VARCHAR (10)  NULL,
    [kodsymbolu]           VARCHAR (10)  NULL,
    [koddzialania]         VARCHAR (20)  NULL,
    [koddzialu]            VARCHAR (20)  NULL,
    [kodparagrafu]         VARCHAR (20)  NULL,
    [kodprogramu]          VARCHAR (20)  NULL,
    [kodprojektu]          VARCHAR (20)  NULL,
    [kodrozdzialu]         VARCHAR (20)  NULL,
    [rodzajprzeplywu]      INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([c3004_id] ASC)
);

