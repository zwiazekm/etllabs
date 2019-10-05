CREATE TABLE [pdr].[c3065] (
    [c3065_id]               INT            NOT NULL,
    [creation_tm]            DATETIME       NULL,
    [kodrodzajunaleznosci]   VARCHAR (10)   NOT NULL,
    [kodtypudochodow]        VARCHAR (30)   NOT NULL,
    [kodtypuodsetek]         VARCHAR (15)   NULL,
    [last_modification_tm]   DATETIME       NULL,
    [nazwarodzajunaleznosci] NVARCHAR (120) NOT NULL,
    [valid_from]             DATE           NOT NULL,
    [valid_to]               DATE           NULL,
    [version_]               BIGINT         DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c3065_id] ASC)
);

