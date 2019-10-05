CREATE TABLE [pdr].[c232_sezon] (
    [c232_sezon_id] INT           NOT NULL,
    [nazwa]         NVARCHAR (35) NULL,
    [wazny_do]      DATE          NOT NULL,
    [wazny_od]      DATE          NOT NULL,
    [c232_id]       INT           NULL,
    [nr]            INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([c232_sezon_id] ASC) ON [FG_PDR],
    CONSTRAINT [c232_sezon_c232_id_fkey] FOREIGN KEY ([c232_id]) REFERENCES [pdr].[c232] ([c232_id])
);

