CREATE TABLE [pdr].[c152_reprezentantpodmiotgospod] (
    [c152_reprezentantpodmiotgospod_id] INT          NOT NULL,
    [id_old_pdr]                        VARCHAR (20) NOT NULL,
    [zakres]                            VARCHAR (4)  NOT NULL,
    [c152_id]                           INT          NULL,
    PRIMARY KEY CLUSTERED ([c152_reprezentantpodmiotgospod_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c152_reprezentantpodmiotgospod_c152_id] FOREIGN KEY ([c152_id]) REFERENCES [pdr].[c152] ([c152_id])
);

