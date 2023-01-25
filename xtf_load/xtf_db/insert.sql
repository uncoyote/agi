with 

gen as (
SELECT 
	e as t_id, 
	uuid_generate_v4() as t_ili_tid,
	ST_Point(2600000 + e, 1200000 + e) as geometrie,
	e as id,
	e as standort_id,
	'aname' as aname,
	'tierart' as tierart,
	5 as anzahl_tiere,
	'aufstallung_code' as aufstallung_code, 
	4 as aufenthalt_wochen, 
	6 as winterfuetterung_wochen, 
	7 as mistplatzflaeche, 
	9 as guelle_volumen, 
	'bemerkungen bemerkungen bemerkungen bemerkungen' as bemerkungen, 
	'aufstallung_text' as aufstallung_text, 
	'stao_name_bewirtschafter' as stao_name_bewirtschafter	
FROM 
	pg_catalog.generate_series(1, 6000000) e
)
	 
insert into 
	afu_igel_pub_v1.igel_stall
select * from gen
;