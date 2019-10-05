CREATE TABLE [wpb].[RB70_Dokument] (
    [IdDok]                  VARCHAR (30) NOT NULL,
    [RodzajDokumentu]        CHAR (4)     NULL,
    [NumerDokumentu]         VARCHAR (30) NULL,
    [JednostkaSprawozdawcza] VARCHAR (20) NULL,
    [DataRejestrDokWSyst]    DATETIME     NOT NULL,
    [Status]                 CHAR (1)     NOT NULL,
    [DataZamkniecia]         DATE         NULL,
    [DataWykonania]          DATE         NULL,
    [OkresOd]                INT          NULL,
    [OkresDo]                INT          NULL,
    CONSTRAINT [PK_RB70_Dokument] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_WPB]
);

