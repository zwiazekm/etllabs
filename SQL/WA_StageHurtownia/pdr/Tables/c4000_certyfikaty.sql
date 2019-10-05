CREATE TABLE [pdr].[c4000_certyfikaty] (
    [c4000_certyfikaty_id]         BIGINT NOT NULL,
    [datado]                       DATE   NULL,
    [dataod]                       DATE   NULL,
    [numercertyfikatu]             TEXT   NULL,
    [odciskpalcacertyfikatu]       TEXT   NULL,
    [c4000_daneidentyfikacyjne_id] BIGINT NULL,
    PRIMARY KEY CLUSTERED ([c4000_certyfikaty_id] ASC)
);

