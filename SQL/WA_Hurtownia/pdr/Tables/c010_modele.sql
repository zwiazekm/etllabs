CREATE TABLE [pdr].[c010_modele] (
    [c010_modele_id]        INT            NOT NULL,
    [dostawczylubciezarowy] BIT            NULL,
    [model]                 NVARCHAR (255) NULL,
    [osobowy]               BIT            NULL,
    [c010_id]               INT            NULL,
    PRIMARY KEY CLUSTERED ([c010_modele_id] ASC) ON [FG_PDR],
    CONSTRAINT [c010_modele_c010_id_fkey] FOREIGN KEY ([c010_id]) REFERENCES [pdr].[c010] ([c010_id])
);

