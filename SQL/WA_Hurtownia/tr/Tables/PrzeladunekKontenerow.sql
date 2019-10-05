CREATE TABLE [tr].[PrzeladunekKontenerow] (
    [MRN]                     VARCHAR (21) NOT NULL,
    [CzyIncydent]             VARCHAR (1)  NULL,
    [NrSekwencji]             DECIMAL (4)  NULL,
    [CzyZdarzeniePrzeladunek] VARCHAR (1)  NULL,
    [NumerNowegoKontenera]    VARCHAR (17) NULL
) ON [FG_TR];

