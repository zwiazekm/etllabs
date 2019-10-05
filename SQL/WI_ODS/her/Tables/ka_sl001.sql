CREATE TABLE [her].[ka_sl001] (
    [RV]                BINARY (8)     NULL,
    [DataZap]           DATETIME       NULL,
    [IdUzZap]           INT            NULL,
    [IdKodEp]           INT            NOT NULL,
    [KodEp]             VARCHAR (3)    NOT NULL,
    [NazwaEp]           VARCHAR (100)  NOT NULL,
    [IdKodRodzEp]       INT            NULL,
    [DataObowOd]        DATETIME       NULL,
    [DataObowDo]        DATETIME       NULL,
    [PodstPraw]         VARCHAR (500)  NULL,
    [Opis]              VARCHAR (1000) NULL,
    [PodstPrawWynagr]   VARCHAR (1)    NULL,
    [IdPodstPrawWynagr] INT            NULL,
    CONSTRAINT [PK_ka_sl001_IdKodEp] PRIMARY KEY CLUSTERED ([IdKodEp] ASC) ON [FG_HER],
    CONSTRAINT [FK_ka_sl001_IdKodRodzEp_ka_dp25_id] FOREIGN KEY ([IdKodRodzEp]) REFERENCES [her].[ka_dp25] ([id]),
    CONSTRAINT [UQ_ka_sl001_KodEp_DataObowDo] UNIQUE NONCLUSTERED ([KodEp] ASC, [DataObowDo] ASC) ON [FG_HER],
    CONSTRAINT [UQ_ka_sl001_KodEp_DataObowOd] UNIQUE NONCLUSTERED ([KodEp] ASC, [DataObowOd] ASC) ON [FG_HER]
);


GO
CREATE NONCLUSTERED INDEX [IX_ka_sl001_DataObowOd_DataObowDo]
    ON [her].[ka_sl001]([DataObowOd] ASC, [DataObowDo] ASC)
    ON [FG_HER];

