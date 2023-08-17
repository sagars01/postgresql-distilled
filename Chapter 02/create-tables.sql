---STEP 1 : Execute these queries to create the mini HR Department

BEGIN;


CREATE TABLE IF NOT EXISTS public.compensation
(
    compensation_id integer NOT NULL DEFAULT nextval('compensation_compensation_id_seq'::regclass),
    employee_id integer,
    salary numeric(10, 2),
    bonus numeric(10, 2),
    date_updated date,
    CONSTRAINT compensation_pkey PRIMARY KEY (compensation_id)
);

CREATE TABLE IF NOT EXISTS public.departments
(
    department_id integer NOT NULL DEFAULT nextval('departments_department_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default",
    head_id integer,
    CONSTRAINT departments_pkey PRIMARY KEY (department_id)
);

CREATE TABLE IF NOT EXISTS public.employees
(
    employee_id integer NOT NULL DEFAULT nextval('employees_employee_id_seq'::regclass),
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default",
    email character varying(100) COLLATE pg_catalog."default",
    address character varying(255) COLLATE pg_catalog."default",
    work_type character varying(50) COLLATE pg_catalog."default",
    married boolean,
    gender character varying(10) COLLATE pg_catalog."default",
    hire_date date,
    department_id integer,
    position_id integer,
    employee_type character varying(50) COLLATE pg_catalog."default",
    manager_id integer,
    CONSTRAINT employees_pkey PRIMARY KEY (employee_id)
);

CREATE TABLE IF NOT EXISTS public.performance_reviews
(
    review_id integer NOT NULL DEFAULT nextval('performance_reviews_review_id_seq'::regclass),
    employee_id integer,
    date date,
    rating integer,
    comments text COLLATE pg_catalog."default",
    CONSTRAINT performance_reviews_pkey PRIMARY KEY (review_id)
);

CREATE TABLE IF NOT EXISTS public.positions
(
    position_id integer NOT NULL DEFAULT nextval('positions_position_id_seq'::regclass),
    title character varying(100) COLLATE pg_catalog."default",
    primary_skillsets character varying(255) COLLATE pg_catalog."default",
    level character varying(50) COLLATE pg_catalog."default",
    next_level integer,
    CONSTRAINT positions_pkey PRIMARY KEY (position_id)
);

ALTER TABLE IF EXISTS public.compensation
    ADD CONSTRAINT compensation_employee_id_fkey FOREIGN KEY (employee_id)
    REFERENCES public.employees (employee_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.departments
    ADD CONSTRAINT departments_head_id_fkey FOREIGN KEY (head_id)
    REFERENCES public.employees (employee_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.employees
    ADD CONSTRAINT "dept.fk" FOREIGN KEY (department_id)
    REFERENCES public.departments (department_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_dept.fk"
    ON public.employees(department_id);


ALTER TABLE IF EXISTS public.employees
    ADD CONSTRAINT employees_manager_id_fkey FOREIGN KEY (manager_id)
    REFERENCES public.employees (employee_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.employees
    ADD CONSTRAINT employees_position_id_fkey FOREIGN KEY (position_id)
    REFERENCES public.positions (position_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.performance_reviews
    ADD CONSTRAINT performance_reviews_employee_id_fkey FOREIGN KEY (employee_id)
    REFERENCES public.employees (employee_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.positions
    ADD CONSTRAINT positions_next_level_fkey FOREIGN KEY (next_level)
    REFERENCES public.positions (position_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;

-- STEP 2: Import the data from mock-data folder using PgAdmin