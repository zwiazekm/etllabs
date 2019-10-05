




CREATE PROCEDURE [zef2DW].[ConditionsForDW]

AS
    BEGIN
--START ParametryWniosku
	-- [zef2DW].[DAKC_Dokument][ParametryWniosku]
	UPDATE [zef2DW].[DAKC_Dokument] 
		SET ParametryWniosku =  CASE  
							WHEN ParametryWniosku = 'document' THEN 'Dokument_pozycje_objete_postanowieniem' 
							WHEN ParametryWniosku = 'period' THEN 'Okresy_objete_postanowieniem' 
							WHEN ParametryWniosku = 'none' THEN 'Nie_powiazany_z_dokumentem_pierwotnym' 
							ELSE ParametryWniosku
								END 
		WHERE ParametryWniosku IN ('document', 'period', 'none');

	-- [zef2DW].[DAKO_Dokument][ParametryWniosku]
	UPDATE [zef2DW].[DAKO_Dokument] 
		SET ParametryWniosku =  CASE  
							WHEN ParametryWniosku = 'document' THEN 'Dokument_pozycje_objete_postanowieniem' 
							WHEN ParametryWniosku = 'period' THEN 'Okresy_objete_postanowieniem' 
							WHEN ParametryWniosku = 'none' THEN 'Nie_powiazany_z_dokumentem_pierwotnym' 
							ELSE ParametryWniosku
								END 
		WHERE ParametryWniosku IN ('document', 'period', 'none');

	-- [zef2DW].[DZMT_Dokument][ParametryWniosku]
	UPDATE [zef2DW].[DZMT_Dokument] 
		SET ParametryWniosku =  CASE  
							WHEN ParametryWniosku = 'document' THEN 'Dokument_pozycje_objete_postanowieniem' 
							WHEN ParametryWniosku = 'period' THEN 'Okresy_objete_postanowieniem' 
							WHEN ParametryWniosku = 'none' THEN 'Nie_powiazany_z_dokumentem_pierwotnym' 
							ELSE ParametryWniosku
								END 
		WHERE ParametryWniosku IN ('document', 'period', 'none');

	-- [zef2DW].[DZWR_Dokument][ParametryWniosku]
	UPDATE [zef2DW].[DZWR_Dokument] 
		SET ParametryWniosku =  CASE  
							WHEN ParametryWniosku = 'document' THEN 'Dokument_pozycje_objete_postanowieniem' 
							WHEN ParametryWniosku = 'period' THEN 'Okresy_objete_postanowieniem' 
							WHEN ParametryWniosku = 'none' THEN 'Nie_powiazany_z_dokumentem_pierwotnym' 
							ELSE ParametryWniosku
								END 
		WHERE ParametryWniosku IN ('document', 'period', 'none');

	-- [zef2DW].[POWK_Dokument][ParametryWniosku]
	UPDATE [zef2DW].[POWK_Dokument] 
		SET ParametryWniosku =  CASE  
							WHEN ParametryWniosku = 'document' THEN 'Dokument_pozycje_objete_postanowieniem' 
							WHEN ParametryWniosku = 'period' THEN 'Okresy_objete_postanowieniem' 
							WHEN ParametryWniosku = 'none' THEN 'Nie_powiazany_z_dokumentem_pierwotnym' 
							ELSE ParametryWniosku
								END 
		WHERE ParametryWniosku IN ('document', 'period', 'none');
