with 

gen as (
SELECT 
	e as t_id, 
	uuid_generate_v4() as il_tid,
	ST_Point(2600000 + e, 1200000 + e) as geom,
	e as id,
	e as sta_id,
	'aname' as aname,
	'tierart' as tr_art,
	5 as tr_anz,
	'aufstallung_code' as stl_cd, 
	4 as a_woch, 
	6 as w_woch, 
	7 as mist, 
	9 as gu_vol, 
	'bemerkungen bemerkungen bemerkungen bemerkungen' as bem, 
	'aufstallung_text' as stl_tx, 
	'stao_name_bewirtschafter' as sta_nm	
FROM 
	pg_catalog.generate_series(1, 6000000) e
)
	 
insert into 
	afu_igel_pub_v1.igel_stall_shp
select * from gen
;

