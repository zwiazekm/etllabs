CREATE TABLE [cel].[dok_tranzyt] (
    [id_dok]        VARCHAR (30) NOT NULL,
    [id_kntr]       VARCHAR (30) NULL,
    [TypDok]        VARCHAR (4)  NULL,
    [SymDokZ]       VARCHAR (40) NULL,
    [DataRej]       DATETIME     NULL,
    [DataPrzyjEwid] DATETIME     NULL,
    [TermDostTow]   DATETIME     NULL,
    [EtapTranz]     CHAR (1)     NULL,
    [Status]        CHAR (1)     NULL,
    [KrajWysylki]   VARCHAR (2)  NULL,
    [KrajDocelowy]  VARCHAR (2)  NULL,
    [IdJednPrzezn]  VARCHAR (9)  NULL,
    [NrAkt]         VARCHAR (40) NULL,
    [RodzDokZrd]    VARCHAR (6)  NULL,
    [SymDokZrd]     VARCHAR (40) NULL,
    [MasaBrutto]    NUMERIC (14) NULL,
    [LiczbaOpak]    NUMERIC (14) NULL,
    [EtapBilans]    CHAR (1)     NULL,
    [CharaktTow]    VARCHAR (10) NULL,
    [DataOtwTranz]  DATETIME     NULL,
    [DataZamk]      DATETIME     NULL,
    CONSTRAINT [PK_DOK_TRANZYT] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_TRAN_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok]),
    CONSTRAINT [FK_DOK_TRAN_REFERENCE_KONTRAHE] FOREIGN KEY ([id_kntr]) REFERENCES [cel].[kontrahenci] ([id_kntr])
);


GO
CREATE NONCLUSTERED INDEX [SymDokZ]
    ON [cel].[dok_tranzyt]([SymDokZ] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];

