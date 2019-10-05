CREATE TABLE [osoz].[zabezpieczenia_generalne_procedury_procedury] (
    [zabezpieczenia_generalne_procedury_id] BIGINT NOT NULL,
    [procedury_id]                          BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([zabezpieczenia_generalne_procedury_id] ASC, [procedury_id] ASC)
);

