CREATE TABLE [ncts2].[operacje_tranzytowe_seap] (
    [id]                     BIGINT         NOT NULL,
    [operacja_tranzytowa_id] BIGINT         NULL,
    [kanal_typ]              NVARCHAR (15)  NULL,
    [kanal_wartosc]          NVARCHAR (400) NULL,
    [sisc_id_sprawy]         NVARCHAR (400) NULL,
    [sisc_id_wplywu]         NVARCHAR (400) NULL,
    [sisc_id_podmiotu]       NVARCHAR (400) NULL,
    [sisc_id_podmiotu_posr]  NVARCHAR (400) NULL,
    [sisc_id_osoby]          NVARCHAR (400) NULL,
    CONSTRAINT [operacje_tranzytowe_seap_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [operacje_tranzytowe_seap_optr_id_operacje_tranzytowe_fk] FOREIGN KEY ([operacja_tranzytowa_id]) REFERENCES [ncts2].[operacje_tranzytowe] ([id])
);

