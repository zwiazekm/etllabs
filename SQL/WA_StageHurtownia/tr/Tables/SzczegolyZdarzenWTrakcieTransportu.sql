CREATE TABLE [tr].[SzczegolyZdarzenWTrakcieTransportu] (
    [MRN]                     VARCHAR (21) NOT NULL,
    [NrSekwencji]             SMALLINT     NOT NULL,
    [CzyIncydent]             BIT          NOT NULL,
    [CzyZdarzeniePrzeladunek] BIT          NULL,
    [NrNowegoSrTransportu]    VARCHAR (81) NULL,
    CONSTRAINT [PK_SzczegolyZdarzenWTrakcieTransportu] PRIMARY KEY CLUSTERED ([MRN] ASC, [NrSekwencji] ASC, [CzyIncydent] ASC)
);

