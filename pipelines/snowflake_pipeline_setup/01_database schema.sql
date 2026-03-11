create database if not exists healthpulse_prod_db;

use healthpulse_s3_db;

create schema if not exists bronze_schema;
create schema if not exists silver_schema;
create schema if not exists gold_schema;