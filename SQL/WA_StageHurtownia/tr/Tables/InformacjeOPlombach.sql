CREATE TABLE [tr].[InformacjeOPlombach] (
    [SID]                            INT          NOT NULL,
    [MRNZdarzeniaWTrakcieTransportu] VARCHAR (21) NULL,
    [NrSekwencji]                    SMALLINT     NULL,
    [NumerWersji]                    DECIMAL (3)  NULL,
    [SIDOperacjiTranzytowej]         INT          NULL,
    [KodJezykaIdentyfikacjiPlomb]    CHAR (2)     NULL,
    [NumerIdentyfikacyjnyPlomb]      VARCHAR (60) NOT NULL,
    CONSTRAINT [PK_InformacjeOPlombach] PRIMARY KEY CLUSTERED ([SID] ASC)
);

