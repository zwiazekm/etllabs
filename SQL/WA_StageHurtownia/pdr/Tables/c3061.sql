CREATE TABLE [pdr].[c3061] (
    [c3061_id]                    INT           NOT NULL,
    [creation_tm]                 DATETIME      NULL,
    [kodformyprawnej]             VARCHAR (4)   NOT NULL,
    [last_modification_tm]        DATETIME      NULL,
    [valid_from]                  DATE          NOT NULL,
    [valid_to]                    DATE          NULL,
    [version_]                    BIGINT        NOT NULL,
    [kodszczegolnejformyprawnej]  VARCHAR (7)   NOT NULL,
    [opisformyprawnej]            NVARCHAR (50) NOT NULL,
    [opisszczegolnejformyprawnej] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([c3061_id] ASC)
);

