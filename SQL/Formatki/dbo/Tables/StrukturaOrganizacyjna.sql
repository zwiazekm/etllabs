CREATE TABLE [dbo].[StrukturaOrganizacyjna] (
    [JednostkaId]          INT            NOT NULL,
    [KodPocztowy]          VARCHAR (9)    NULL,
    [KodUrzedu]            VARCHAR (50)   NOT NULL,
    [Kraj]                 VARCHAR (2)    NOT NULL,
    [Miejscowosc]          VARCHAR (35)   NULL,
    [NazwaKrotka]          VARCHAR (35)   NOT NULL,
    [NazwaPelna]           NVARCHAR (200) NOT NULL,
    [Rodzaj]               CHAR (1)       NULL,
    [KodUrzeduNadrzedny]   VARCHAR (50)   NULL,
    [Ulica]                VARCHAR (35)   NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__Struktura__versi__76969D2E] DEFAULT ((0)) NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [NazwaJednostki]       NVARCHAR (200) NULL,
    [KodTypuJednostki]     VARCHAR (5)    NULL,
    [KodRangikomorki]      VARCHAR (20)   NULL,
    [IsJednostka]          BIT            NULL,
    [CzyKomorka]           BIT            NULL,
    CONSTRAINT [PK_StrukturaOrganizacyjna] PRIMARY KEY CLUSTERED ([JednostkaId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StrukturaOrganizacyjna_KodUrzeduNadrzedny]
    ON [dbo].[StrukturaOrganizacyjna]([KodUrzeduNadrzedny] ASC)
    INCLUDE([KodUrzedu]);


GO
CREATE NONCLUSTERED INDEX [UX_StrukturaOrganizacyjna_KodUrzedu]
    ON [dbo].[StrukturaOrganizacyjna]([KodUrzedu] ASC)
    INCLUDE([valid_from]);

