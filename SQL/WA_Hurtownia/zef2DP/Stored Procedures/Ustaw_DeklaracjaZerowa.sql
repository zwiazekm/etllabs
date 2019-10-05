




CREATE PROCEDURE [zef2DP].[Ustaw_DeklaracjaZerowa]

  AS
    BEGIN

		UPDATE [zef2DP].[AKC4_Deklaracja] SET DeklaracjaZerowa ='false'
		WHERE [IdentyfikatorDokumentu] IN (
		select DISTINCT
		[zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu] as AKC
		from [zef2DP].[AKC4_Deklaracja]
		left outer join [zef2DP].[AKC4_ZalacznikA] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikA].[IdentyfikatorDokumentu]
		left outer join [zef2DP].[AKC4_ZalacznikB] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikB].[IdentyfikatorDokumentu]
		left outer join [zef2DP].[AKC4_ZalacznikC] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikC].[IdentyfikatorDokumentu]
		left outer join [zef2DP].[AKC4_ZalacznikD] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikD].[IdentyfikatorDokumentu]
		left outer join [zef2DP].[AKC4_ZalacznikE] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikE].[IdentyfikatorDokumentu]
		left outer join [zef2DP].[AKC4_ZalacznikF] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikF].[IdentyfikatorDokumentu]
		left outer join [zef2DP].[AKC4_ZalacznikH] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikH].[IdentyfikatorDokumentu]
		left outer join [zef2DP].[AKC4_ZalacznikI] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikI].[IdentyfikatorDokumentu]
		left outer join [zef2DP].[AKC4_ZalacznikJ] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikJ].[IdentyfikatorDokumentu]
		left outer join [zef2DP].[AKC4_ZalacznikK] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikK].[IdentyfikatorDokumentu]
		left outer join [zef2DP].[AKC4_ZalacznikL] on [zef2DP].[AKC4_Deklaracja].[IdentyfikatorDokumentu]  = [zef2DP].[AKC4_ZalacznikL].[IdentyfikatorDokumentu]

		WHERE Deklaracjazerowa = 'true' AND (
		[zef2DP].[AKC4_ZalacznikA].[IdentyfikatorDokumentu] is not null or 
		[zef2DP].[AKC4_ZalacznikB].[IdentyfikatorDokumentu] is not null or 
		[zef2DP].[AKC4_ZalacznikC].[IdentyfikatorDokumentu] is not null or 
		[zef2DP].[AKC4_ZalacznikD].[IdentyfikatorDokumentu] is not null or 
		[zef2DP].[AKC4_ZalacznikE].[IdentyfikatorDokumentu] is not null or 
		[zef2DP].[AKC4_ZalacznikF].[IdentyfikatorDokumentu] is not null or 
		[zef2DP].[AKC4_ZalacznikH].[IdentyfikatorDokumentu] is not null or 
		[zef2DP].[AKC4_ZalacznikI].[IdentyfikatorDokumentu] is not null or 
		[zef2DP].[AKC4_ZalacznikJ].[IdentyfikatorDokumentu] is not null or
		[zef2DP].[AKC4_ZalacznikK].[IdentyfikatorDokumentu] is not null or 
		[zef2DP].[AKC4_ZalacznikL].[IdentyfikatorDokumentu] is not null ))


    END