CREATE TABLE [pdr].[c152_reprezentantosobafizyczna] (
    [c152_reprezentantosobafizyczna_id] INT          NOT NULL,
    [rin]                               VARCHAR (17) NOT NULL,
    [zakres]                            VARCHAR (4)  NOT NULL,
    [c152_id]                           INT          NULL,
    PRIMARY KEY CLUSTERED ([c152_reprezentantosobafizyczna_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c152_reprezentantosobafizyczna_c152_id] FOREIGN KEY ([c152_id]) REFERENCES [pdr].[c152] ([c152_id])
);

