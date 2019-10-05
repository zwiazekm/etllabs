CREATE TABLE [akc].[AKCEN_Towary] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [KodCN]                VARCHAR (15)    NULL,
    [StawkaPodatku]        DECIMAL (19, 2) NULL,
    [PodstawObliczPodatku] DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_AKCEN_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_AKC],
    CONSTRAINT [FK_AKCEN_Towary_IdDok_AKCEN_Deklaracja_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[AKCEN_Deklaracja] ([IdDok])
);

