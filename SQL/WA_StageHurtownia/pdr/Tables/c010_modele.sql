CREATE TABLE [pdr].[c010_modele] (
    [c010_modele_id]        INT            NOT NULL,
    [dostawczylubciezarowy] BIT            NULL,
    [model]                 NVARCHAR (255) NULL,
    [osobowy]               BIT            NULL,
    [c010_id]               INT            NULL,
    PRIMARY KEY CLUSTERED ([c010_modele_id] ASC)
);

