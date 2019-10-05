CREATE TABLE [stat].[dot_wspolczynnik_f] (
    [typ]   VARCHAR (1)    NOT NULL,
    [RokMc] INT            NOT NULL,
    [f]     DECIMAL (5, 4) NULL,
    CONSTRAINT [PK_dot_wspolczynnik_f] PRIMARY KEY CLUSTERED ([typ] ASC, [RokMc] ASC)
);


GO
CREATE STATISTICS [f]
    ON [stat].[dot_wspolczynnik_f]([f]);

