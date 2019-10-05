CREATE TABLE [pdr].[c152_reprezentantpodmiotgospod] (
    [c152_reprezentantpodmiotgospod_id] INT          NOT NULL,
    [id_old_pdr]                        VARCHAR (20) NOT NULL,
    [zakres]                            VARCHAR (4)  NOT NULL,
    [c152_id]                           INT          NULL,
    PRIMARY KEY CLUSTERED ([c152_reprezentantpodmiotgospod_id] ASC)
);

