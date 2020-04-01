CREATE DATABASE transit;

\c transit;

CREATE SCHEMA gtfs;

CREATE TABLE agency (
	agency_key int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	agency_name text NOT NULL,
	website_url text NOT NULL,
	timezone_key int NOT NULL,
	language_key int NULL,
	country_key int NULL,
	phone_number char(10) NULL,
	fare_url text NULL,
	email_address text NULL,
	agency_id text NULL,
	dataset_key int NULL
);

CREATE TABLE bikes_allowed_type(
	bikes_allowed_type_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	bikes_allowed_type_id int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE country(
	country_key int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	country_name text NOT NULL,
	phone_prefix int NOT NULL
);

CREATE TABLE currency(
	currency_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	currency_id nchar(3) NOT NULL,
	description text NOT NULL
);

CREATE TABLE dataset(
	dataset_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	dataset_name varchar(255) NOT NULL,
	organization_key int NOT NULL,
	last_modified_by_user_key int NOT NULL,
	last_modified_date TIMESTAMP NOT NULL,
	created_by_user_key int NOT NULL,
	created_date TIMESTAMP NOT NULL
);

CREATE TABLE drop_off_type(
	drop_off_type_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	drop_off_type_id int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE fare_class(
	fare_class_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	price decimal(38, 3) NOT NULL,
	currency_key int NOT NULL,
	payment_method_key int NOT NULL,
	transfer_type_key int NOT NULL,
	transfer_duration int NULL,
	fare_class_id varchar(500) NULL,
	agency_key int NOT NULL,
	dataset_key int NULL
);

CREATE TABLE fare_rule(
	fare_rule_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	fare_class_key int NOT NULL,
	route_key int NOT NULL,
	origin_zone_key int NULL,
	destination_zone_key int NULL,
	contains_zone_key int NULL,
	dataset_key int NULL
);

CREATE TABLE language(
	language_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	language_name text NOT NULL,
	code varchar(2) NOT NULL,
	localized_name text NULL
);

CREATE TABLE location_type(
	location_type_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	location_type_id int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE organization(
	organization_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	organization_name text NOT NULL
);

CREATE TABLE payment_method(
	payment_method_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	payment_method_id int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE pickup_type(
	pickup_type_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	pickup_type_id int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE route(
	route_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	route_id varchar(500) NOT NULL,
	agency_key int NOT NULL,
	short_name text NULL,
	long_name text NULL,
	description text NULL,
	route_type_key int NOT NULL,
	web_url text NULL,
	color varchar(6) NULL,
	text_color varchar(6) NULL,
	sort_order int NULL,
	dataset_key int NULL
);

CREATE TABLE route_type(
	route_type_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	route_type_id int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE service_exception(
	service_exception_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	service_schedule_key int NOT NULL,
	exception_date date NOT NULL,
	service_exception_type_key int NOT NULL,
	dataset_key int NULL
);

CREATE TABLE service_exception_type(
	service_exception_type_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	service_exception_type_id int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE service_schedule(
	service_schedule_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	service_schedule_id varchar(500) NOT NULL,
	human_readable_description text NULL,
	monday_service_type_key int NULL,
	tuesday_service_type_key int NULL,
	wednesday_service_type_key int NULL,
	thursday_service_type_key int NULL,
	friday_service_type_key int NULL,
	saturday_service_type_key int NULL,
	sunday_service_type_key int NULL,
	start_date date NULL,
	end_date date NULL,
	dataset_key int NULL
);

CREATE TABLE service_type(
	service_type_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	service_type_id int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE shape(
	shape_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	shape_id varchar(500) NOT NULL,
	dataset_key int NULL
);

CREATE TABLE shape_point(
	shape_point_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
    point_point_location geography NOT NULL,
	point_sequence int NOT NULL,
	shape_distance_meters_traveled bigint NOT NULL,
	shape_key int NULL,
	dataset_key int NULL
);

CREATE TABLE stop(
	stop_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	stop_id varchar(500) NOT NULL,
	short_name text NULL,
	full_name text NULL,
	description text NULL,
	point_location geography NULL,
	zone_key int NULL,
	web_url text NULL,
	location_type_key int NULL,
	parent_stop_key int NULL,
	level_key int NULL,
	platform_code text NULL,
	wheelchair_boarding_type_key int NULL,
	timezone_key int NULL,
	dataset_key int NULL
);

CREATE TABLE stop_trip_link(
	stop_trip_link_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	stop_key int NOT NULL,
	trip_key int NOT NULL,
	arrival_time TIMESTAMP NULL,
	departure_time TIMESTAMP NULL,
	stop_sequence int NOT NULL,
	stop_headsign text NULL,
	pickup_type_key int NULL,
	drop_off_type_key int NULL,
	shape_distance_meters_traveled int NULL,
	is_timepoint int NOT NULL,
	dataset_key int NULL
);

CREATE TABLE timezone(
	timezone_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	label text NOT NULL,
	timezone_id text NULL
);
DROP TABLE transfer_type;
CREATE TABLE transfer_type(
	transfer_type_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	transfer_typeId int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE trip(
	trip_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	trip_id varchar(500) NOT NULL,
	service_schedule_key int NOT NULL,
	route_key int NOT NULL,
	headsign text NULL,
	short_name text NULL,
	trip_direction_key int NULL,
	trip_block_key int NULL,
	shape_key int NULL,
	wheelchair_accessible_type_key int NULL,
	bikes_allowed_type_key int NULL,
	dataset_key int NULL
);

CREATE TABLE trip_block(
	trip_block_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	trip_block_id varchar(500) NOT NULL,
	description text NULL,
	dataset_key int NULL
);

CREATE TABLE trip_direction(
	trip_direction_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	trip_direction_id text NOT NULL
);

CREATE TABLE user_account(
	user_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	email_address varchar(512) NOT NULL,
	password_hash bytea NOT NULL,
	salt bytea NOT NULL,
	first_name text NULL,
	last_name text NULL
);

CREATE TABLE wheelchair_accessible_type(
	wheelchair_accessible_type_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	wheelchair_accessible_type_id int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE wheelchair_boarding_type(
	wheelchair_boarding_type_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	wheelchair_boarding_type_id int NOT NULL,
	description text NOT NULL,
	label text NOT NULL
);

CREATE TABLE zone (
	zone_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	zone_id varchar(500) NOT NULL,
	name text NULL,
	dataset_key int NULL
);

CREATE TABLE gtfs.agency(
	agency_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	agency_id text NULL,
	agency_name text NOT NULL,
	agency_url text NOT NULL,
	agency_timezone text NOT NULL,
	agency_lang text NULL,
	agency_phone text NULL,
	agency_fare_url text NULL,
	agency_email text NULL
);

CREATE TABLE gtfs.calendar(
	calendar_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	service_id text NOT NULL,
	monday int NOT NULL,
	tuesday int NOT NULL,
	wednesday int NOT NULL,
	thursday int NOT NULL,
	friday int NOT NULL,
	saturday int NOT NULL,
	sunday int NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL
);

CREATE TABLE gtfs.calendar_date(
	calendar_date_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	service_id text NOT NULL,
	calendar_date date NOT NULL,
	exception_type int NOT NULL
);

CREATE TABLE gtfs.fare_attribute(
	fare_attribute_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	fare_id text NOT NULL,
	price decimal(38, 3) NOT NULL,
	currency_type text NOT NULL,
	payment_method int NOT NULL,
	transfers int NOT NULL,
	agency_id text NOT NULL,
	transfer_duration int NOT NULL
);

CREATE TABLE gtfs.fare_rule(
	fare_rule_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	fare_id text NOT NULL,
	route_id text NULL,
	origin_id text NULL,
	destination_id text NULL,
	contains_id text NULL
);

CREATE TABLE gtfs.route(
	route_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	route_id text NOT NULL,
	agency_id text NULL,
	route_short_name text NULL,
	route_long_name text NULL,
	route_desc text NULL,
	route_type int NOT NULL,
	route_color varchar(7) NULL,
	route_text_color varchar(7) NULL,
	route_sort_order int NULL,
	route_url text NULL
);

CREATE TABLE gtfs.shape(
	shape_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	shape_id text NOT NULL,
	shape_pt_lat decimal(9, 6) NOT NULL,
	shape_pt_lon decimal(9, 6) NOT NULL,
	shape_pt_sequence int NOT NULL,
	shape_dist_traveled decimal(38, 10) NULL
);

CREATE TABLE gtfs.stop(
	stop_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	stop_id text NOT NULL,
	stop_code text NULL,
	stop_name text NULL,
	stop_desc text NULL,
	stop_lat decimal(9, 6) NULL,
	stop_lon decimal(9, 6) NULL,
	zone_id text NULL,
	stop_url text NULL,
	point_location_type int NULL,
	parent_station text NULL,
	stop_timezone text NULL,
	wheelchair_boarding int NULL,
	level_id text NULL,
	platform_code text NULL
);

CREATE TABLE gtfs.stop_time(
	stop_time_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	trip_id text NOT NULL,
	arrival_time text NULL,
	departure_time text NULL,
	stop_id text NOT NULL,
	stop_sequence int NOT NULL,
	stop_headsign text NULL,
	pickup_type int NULL,
	drop_off_type int NULL,
	shape_dist_traveled decimal(38, 10) NULL,
	timepoint int NULL
);

CREATE TABLE gtfs.trip(
	trip_key INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
	ctl_is_delete bit NOT NULL,
	ctl_created_date TIMESTAMP NOT NULL,
	ctl_created_by varchar(100) NOT NULL,
	ctl_last_modified_date TIMESTAMP NOT NULL,
	ctl_last_modified_by varchar(100) NOT NULL,
	route_id text NOT NULL,
	service_id text NOT NULL,
	trip_id text NOT NULL,
	trip_headsign text NULL,
	trip_short_name text NULL,
	direction_id int NULL,
	block_id text NULL,
	shape_id text NULL,
	wheelchair_accessible int NULL,
	bikes_allowed int NULL
);

CREATE UNIQUE INDEX ix_agency_nk ON agency
(
	dataset_key ASC,
	agency_id ASC
);

CREATE INDEX ix_dataset_nk ON dataset
(
	dataset_name ASC,
	organization_key ASC
);

CREATE UNIQUE INDEX ix_fare_class_nk ON fare_class
(
	dataset_key ASC,
	fare_class_id ASC
);

CREATE UNIQUE INDEX ix_fare_rule_nk ON fare_rule
(
	dataset_key ASC,
	fare_class_key ASC,
	route_key ASC,
	origin_zone_key ASC,
	destination_zone_key ASC,
	contains_zone_key ASC
);

CREATE UNIQUE INDEX ix_route_nk ON route
(
	dataset_key ASC,
	route_id ASC
);

CREATE UNIQUE INDEX ix_service_exception_nk ON service_exception
(
	dataset_key ASC,
	service_schedule_key ASC,
	exception_date ASC
);

CREATE UNIQUE INDEX ix_service_schedule_nk ON service_schedule
(
	dataset_key ASC,
	service_schedule_id ASC
);

CREATE UNIQUE INDEX ix_Shape_nk ON Shape
(
	dataset_key ASC,
	shape_id ASC
);

CREATE UNIQUE INDEX ix_shape_point_nk ON shape_point
(
	dataset_key ASC,
	shape_key ASC,
	point_sequence ASC
);

CREATE UNIQUE INDEX ix_stop_nk ON stop
(
	dataset_key ASC,
	stop_id ASC
);

CREATE UNIQUE INDEX ix_stop_trip_link_nk ON stop_trip_link
(
	dataset_key ASC,
	stop_key ASC,
	trip_key ASC,
	stop_sequence ASC
);

CREATE UNIQUE INDEX ix_trip_nk ON trip
(
	dataset_key ASC,
	trip_id ASC
);

CREATE UNIQUE INDEX ix_trip_block_nk ON trip_block
(
	dataset_key ASC,
	trip_block_id ASC
);

CREATE INDEX ix_user_nk ON user_account
(
	email_address ASC
);

CREATE UNIQUE INDEX ix_zone_nk ON zone
(
	dataset_key ASC,
	zone_id ASC
);

ALTER TABLE agency ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE agency ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE agency ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE agency ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE agency ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE bikes_allowed_type ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE bikes_allowed_type ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE bikes_allowed_type ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE bikes_allowed_type ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE bikes_allowed_type ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE country ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE country ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE country ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE country ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE country ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE currency ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE currency ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE currency ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE currency ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE currency ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE dataset ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE dataset ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE dataset ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE dataset ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE dataset ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE drop_off_type ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE drop_off_type ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE drop_off_type ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE drop_off_type ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE drop_off_type ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE fare_class ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE fare_class ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE fare_class ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE fare_class ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE fare_class ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE fare_rule ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE fare_rule ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE fare_rule ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE fare_rule ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE fare_rule ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE language ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE language ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE language ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE language ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE language ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE location_type ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE location_type ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE location_type ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE location_type ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE location_type ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE organization ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE organization ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE organization ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE organization ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE organization ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE payment_method ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE payment_method ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE payment_method ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE payment_method ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE payment_method ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE pickup_type ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE pickup_type ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE pickup_type ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE pickup_type ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE pickup_type ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE route ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE route ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE route ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE route ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE route ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE route_type ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE route_type ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE route_type ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE route_type ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE route_type ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE service_exception ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE service_exception ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE service_exception ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE service_exception ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE service_exception ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE service_exception_type ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE service_exception_type ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE service_exception_type ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE service_exception_type ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE service_exception_type ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE service_schedule ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE service_schedule ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE service_schedule ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE service_schedule ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE service_schedule ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE service_type ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE service_type ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE service_type ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE service_type ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE service_type ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE shape ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE shape ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE shape ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE shape ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE shape ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE shape_point ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE shape_point ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE shape_point ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE shape_point ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE shape_point ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE stop ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE stop ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE stop ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE stop ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE stop ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE stop_trip_link ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE stop_trip_link ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE stop_trip_link ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE stop_trip_link ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE stop_trip_link ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE stop_trip_link ALTER COLUMN IsTimepoint SET DEFAULT ((1));
ALTER TABLE timezone ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE timezone ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE timezone ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE timezone ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE timezone ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE transfer_type ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE transfer_type ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE transfer_type ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE transfer_type ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE transfer_type ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE trip ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE trip ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE trip ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE trip ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE trip ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE trip_block ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE trip_block ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE trip_block ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE trip_block ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE trip_block ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE trip_direction ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE trip_direction ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE trip_direction ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE trip_direction ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE trip_direction ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE user_account ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE user_account ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE user_account ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE user_account ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE user_account ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE wheelchair_accessible_type ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE wheelchair_accessible_type ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE wheelchair_accessible_type ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE wheelchair_accessible_type ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE wheelchair_accessible_type ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE wheelchair_boarding_type ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE wheelchair_boarding_type ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE wheelchair_boarding_type ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE wheelchair_boarding_type ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE wheelchair_boarding_type ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE zone ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE zone ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE zone ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE zone ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE zone ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE gtfs.agency ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE gtfs.agency ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE gtfs.agency ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE gtfs.agency ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE gtfs.agency ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE gtfs.calendar ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE gtfs.calendar ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE gtfs.calendar ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE gtfs.calendar ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE gtfs.calendar ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE gtfs.calendar_date ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE gtfs.calendar_date ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE gtfs.calendar_date ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE gtfs.calendar_date ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE gtfs.calendar_date ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE gtfs.fare_attribute ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE gtfs.fare_attribute ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE gtfs.fare_attribute ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE gtfs.fare_attribute ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE gtfs.fare_attribute ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE gtfs.fare_rule ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE gtfs.fare_rule ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE gtfs.fare_rule ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE gtfs.fare_rule ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE gtfs.fare_rule ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE gtfs.route ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE gtfs.route ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE gtfs.route ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE gtfs.route ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE gtfs.route ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE gtfs.shape ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE gtfs.shape ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE gtfs.shape ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE gtfs.shape ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE gtfs.shape ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE gtfs.stop ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE gtfs.stop ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE gtfs.stop ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE gtfs.stop ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE gtfs.stop ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE gtfs.stop_time ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE gtfs.stop_time ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE gtfs.stop_time ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE gtfs.stop_time ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE gtfs.stop_time ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;
ALTER TABLE gtfs.trip ALTER COLUMN ctl_is_delete SET DEFAULT CAST(0 AS BIT);
ALTER TABLE gtfs.trip ALTER COLUMN ctl_created_date SET DEFAULT NOW();
ALTER TABLE gtfs.trip ALTER COLUMN ctl_created_by SET DEFAULT current_user;
ALTER TABLE gtfs.trip ALTER COLUMN ctl_last_modified_date SET DEFAULT NOW();
ALTER TABLE gtfs.trip ALTER COLUMN ctl_last_modified_by SET DEFAULT current_user;

ALTER TABLE agency ADD  CONSTRAINT FK_agency_country_key FOREIGN KEY(country_key)
REFERENCES country (country_key);
ALTER TABLE agency ADD  CONSTRAINT FK_agency_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);
ALTER TABLE agency ADD  CONSTRAINT FK_agency_language_key FOREIGN KEY(language_key)
REFERENCES language (language_key);
ALTER TABLE agency ADD  CONSTRAINT FK_agency_timezone_key FOREIGN KEY(timezone_key)
REFERENCES timezone (timezone_key);
ALTER TABLE fare_class ADD  CONSTRAINT FK_fare_class_agency_key FOREIGN KEY(agency_key)
REFERENCES agency (agency_key);

ALTER TABLE fare_class ADD  CONSTRAINT FK_fare_class_currency_key FOREIGN KEY(currency_key)
REFERENCES currency (currency_key);

ALTER TABLE fare_class ADD  CONSTRAINT FK_fare_class_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);

ALTER TABLE fare_class ADD  CONSTRAINT FK_fare_class_payment_method_key FOREIGN KEY(payment_method_key)
REFERENCES payment_method (payment_method_key);

ALTER TABLE fare_class ADD  CONSTRAINT FK_fare_class_transfer_type_key FOREIGN KEY(transfer_type_key)
REFERENCES transfer_type (transfer_type_key);

ALTER TABLE fare_rule ADD  CONSTRAINT FK_fare_rule_contains_zone_key FOREIGN KEY(contains_zone_key)
REFERENCES zone (zone_key);

ALTER TABLE fare_rule ADD  CONSTRAINT FK_fare_rule_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);

ALTER TABLE fare_rule ADD  CONSTRAINT FK_fare_rule_destination_zone_key FOREIGN KEY(destination_zone_key)
REFERENCES zone (zone_key);

ALTER TABLE fare_rule ADD  CONSTRAINT FK_fare_rule_fare_class_key FOREIGN KEY(fare_class_key)
REFERENCES fare_class (fare_class_key);

ALTER TABLE fare_rule ADD  CONSTRAINT FK_fare_rule_origin_zone_key FOREIGN KEY(origin_zone_key)
REFERENCES zone (zone_key);

ALTER TABLE fare_rule ADD  CONSTRAINT FK_fare_rule_route_key FOREIGN KEY(route_key)
REFERENCES route (route_key);

ALTER TABLE route ADD  CONSTRAINT FK_route_agency_key FOREIGN KEY(agency_key)
REFERENCES agency (agency_key);

ALTER TABLE route ADD  CONSTRAINT FK_route_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);

ALTER TABLE route ADD  CONSTRAINT FK_route_route_type_key FOREIGN KEY(route_type_key)
REFERENCES route_type (route_type_key);

ALTER TABLE service_exception ADD  CONSTRAINT FK_service_exception_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);

ALTER TABLE shape_point ADD  CONSTRAINT FK_shape_point_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);

ALTER TABLE stop ADD  CONSTRAINT FK_stop_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);

ALTER TABLE stop ADD  CONSTRAINT FK_stop_location_type_key FOREIGN KEY(location_type_key)
REFERENCES location_type (location_type_key);

ALTER TABLE stop ADD  CONSTRAINT FK_stop_parent_stop_key FOREIGN KEY(parent_stop_key)
REFERENCES stop (stop_key);

ALTER TABLE stop ADD  CONSTRAINT FK_stop_timezone_key FOREIGN KEY(timezone_key)
REFERENCES timezone (timezone_key);

ALTER TABLE stop ADD  CONSTRAINT FK_stop_wheelchair_boarding_type_key FOREIGN KEY(wheelchair_boarding_type_key)
REFERENCES wheelchair_boarding_type (wheelchair_boarding_type_key);

ALTER TABLE stop ADD  CONSTRAINT FK_stop_zone_key FOREIGN KEY(zone_key)
REFERENCES zone (zone_key);

ALTER TABLE stop_trip_link ADD  CONSTRAINT FK_stop_trip_link_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);

ALTER TABLE stop_trip_link ADD  CONSTRAINT FK_stop_trip_link_drop_off_typeKey FOREIGN KEY(drop_off_type_key)
REFERENCES drop_off_type (drop_off_type_key);

ALTER TABLE stop_trip_link ADD  CONSTRAINT FK_stop_trip_link_pickup_type_key FOREIGN KEY(pickup_type_key)
REFERENCES pickup_type (pickup_type_key);

ALTER TABLE stop_trip_link ADD  CONSTRAINT FK_stop_trip_link_stop_key FOREIGN KEY(stop_key)
REFERENCES stop (stop_key);

ALTER TABLE stop_trip_link ADD  CONSTRAINT FK_stop_trip_link_trip_key FOREIGN KEY(trip_key)
REFERENCES trip (trip_key);

ALTER TABLE trip ADD  CONSTRAINT FK_trip_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);

ALTER TABLE trip ADD  CONSTRAINT FK_trip_route_key FOREIGN KEY(route_key)
REFERENCES route (route_key);

ALTER TABLE trip ADD  CONSTRAINT FK_trip_service_schedule_key FOREIGN KEY(service_schedule_key)
REFERENCES service_schedule (service_schedule_key);

ALTER TABLE trip ADD  CONSTRAINT FK_trip_shape_key FOREIGN KEY(shape_key)
REFERENCES Shape (shape_key);

ALTER TABLE trip ADD  CONSTRAINT FK_trip_trip_block_key FOREIGN KEY(trip_block_key)
REFERENCES trip_block (trip_block_key);

ALTER TABLE trip ADD  CONSTRAINT FK_trip_wheelchair_accessible_type_key FOREIGN KEY(wheelchair_accessible_type_key)
REFERENCES wheelchair_accessible_type (wheelchair_accessible_type_key);

ALTER TABLE trip_block ADD  CONSTRAINT FK_trip_block_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);

ALTER TABLE zone ADD  CONSTRAINT FK_zone_dataset_key FOREIGN KEY(dataset_key)
REFERENCES dataset (dataset_key);