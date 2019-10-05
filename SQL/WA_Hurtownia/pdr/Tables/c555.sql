CREATE TABLE [pdr].[c555] (
    [c555_id]                       INT           NOT NULL,
    [code]                          VARCHAR (50)  NOT NULL,
    [creation_tm]                   DATETIME      NULL,
    [last_modification_tm]          DATETIME      NULL,
    [valid_from]                    DATE          NULL,
    [valid_to]                      DATE          NULL,
    [version_]                      INT           DEFAULT ((0)) NULL,
    [bec]                           VARCHAR (255) NULL,
    [nazwajm]                       VARCHAR (255) NULL,
    [opisbec]                       VARCHAR (255) NULL,
    [opiscn]                        VARCHAR (255) NULL,
    [opiskierunku]                  VARCHAR (255) NULL,
    [opispkwiu]                     VARCHAR (255) NULL,
    [opissitcnazwapublikacyjna]     VARCHAR (255) NULL,
    [opissitcpelny]                 VARCHAR (255) NULL,
    [pkwiu]                         VARCHAR (255) NULL,
    [sitc]                          VARCHAR (255) NULL,
    [wskaznikkierunkuprzeznaczenia] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([c555_id] ASC) ON [FG_PDR]
);

