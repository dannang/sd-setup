CREATE DATABASE historicaldata;
GRANT ALL PRIVILEGES ON DATABASE historicaldata TO postgres;

\c historicaldata

CREATE TABLE public.exchange
(
  idexchange serial PRIMARY KEY NOT NULL,
  marketsymbol character varying COLLATE pg_catalog."default"
);

CREATE TABLE public.data
(
    iddata serial PRIMARY KEY NOT NULL,
    date date,
    open double precision,
    high double precision,
    low double precision,
    close double precision,
    volume double precision,
    adjclose double precision,
    symbol character varying COLLATE pg_catalog."default",
    idexchange integer NULL
)

WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.data OWNER to postgres;

ALTER TABLE public.exchange OWNER to postgres;