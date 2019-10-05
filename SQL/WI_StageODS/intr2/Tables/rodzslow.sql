CREATE TABLE [intr2].[rodzslow] (
    [id_rodz_slow] NVARCHAR (6)   NOT NULL,
    [nazwa]        NVARCHAR (120) NULL,
    [okno_nagl]    NVARCHAR (40)  NULL,
    [dw_naglowka]  NVARCHAR (40)  NULL,
    [okno_poz]     NVARCHAR (40)  NULL,
    [dw_pozycji]   NVARCHAR (40)  NULL,
    [rodzaj]       NCHAR (1)      NULL,
    CONSTRAINT [rodzslow$pk_rodzslow] PRIMARY KEY CLUSTERED ([id_rodz_slow] ASC)
);

