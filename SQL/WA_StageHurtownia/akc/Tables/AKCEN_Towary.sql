CREATE TABLE [akc].[AKCEN_Towary] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [KodCN]                VARCHAR (15)    NULL,
    [KodCNPid]             INT             NULL,
    [StawkaPodatku]        DECIMAL (19, 2) NULL,
    [PodstawObliczPodatku] DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_AKCEN_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

