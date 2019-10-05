CREATE VIEW gust.V1_kurs_walutGUSTAW
AS

SELECT 

case 
when kw.Miesiac='01205' then '0106'
when kw.Miesiac='0106'  then '0206'
when kw.Miesiac='0206'  then '0306'
when kw.Miesiac='0306'  then '0406'
when kw.Miesiac='0406'  then '0506'
when kw.Miesiac='0506'  then '0606'
when kw.Miesiac='0606'  then '0706'
when kw.Miesiac='0706'  then '0806'
when kw.Miesiac='0806'  then '0906'
when kw.Miesiac='0906'  then '1006'
when kw.Miesiac='01006'  then '1106'
when kw.Miesiac='01106'  then '1206'
when kw.Miesiac='01206'  then '0107'
when kw.Miesiac='0107' then '0207'
when kw.Miesiac='0207' then '0307'
when kw.Miesiac='0307' then '0407'
when kw.Miesiac='0407' then '0507'
when kw.Miesiac='0507' then '0607'
when kw.Miesiac='0607' then '0707'
when kw.Miesiac='0707' then '0807'
when kw.Miesiac='0807' then '0907'
when kw.Miesiac='0907' then '1007'
when kw.Miesiac='01007' then '1107'
when kw.Miesiac='01107' then '1207'
when kw.Miesiac='01207' then '0108'
when kw.Miesiac='0108' then '0208'
when kw.Miesiac='0208' then '0308'
when kw.Miesiac='0308' then '0408'
when kw.Miesiac='0408' then '0508'
when kw.Miesiac='0508' then '0608'
when kw.Miesiac='0608' then '0708'
when kw.Miesiac='0708' then '0808'
when kw.Miesiac='0808' then '0908'
when kw.Miesiac='0908' then '1008'
when kw.Miesiac='01008' then '1108'
when kw.Miesiac='01108' then '1208'
when kw.Miesiac='01208' then '0109'
when kw.Miesiac='0109' then '0209'
when kw.Miesiac='0209' then '0309'
when kw.Miesiac='0309' then '0409'
when kw.Miesiac='0409' then '0509'
when kw.Miesiac='0509' then '0609'
when kw.Miesiac='0609' then '0709'
when kw.Miesiac='0709' then '0809'
when kw.Miesiac='0809' then '0909'
when kw.Miesiac='0909' then '1009'

else Miesiac
end as Miesiac, id_waluty, kurs, z_dnia 

FROM      gust.V1_kurs_walut kw