--END ParametryWniosku
--START JakiOkresRozliczeniowy
	-- [zef2DW].[DAKC_Dokument][JakiOkresRozliczeniowy]
	UPDATE [zef2DW].[DAKC_Dokument] 
		SET JakiOkresRozliczeniowy =  CASE  
							WHEN JakiOkresRozliczeniowy = 'month' THEN 'Miesieczny' 
							WHEN JakiOkresRozliczeniowy = 'quarter' THEN 'Kwartalny' 
							ELSE JakiOkresRozliczeniowy
								END 
		WHERE JakiOkresRozliczeniowy IN ('month', 'quarter');	
	-- [zef2DW].[DAKO_Dokument][JakiOkresRozliczeniowy]
	UPDATE [zef2DW].[DAKO_Dokument] 
		SET JakiOkresRozliczeniowy =  CASE  
							WHEN JakiOkresRozliczeniowy = 'month' THEN 'Miesieczny' 
							WHEN JakiOkresRozliczeniowy = 'quarter' THEN 'Kwartalny' 
							ELSE JakiOkresRozliczeniowy
								END 
		WHERE JakiOkresRozliczeniowy IN ('month', 'quarter');	
	-- [zef2DW].[DOOD_Dokument][JakiOkresRozliczeniowy]
	UPDATE [zef2DW].[DOOD_Dokument] 
		SET JakiOkresRozliczeniowy =  CASE  
							WHEN JakiOkresRozliczeniowy = 'month' THEN 'Miesieczny' 
							WHEN JakiOkresRozliczeniowy = 'quarter' THEN 'Kwartalny' 
							ELSE JakiOkresRozliczeniowy
								END 
		WHERE JakiOkresRozliczeniowy IN ('month', 'quarter');

	-- [zef2DW].[DZMT_Dokument][JakiOkresRozliczeniowy]
	UPDATE [zef2DW].[DZMT_Dokument] 
		SET JakiOkresRozliczeniowy =  CASE  
							WHEN JakiOkresRozliczeniowy = 'month' THEN 'Miesieczny' 
							WHEN JakiOkresRozliczeniowy = 'quarter' THEN 'Kwartalny' 
							ELSE JakiOkresRozliczeniowy
								END 
		WHERE JakiOkresRozliczeniowy IN ('month', 'quarter');

	-- [zef2DW].[UPWK_Dokument][JakiOkresRozliczeniowy]
	UPDATE [zef2DW].[UPWK_Dokument] 
		SET JakiOkresRozliczeniowy =  CASE  
							WHEN JakiOkresRozliczeniowy = 'month' THEN 'Miesieczny' 
							WHEN JakiOkresRozliczeniowy = 'quarter' THEN 'Kwartalny' 
							ELSE JakiOkresRozliczeniowy
								END 
		WHERE JakiOkresRozliczeniowy IN ('month', 'quarter');
