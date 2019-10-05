CREATE TABLE [pdr].[c171_sezon] (
    [c171_sezon_id] INT           NOT NULL,
    [nazwa]         NVARCHAR (35) NULL,
    [wazny_do]      DATE          NOT NULL,
    [wazny_od]      DATE          NOT NULL,
    [c171_id]       INT           NULL,
    [nr]            INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([c171_sezon_id] ASC) ON [FG_PDR],
    CONSTRAINT [c171_sezon_c171_id_fkey] FOREIGN KEY ([c171_id]) REFERENCES [pdr].[c171] ([c171_id])
);

