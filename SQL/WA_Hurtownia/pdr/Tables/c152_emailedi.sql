CREATE TABLE [pdr].[c152_emailedi] (
    [c152_emailedi_id] INT          NOT NULL,
    [email]            VARCHAR (70) NOT NULL,
    [c152_id]          INT          NULL,
    PRIMARY KEY CLUSTERED ([c152_emailedi_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c152_emailedi_c152_id] FOREIGN KEY ([c152_id]) REFERENCES [pdr].[c152] ([c152_id])
);

