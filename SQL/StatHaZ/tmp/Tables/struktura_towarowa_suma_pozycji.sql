CREATE TABLE [tmp].[struktura_towarowa_suma_pozycji] (
    [typ]               CHAR (1)     NOT NULL,
    [nip_zobowiazanego] CHAR (10)    NOT NULL,
    [RokMc]             INT          NOT NULL,
    [suma_pozycji]      NUMERIC (38) NULL,
    CONSTRAINT [PK_struktura_towarowa_suma_pozycji] PRIMARY KEY CLUSTERED ([typ] ASC, [nip_zobowiazanego] ASC, [RokMc] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_struktura_towarowa_suma_pozycji]
    ON [tmp].[struktura_towarowa_suma_pozycji]([nip_zobowiazanego] ASC, [RokMc] ASC, [typ] ASC);

