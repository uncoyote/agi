-- afu_igel_pub_v1.igel_stall definition

-- Drop table

-- DROP TABLE afu_igel_pub_v1.igel_stall;

CREATE TABLE afu_igel_pub_v1.igel_stall_shp (
	t_id int4 NOT null, --int8 bug
	il_tid uuid NULL DEFAULT uuid_generate_v4(),	
	geom public.geometry(point, 2056) NOT NULL,
	id int4 NOT NULL,
	sta_id int4 NOT NULL,
	aname varchar(400) NULL,
	tr_art varchar(120) NULL,
	tr_anz int4 NULL,
	stl_cd varchar(60) NULL,
	a_woch int4 NULL,
	w_woch int4 NULL,
	mist numeric(9, 3) NULL,
	gu_vol numeric(9, 3) NULL,
	bem varchar(4000) NULL,
	stl_tx varchar(100) NULL,
	sta_nm varchar(401) NULL,
	CONSTRAINT igel_stall_shp_aname_check CHECK ((length(btrim((aname)::text)) >= 1)),
	CONSTRAINT igel_stall_shp_aufstallung_code_check CHECK ((("position"((stl_cd)::text, '\n'::text) = 0) AND ("position"((stl_cd)::text, '\r'::text) = 0) AND ("position"((stl_cd)::text, '\t'::text) = 0) AND (length(btrim((stl_cd)::text)) >= 1))),
	CONSTRAINT igel_stall_shp_aufstallung_text_check CHECK ((length(btrim((stl_tx)::text)) >= 1)),
	CONSTRAINT igel_stall_shp_bemerkungen_check CHECK ((length(btrim((bem)::text)) >= 1)),
	CONSTRAINT igel_stall_shp_pkey PRIMARY KEY (t_id),
	CONSTRAINT igel_stall_shp_stao_name_bewirtschafter_check CHECK ((length(btrim((sta_nm)::text)) >= 1)),
	CONSTRAINT igel_stall_shp_tierart_check CHECK ((length(btrim((tr_art)::text)) >= 1))
);
CREATE INDEX igel_stall_shp_geometrie_idx ON afu_igel_pub_v1.igel_stall USING gist (geometrie);