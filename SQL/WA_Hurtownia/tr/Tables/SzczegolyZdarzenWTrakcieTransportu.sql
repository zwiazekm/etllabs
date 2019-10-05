CREATE TABLE [tr].[SzczegolyZdarzenWTrakcieTransportu] (
    [MRN]                     VARCHAR (21) NOT NULL,
    [NrSekwencji]             SMALLINT     NOT NULL,
    [CzyIncydent]             BIT          NOT NULL,
    [CzyZdarzeniePrzeladunek] BIT          NULL,
    [NrNowegoSrTransportu]    VARCHAR (81) NULL,
    CONSTRAINT [PK_SzczegolyZdarzenWTrakcieTransportu] PRIMARY KEY CLUSTERED ([MRN] ASC, [NrSekwencji] ASC, [CzyIncydent] ASC) ON [FG_TR],
    CONSTRAINT [FK_SzczegolyZdarzenWTrakcieTransportu_MRNCzyWDrodze_ZdarzeniaWTrakcieTransportu_MRNSekwencja] FOREIGN KEY ([MRN], [NrSekwencji]) REFERENCES [tr].[ZdarzeniaWTrakcieTransportu] ([MRN], [Sekwencja])
);

