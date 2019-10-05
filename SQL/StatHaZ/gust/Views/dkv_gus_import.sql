CREATE VIEW gust.dkv_gus_import as 
select left(case when isnumeric(ilosc) = 1 
            then convert(varchar(15),convert(bigint, ilosc)) 
            else  convert(varchar(15),ilosc) end,15)                                     ilosc,
       left(convert(varchar(3),kraj_poch),3)                                             kraj_poch,
       left(convert(varchar(3),kraj_wys),3)                                              kraj_wys,
       left(case when isnumeric(masa_net) = 1 
            then convert(varchar,convert(bigint, masa_net)) 
            else  convert(varchar(15),masa_net) end,15)                                  masa_net,
       left( right('00'+convert(varchar,convert(int, mies)),2) + 
            right(convert(varchar,rok),2),4)                                             miesiac_rok,
       left(case when isnumeric(pcn_p) = 1 
            then right('00000000'+convert(varchar(10),convert(bigint, pcn_p)),8) 
            else  convert(varchar(10),pcn_p) end,10)                                     pcn,
       left(case when isnumeric([proc]) = 1 
            then right('0000'+convert(varchar(4),convert(bigint, [proc])),4) 
            else  convert(varchar(4),[proc]) end, 4)                                     procedura,
       left(case when isnumeric(prog) = 1 
            then convert(varchar(1),convert(int, prog)) 
            else  convert(varchar(1),prog) end, 1)                                       prog,
       left(convert(varchar(1024),(case when isnumeric(propozycja) = 1
                                     then convert(varchar(1024),convert(bigint, propozycja)) 
                                   else propozycja end)), 1024)                          propozycja,
       left(case when isnumeric(regon) = 1 
                  then  right('00000000000000'+convert(varchar(14), 
                              convert(bigint,regon)),14)      
                  else convert(varchar(14),regon) end, 14)                               regon,
       left(case when isnumeric(trans) = 1 
            then convert(varchar(1),convert(smallint,trans)) 
            else convert(varchar(1),trans) end, 1)                                       trans,
       left(case when isnumeric(tranzak) = 1 
            then convert(varchar(2),convert(smallint,tranzak)) 
            else convert(varchar(2),tranzak) end, 2)                                     tranzak,
       left(case when isnumeric(urz_cel) = 1 
            then convert(varchar(9),convert(int,urz_cel)) 
            else convert(varchar(9),urz_cel) end, 9)                                     urz_cel,
       left(convert(varchar(3),war_dos), 3)                                              war_dos,
       left(case when isnumeric(wart_dol) = 1 
            then convert(varchar(15),convert(bigint, wart_dol)) 
            else convert(varchar(15),wart_dol) end, 15)                                  wart_dol,
       left(case when isnumeric(wart_euro) = 1 
            then convert(varchar(15),convert(bigint, wart_euro)) 
            else convert(varchar(15),wart_euro) end, 15)                                 wart_euro,
       left(case when isnumeric(wart_zl) = 1 
            then convert(varchar(15),convert(bigint, wart_zl)) 
            else convert(varchar(15),wart_zl) end, 15)                                   wart_zl,
       left(convert(varchar(1024),komentarz), 1024)                                      komentarz
--from GUS_XLS...Import$
from gust.dkt_gus_import_bufor