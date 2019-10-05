
CREATE VIEW gust.widok_kopia_tbl_dane_zrodlowe as
                          select *
                            from kopia_tbl_dane_zrodlowe
                           where okres_od = '200601'

                             and okres_do = '200602'