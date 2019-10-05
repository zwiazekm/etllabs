CREATE TABLE [pdr].[c4002_uprawnienia] (
    [c4002_uprawnienia_id]   BIGINT       NOT NULL,
    [rodzajuprawnienia]      VARCHAR (1)  NULL,
    [uprawnienie]            VARCHAR (50) NULL,
    [c4002_reprezentacje_id] BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([c4002_uprawnienia_id] ASC)
);

