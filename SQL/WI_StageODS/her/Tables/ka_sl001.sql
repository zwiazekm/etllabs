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
    CONSTRAINT [PK_ka_sl001_IdKodEp] PRIMARY KEY CLUSTERED ([IdKodEp] ASC),
    CONSTRAINT [UQ_ka_sl001_KodEp_DataObowDo] UNIQUE NONCLUSTERED ([KodEp] ASC, [DataObowDo] ASC),
    CONSTRAINT [UQ_ka_sl001_KodEp_DataObowOd] UNIQUE NONCLUSTERED ([KodEp] ASC, [DataObowOd] ASC)
);

