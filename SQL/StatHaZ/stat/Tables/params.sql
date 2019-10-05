CREATE TABLE [stat].[params] (
    [section]     VARCHAR (20)  NOT NULL,
    [keyword]     VARCHAR (20)  NOT NULL,
    [value]       VARCHAR (255) NULL,
    [description] VARCHAR (80)  NULL,
    [id_jedn]     VARCHAR (20)  NULL,
    [parm_key]    VARCHAR (1)   NULL,
    CONSTRAINT [pk_params] PRIMARY KEY CLUSTERED ([section] ASC, [keyword] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [description]
    ON [stat].[params]([description]);


GO
CREATE STATISTICS [id_jedn]
    ON [stat].[params]([id_jedn]);


GO
CREATE STATISTICS [parm_key]
    ON [stat].[params]([parm_key]);


GO
CREATE STATISTICS [value]
    ON [stat].[params]([value]);

