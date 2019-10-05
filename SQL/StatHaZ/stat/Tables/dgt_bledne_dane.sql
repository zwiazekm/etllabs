CREATE TABLE [stat].[dgt_bledne_dane] (
    [bd_RokMc]          INT            NULL,
    [bd_rodzaj]         VARCHAR (100)  NULL,
    [bd_tabela]         VARCHAR (100)  NULL,
    [bd_bledna_wartosc] VARCHAR (100)  NULL,
    [bd_nowa_wartosc]   VARCHAR (100)  NULL,
    [bd_iddoknr]        BIGINT         NULL,
    [bd_id_dok]         VARCHAR (35)   NULL,
    [bd_iddoknr_pozid]  BIGINT         NULL,
    [bd_id_dok_pozid]   BIGINT         NULL,
    [bd_do_usuniecia]   CHAR (1)       NULL,
    [bd_koment]         VARCHAR (500)  NULL,
    [bd_pk]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [bd_status]         CHAR (1)       NULL,
    [bd_autor]          VARCHAR (10)   NULL,
    [bd_id_pliku]       DECIMAL (18)   NULL,
    [bd_data_wpisu]     DATETIME       CONSTRAINT [DF_dgt_bledne_dane_bd_data_wpisu] DEFAULT (getdate()) NULL,
    [bd_typ]            CHAR (1)       NULL,
    [uname]             VARCHAR (50)   NULL,
    [zm_statusu]        NVARCHAR (255) NULL,
    CONSTRAINT [PK_dgt_bledne_dane] PRIMARY KEY CLUSTERED ([bd_pk] ASC)
);


GO

CREATE TRIGGER [stat].tr_dgt_bledne_dane
ON [stat].dgt_bledne_dane
FOR DELETE
AS 
BEGIN

	insert into [stat].dgt_bledne_dane_arch 
		(bd_RokMc, 
		bd_rodzaj, 
		bd_tabela, 
		bd_bledna_wartosc, 
		bd_nowa_wartosc, 
		bd_iddoknr, 
		bd_id_dok, 
		bd_iddoknr_pozid,
		bd_id_dok_pozid, 
		bd_do_usuniecia, 
		bd_koment, 
		bd_pk,	
		bd_status, 
		bd_autor, 
		bd_id_pliku, 
		bd_data_wpisu, 
		bd_typ,
		uname,
		zm_statusu)
	select 
		bd_RokMc, 
		bd_rodzaj, 
		bd_tabela, 
		bd_bledna_wartosc, 
		bd_nowa_wartosc, 
		bd_iddoknr, 
		bd_id_dok, 
		bd_iddoknr_pozid,
		bd_id_dok_pozid, 
		bd_do_usuniecia, 
		bd_koment, 
		bd_pk,	
		bd_status, 
		bd_autor, 
		bd_id_pliku, 
		bd_data_wpisu, 
		bd_typ,
		uname,
		zm_statusu
	 from deleted  
END
GO

create trigger [stat].zmiana_statusu on [stat].dgt_bledne_dane
for update as
if (columns_updated() & 4096)>0
	begin
	update dgt_bledne_dane
	set zm_statusu=isnull(dgt_bledne_dane.zm_statusu,'')+' '+convert(nvarchar,getdate(),112)+':'+deleted.bd_status+'/'+inserted.bd_status
	from dgt_bledne_dane, deleted, inserted
	where dgt_bledne_dane.bd_pk = deleted.bd_pk

	update dgt_bledne_dane
	set zm_statusu=ltrim(zm_statusu)

	end