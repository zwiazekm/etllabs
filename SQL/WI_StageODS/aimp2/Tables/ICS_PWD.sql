CREATE TABLE [aimp2].[ICS_PWD] (
    [id]                         NUMERIC (19)    NOT NULL,
    [cancellation_reason]        NVARCHAR (1024) NULL,
    [tqsSent]                    BIT             NOT NULL,
    [czasDecyzjePrzywoz]         NUMERIC (4)     NULL,
    [jednCzasDecyzjePrzywoz]     NVARCHAR (50)   NULL,
    [czasPowPrzedPrzybyciem]     NUMERIC (4)     NULL,
    [jednCzasPowPrzedPrzybyciem] NVARCHAR (50)   NULL,
    [ie25Pending]                NUMERIC (1)     NULL,
    [uzpMaxDeliverDate]          DATETIME2 (3)   NULL,
    [version]                    INT             NOT NULL,
    CONSTRAINT [ICS_PWD$PK_ICS_PWD] PRIMARY KEY CLUSTERED ([id] ASC)
);

