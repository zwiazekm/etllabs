CREATE TABLE [fk].[EwidencjaNaleznosci] (
    [IdDok]            VARCHAR (30)    NOT NULL,
    [IdPodmiotu]       INT             NOT NULL,
    [IdKomorki]        VARCHAR (20)    NOT NULL,
    [KwotaDecyzji]     DECIMAL (20, 2) NULL,
    [IdJednostki]      VARCHAR (20)    NULL,
    [IdJednostkiPid]   INT             NULL,
    [KwotaNaleznosci]  DECIMAL (20, 2) NULL,
    [SaldoNaEwidencji] DECIMAL (20, 2) NULL,
    CONSTRAINT [PK_EwidencjaNaleznosci] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPodmiotu] ASC, [IdKomorki] ASC)
);

