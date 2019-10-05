CREATE TABLE [pdr].[c152_grupa] (
    [c152_grupa_id] INT         NOT NULL,
    [grupa]         VARCHAR (2) NOT NULL,
    [c152_id]       INT         NULL,
    PRIMARY KEY CLUSTERED ([c152_grupa_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c152_grupa_c152_id] FOREIGN KEY ([c152_id]) REFERENCES [pdr].[c152] ([c152_id])
);

