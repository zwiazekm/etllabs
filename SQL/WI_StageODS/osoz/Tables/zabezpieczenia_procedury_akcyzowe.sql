CREATE TABLE [osoz].[zabezpieczenia_procedury_akcyzowe] (
    [zabezpieczenie_id]     BIGINT NOT NULL,
    [procedura_akcyzowa_id] BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([zabezpieczenie_id] ASC, [procedura_akcyzowa_id] ASC)
);

