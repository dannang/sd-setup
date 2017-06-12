-- Table: public.data
DROP TABLE public.data;

CREATE TABLE public.data
(
    iddata integer NOT NULL DEFAULT nextval('data_iddata_seq'::regclass),
    date date,
    open double precision,
    high double precision,
    low double precision,
    close double precision,
    volume double precision,
    adjclose double precision,
    symbol character varying COLLATE pg_catalog."default",
    idexchange integer,
    CONSTRAINT data_pkey PRIMARY KEY (iddata),
    CONSTRAINT data_idexchange_fkey FOREIGN KEY (idexchange)
        REFERENCES public.exchange (idexchange) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

CREATE TABLE public.exchange
(
    idexchange integer NOT NULL DEFAULT nextval('exchange_idexchange_seq'::regclass),
    marketsymbol character varying COLLATE pg_catalog."default",
    CONSTRAINT exchange_pkey PRIMARY KEY (idexchange)
)


WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.data
    OWNER to postgres;

    ALTER TABLE public.exchange
    OWNER to postgres;