--END JakiOkresRozliczeniowy
--START WnioskodawcaPostepowania

	-- [zef2DW].[DAKC_Dokument][WnioskodawcaPostepowania]
	UPDATE [zef2DW].[DAKC_Dokument] 
		SET WnioskodawcaPostepowania =  CASE  
							WHEN WnioskodawcaPostepowania = 'true' or WnioskodawcaPostepowania ='1' THEN 'Z_urzedu' 
							WHEN WnioskodawcaPostepowania = 'false' or WnioskodawcaPostepowania ='0' THEN 'Na_wniosek_strony' 
							ELSE WnioskodawcaPostepowania
								END 
		WHERE WnioskodawcaPostepowania IN ('true', 'false', '0', '1');


			-- [zef2DW].[DAKO_Dokument][WnioskodawcaPostepowania]
	UPDATE [zef2DW].[DAKO_Dokument] 
		SET WnioskodawcaPostepowania =  CASE  
							WHEN WnioskodawcaPostepowania = 'true' or WnioskodawcaPostepowania ='1' THEN 'Z_urzedu' 
							WHEN WnioskodawcaPostepowania = 'false' or WnioskodawcaPostepowania ='0' THEN 'Na_wniosek_strony' 
							ELSE WnioskodawcaPostepowania
								END 
		WHERE WnioskodawcaPostepowania IN ('true', 'false', '0', '1');

			-- [zef2DW].[DKOR_Dokument][WnioskodawcaPostepowania]
	UPDATE [zef2DW].[DKOR_Dokument] 
		SET WnioskodawcaPostepowania =  CASE  
							WHEN WnioskodawcaPostepowania = 'true' or WnioskodawcaPostepowania ='1' THEN 'Z_urzedu' 
							WHEN WnioskodawcaPostepowania = 'false' or WnioskodawcaPostepowania ='0' THEN 'Na_wniosek_strony' 
							ELSE WnioskodawcaPostepowania
								END 
		WHERE WnioskodawcaPostepowania IN ('true', 'false', '0', '1');

			-- [zef2DW].[DKPI_Dokument][WnioskodawcaPostepowania]
	UPDATE [zef2DW].[DKPI_Dokument] 
		SET WnioskodawcaPostepowania =  CASE  
							WHEN WnioskodawcaPostepowania = 'true' or WnioskodawcaPostepowania ='1' THEN 'Z_urzedu' 
							WHEN WnioskodawcaPostepowania = 'false' or WnioskodawcaPostepowania ='0' THEN 'Na_wniosek_strony' 
							ELSE WnioskodawcaPostepowania
								END 
		WHERE WnioskodawcaPostepowania IN ('true', 'false', '0', '1');

			-- [zef2DW].[DOOD_Dokument][WnioskodawcaPostepowania]
	UPDATE [zef2DW].[DOOD_Dokument] 
		SET WnioskodawcaPostepowania =  CASE  
							WHEN WnioskodawcaPostepowania = 'true' or WnioskodawcaPostepowania ='1' THEN 'Z_urzedu' 
							WHEN WnioskodawcaPostepowania = 'false' or WnioskodawcaPostepowania ='0' THEN 'Na_wniosek_strony' 
							ELSE WnioskodawcaPostepowania
								END 
		WHERE WnioskodawcaPostepowania IN ('true', 'false', '0', '1');

			-- [zef2DW].[DOUP_Dokument][WnioskodawcaPostepowania]
	UPDATE [zef2DW].[DOUP_Dokument] 
		SET WnioskodawcaPostepowania =  CASE  
							WHEN WnioskodawcaPostepowania = 'true' or WnioskodawcaPostepowania ='1' THEN 'Z_urzedu' 
							WHEN WnioskodawcaPostepowania = 'false' or WnioskodawcaPostepowania ='0' THEN 'Na_wniosek_strony' 
							ELSE WnioskodawcaPostepowania
								END 
		WHERE WnioskodawcaPostepowania IN ('true', 'false', '0', '1');

			-- [zef2DW].[DUNA_Dokument][WnioskodawcaPostepowania]
	UPDATE [zef2DW].[DUNA_Dokument] 
		SET WnioskodawcaPostepowania =  CASE  
							WHEN WnioskodawcaPostepowania = 'true' or WnioskodawcaPostepowania ='1' THEN 'Z_urzedu' 
							WHEN WnioskodawcaPostepowania = 'false' or WnioskodawcaPostepowania ='0' THEN 'Na_wniosek_strony' 
							ELSE WnioskodawcaPostepowania
								END 
		WHERE WnioskodawcaPostepowania IN ('true', 'false', '0', '1');

			-- [zef2DW].[DUOD_Dokument][WnioskodawcaPostepowania]
	UPDATE [zef2DW].[DUOD_Dokument] 
		SET WnioskodawcaPostepowania =  CASE  
							WHEN WnioskodawcaPostepowania = 'true' or WnioskodawcaPostepowania ='1' THEN 'Z_urzedu' 
							WHEN WnioskodawcaPostepowania = 'false' or WnioskodawcaPostepowania ='0' THEN 'Na_wniosek_strony' 
							ELSE WnioskodawcaPostepowania
								END 
		WHERE WnioskodawcaPostepowania IN ('true', 'false', '0', '1');

			-- [zef2DW].[DZWR_Dokument][WnioskodawcaPostepowania]
	UPDATE [zef2DW].[DZWR_Dokument] 
		SET WnioskodawcaPostepowania =  CASE  
							WHEN WnioskodawcaPostepowania = 'true' or WnioskodawcaPostepowania ='1' THEN 'Z_urzedu' 
							WHEN WnioskodawcaPostepowania = 'false' or WnioskodawcaPostepowania ='0' THEN 'Na_wniosek_strony' 
							ELSE WnioskodawcaPostepowania
								END 
		WHERE WnioskodawcaPostepowania IN ('true', 'false', '0', '1');

			-- [zef2DW].[PKPO_Dokument[WnioskodawcaPostepowania]
	UPDATE [zef2DW].[PKPO_Dokument] 
		SET WnioskodawcaPostepowania =  CASE  
							WHEN WnioskodawcaPostepowania = 'true' or WnioskodawcaPostepowania ='1' THEN 'Z_urzedu' 
							WHEN WnioskodawcaPostepowania = 'false' or WnioskodawcaPostepowania ='0' THEN 'Na_wniosek_strony' 
							ELSE WnioskodawcaPostepowania
								END 
		WHERE WnioskodawcaPostepowania IN ('true', 'false', '0', '1');

--END WnioskodawcaPostepowania

--START DecyzjaWydanaPrzez

	-- [zef2DW].[DOOD_Dokument][DecyzjaWydanaPrzez]
	UPDATE [zef2DW].[DOOD_Dokument] 
		SET DecyzjaWydanaPrzez =  CASE  
							WHEN DecyzjaWydanaPrzez = '1' THEN 'Przejęta z US' 
							WHEN DecyzjaWydanaPrzez = '2' THEN 'UKS' 
							WHEN DecyzjaWydanaPrzez = '3' THEN 'Własna' 
							ELSE DecyzjaWydanaPrzez
								END 
		WHERE DecyzjaWydanaPrzez IN ('3', '2', '1');


--END DecyzjaWydanaPrzez


--START ArtykulUstawy

	-- [zef2DW].[DVIM_Dokument][ArtykulUstawy]
	UPDATE [zef2DW].[DVIM_Dokument] 
		SET ArtykulUstawy =  CASE  
							WHEN ArtykulUstawy = '0' or ArtykulUstawy = 'false' THEN 'art. 33a Ustawy o VAT' 
							WHEN ArtykulUstawy = '1' or ArtykulUstawy = 'true' THEN 'art. 33b Ustawy o VAT' 
							ELSE ArtykulUstawy
								END 
		WHERE ArtykulUstawy IN ('0', '1');

--END ArtykulUstawy


--START UtrzymanieUchylenie

	-- [zef2DW].[PONW_Dokument][UtrzymanieUchylenie]
	UPDATE [zef2DW].[PONW_Dokument] 
		SET UtrzymanieUchylenie =  CASE  
							WHEN UtrzymanieUchylenie = '0' or UtrzymanieUchylenie = 'false' THEN 'Utrzymanie' 
							WHEN UtrzymanieUchylenie = '1' or UtrzymanieUchylenie = 'true' THEN 'Uchylenie' 
							ELSE UtrzymanieUchylenie
								END 
		WHERE UtrzymanieUchylenie IN ('0', '1');

--END UtrzymanieUchylenie

--STRAT KontrolaPowod

	-- [zef2DW].[POWK_Dokument][KontrolaPowod]
	UPDATE [zef2DW].[POWK_Dokument] 
		SET KontrolaPowod =  CASE  
							WHEN KontrolaPowod = '0' or KontrolaPowod = 'false' THEN 'Z_urzedu' 
							WHEN KontrolaPowod = '1' or KontrolaPowod = 'true' THEN 'Na_wniosek_strony' 
							ELSE KontrolaPowod
								END 
		WHERE KontrolaPowod IN ('0', '1', 'false', 'true');

--END KontrolaPowod


-- START ZaswiadczenieOZaleglosciach


	-- [zef2DW].[SADS_Dokument][ZaswiadczenieOZaleglosciach]
	/* kolumna ZaswiadczenieOZaleglosciach została usunięta
	UPDATE [zef2DW].[SADS_Dokument] 
		SET ZaswiadczenieOZaleglosciach =  CASE  
							WHEN ZaswiadczenieOZaleglosciach = 'nie' or ZaswiadczenieOZaleglosciach = '0' or ZaswiadczenieOZaleglosciach = 'false' THEN 'Brak_aktualnych_zaswiadczen' 
							WHEN ZaswiadczenieOZaleglosciach = 'tak' or ZaswiadczenieOZaleglosciach = '1' or ZaswiadczenieOZaleglosciach = 'true' THEN 'Aktualne_zaswiadczenia' 
							ELSE ZaswiadczenieOZaleglosciach
								END 
		WHERE ZaswiadczenieOZaleglosciach IN ('0', '1', 'false', 'true', 'tak', 'nie');
	*/


	-- [zef2DW].[SADU_Dokument][ZaswiadczenieOZaleglosciach]
	UPDATE [zef2DW].[SADU_Dokument] 
		SET ZaswiadczenieOZaleglosciach =  CASE  
							WHEN ZaswiadczenieOZaleglosciach = 'nie' or ZaswiadczenieOZaleglosciach = '0' or ZaswiadczenieOZaleglosciach = 'false' THEN 'Brak_aktualnych_zaswiadczen' 
							WHEN ZaswiadczenieOZaleglosciach = 'tak' or ZaswiadczenieOZaleglosciach = '1' or ZaswiadczenieOZaleglosciach = 'true' THEN 'Aktualne_zaswiadczenia' 
							ELSE ZaswiadczenieOZaleglosciach
								END 
		WHERE ZaswiadczenieOZaleglosciach IN ('0', '1', 'false', 'true', 'tak', 'nie');

			-- [zef2DW].[USAD_Dokument][ZaswiadczenieOZaleglosciach]
	UPDATE [zef2DW].[USAD_Dokument] 
		SET ZaswiadczenieOZaleglosciach =  CASE  
							WHEN ZaswiadczenieOZaleglosciach = 'nie' or ZaswiadczenieOZaleglosciach = '0' or ZaswiadczenieOZaleglosciach = 'false' THEN 'Brak_aktualnych_zaswiadczen' 
							WHEN ZaswiadczenieOZaleglosciach = 'tak' or ZaswiadczenieOZaleglosciach = '1' or ZaswiadczenieOZaleglosciach = 'true' THEN 'Aktualne_zaswiadczenia' 
							ELSE ZaswiadczenieOZaleglosciach
								END 
		WHERE ZaswiadczenieOZaleglosciach IN ('0', '1', 'false', 'true', 'tak', 'nie');

--END ZaswiadczenieOZaleglosciach


-- START RodzajPotwierdzenia
			-- [zef2DW].[ZAKK_Dokument][RodzajPotwierdzenia]
	UPDATE [zef2DW].[ZAKK_Dokument] 
		SET RodzajPotwierdzenia =  CASE  
							WHEN RodzajPotwierdzenia = 'nie' or RodzajPotwierdzenia = '0' or RodzajPotwierdzenia = 'false' THEN 'Potwierdzenie_zlozenia_zabezp_akc' 
							WHEN RodzajPotwierdzenia = 'tak' or RodzajPotwierdzenia = '1' or RodzajPotwierdzenia = 'true' THEN 'Potwierdzenie_zaplaty_akcyzy' 
							ELSE RodzajPotwierdzenia
								END 
		WHERE RodzajPotwierdzenia IN ('0', '1', 'false', 'true', 'tak', 'nie');

--END RodzajPotwierdzenia
--START PotwierdzeniePokwitowanie
			-- [zef2DW].[ZAKP_Dokument][DecyzjaWydanaPrzez]
	UPDATE [zef2DW].[ZAKP_Dokument] 
		SET PotwierdzeniePokwitowanie =  CASE  
							WHEN PotwierdzeniePokwitowanie = 'nie' or PotwierdzeniePokwitowanie = '0' or PotwierdzeniePokwitowanie = 'false' THEN 'Potwierdzenie' 
							WHEN PotwierdzeniePokwitowanie = 'tak' or PotwierdzeniePokwitowanie = '1' or PotwierdzeniePokwitowanie = 'true' THEN 'Pokwitowanie' 
							ELSE PotwierdzeniePokwitowanie
								END 
		WHERE PotwierdzeniePokwitowanie IN ('0', '1', 'false', 'true', 'tak', 'nie');

--END PotwierdzeniePokwitowanie


































































	END