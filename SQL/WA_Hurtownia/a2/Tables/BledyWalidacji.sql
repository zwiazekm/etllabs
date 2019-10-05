CREATE TABLE [a2].[BledyWalidacji] (
    [ID]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [Czas]          SMALLDATETIME NOT NULL,
    [databaseId]    SMALLINT      DEFAULT (db_id()) NULL,
    [objectId]      BIGINT        NOT NULL,
    [WalidacjaPDR]  VARCHAR (10)  NOT NULL,
    [Kolumna]       VARCHAR (128) NOT NULL,
    [BlednaWartosc] NVARCHAR (50) NULL,
    [KluczWiersza]  VARCHAR (128) NULL,
    [CzyPoprawiony] BIT           DEFAULT ((0)) NULL,
    [KodKlasyBledu] CHAR (3)      DEFAULT ('DER') NOT NULL,
    [RegulaId]      INT           NULL,
    CONSTRAINT [PK_BledyWalidacji] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (DATA_COMPRESSION = PAGE) ON [FG_A2],
    CONSTRAINT [FK_BledyWalidacji_KodKlasyBledu] FOREIGN KEY ([KodKlasyBledu]) REFERENCES [a2].[slKlasyBledu] ([KodKlasyBledu]),
    CONSTRAINT [FK_BledyWalidacji_RegulaId] FOREIGN KEY ([RegulaId]) REFERENCES [a2].[RegulyWalidacyjne] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_BledyWalidacji_Czas]
    ON [a2].[BledyWalidacji]([Czas] ASC)
    ON [FG_A2];

