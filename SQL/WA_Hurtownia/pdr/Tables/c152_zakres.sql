CREATE TABLE [pdr].[c152_zakres] (
    [c152_zakres_id] INT          NOT NULL,
    [zakres]         VARCHAR (50) NOT NULL,
    [c152_id]        INT          NULL,
    CONSTRAINT [PK__c152_zak__26891762CB7CA81F] PRIMARY KEY CLUSTERED ([c152_zakres_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c152_zakres_c152_id] FOREIGN KEY ([c152_id]) REFERENCES [pdr].[c152] ([c152_id])
);

