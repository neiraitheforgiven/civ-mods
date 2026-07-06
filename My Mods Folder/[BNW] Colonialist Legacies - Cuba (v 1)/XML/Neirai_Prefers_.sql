-- Technology for Rebel Camps
insert into Technologies (
	Type,
	Cost,
	Disable,
	Description,
	Civilopedia,
	Help,
	Era,
	GridX,
	GridY,
	PortraitIndex,
	IconAtlas
) values (
	'TECH_GORILLAWARFARE',
	0,
	1,
	'TXT_KEY_TECH_GORILLAWARFARE_TITLE',
	'TXT_KEY_TECH_GORILLAWARFARE_DESC',
	'TXT_KEY_TECH_GORILLAWARFARE_HELP',
	'ERA_ANCIENT',
	0,
	-12,
	43,
	'TECH_ATLAS_1'
);

insert into Language_en_US (
	Tag,
	Text
) values (
	'TXT_KEY_TECH_GORILLAWARFARE_TITLE', 'Behind Enemy Lines' ),
	('TXT_KEY_TECH_GORILLAWARFARE_DESC', 'Move your Guerilleros behind enemy lines to get this Tech.' ),
	('TXT_KEY_TECH_GORILLAWARFARE_HELP', 'Enables the Rebel Camp');