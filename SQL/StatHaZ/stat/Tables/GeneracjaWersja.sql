CREATE TABLE [stat].[GeneracjaWersja] (
    [GeneracjaId]      INT NOT NULL,
    [RokMcOd]          INT NOT NULL,
    [RokMcDo]          INT NOT NULL,
    [GeneracjaSlownie] AS  ((((('Generacja nr '+substring(CONVERT([varchar](9),[GeneracjaId]),(7),(3)))+' danych za okres: ')+format(datefromparts([RokMcOd]/(100),[RokMcOd]%(100),(1)),'MMMM yyyy'))+' - ')+format(datefromparts([RokMcDo]/(100),[RokMcDo]%(100),(1)),'MMMM yyyy')),
    [NumerGeneracji]   AS  (CONVERT([smallint],substring(CONVERT([varchar](9),[GeneracjaId]),(7),(3)))),
    CONSTRAINT [PK_GeneracjaWersja] PRIMARY KEY CLUSTERED ([GeneracjaId] ASC),
    CONSTRAINT [CK_GeneracjaWersja_GeneracjaId] CHECK ([GeneracjaId]>=(100001001) AND [GeneracjaId]<=(209912999)),
    CONSTRAINT [CK_GeneracjaWersja_RokMcDo] CHECK ([RokMcDo]>=(100001) AND [RokMcDo]<=(209912) AND [RokMcDo]%(100)>(0) AND [RokMcDo]%(100)<=(12)),
    CONSTRAINT [CK_GeneracjaWersja_RokMcOd] CHECK ([RokMcOd]>=(100001) AND [RokMcOd]<=(209912) AND [RokMcOd]%(100)>(0) AND [RokMcOd]%(100)<=(12))
);

