CREATE TABLE [wald].[raport] (
    [Akcja]    CHAR (2)       NULL,
    [Opis]     NVARCHAR (255) NULL,
    [Ilosc]    NVARCHAR (50)  NULL,
    [Data]     DATETIME       CONSTRAINT [DF_raport_aktualizacja_odp_intr_Data] DEFAULT (getdate()) NOT NULL,
    [Operator] NVARCHAR (50)  CONSTRAINT [DF_raport_aktualizacja_odp_intr_Operator] DEFAULT (suser_sname()) NULL,
    [id_op]    BIGINT         IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_raport_aktualizacja_odp_intr] PRIMARY KEY CLUSTERED ([id_op] DESC) ON [WaldDane]
);

