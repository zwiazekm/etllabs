CREATE view [stat].dgv_kopia_dot_okres_sprawozd as
                          select [id_pod], [nr_poz], [RokMc], [typ], [status], [id_jedn], [wsk_popraw], [operator], [data_zmiany], [roznica_V_I], [generacjaId]
                            from [stat].dgt_kopia_dot_okres_sprawozd
                           --where  generacjaId = 1

-- zahaszowane z powodu procedury dop_struktura_miesieczna zasilenie tabeli dot_podmiot_dane_miesieczne