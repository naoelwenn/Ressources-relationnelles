
ALTER SCHEMA public OWNER TO pg_database_owner;


SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.acceder (
    utilisateur_id integer NOT NULL,
    ressource_id integer NOT NULL
);


ALTER TABLE public.acceder OWNER TO postgres;

CREATE TABLE public.categorie_ressource (
    id integer NOT NULL,
    libelle character varying(255)
);


ALTER TABLE public.categorie_ressource OWNER TO postgres;

CREATE SEQUENCE public.categorie_ressource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorie_ressource_id_seq OWNER TO postgres;

ALTER SEQUENCE public.categorie_ressource_id_seq OWNED BY public.categorie_ressource.id;


CREATE TABLE public.commentaire (
    id integer NOT NULL,
    contenu text,
    datecreation timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ressource_id integer,
    utilisateur_id integer
);


ALTER TABLE public.commentaire OWNER TO postgres;

CREATE SEQUENCE public.commentaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commentaire_id_seq OWNER TO postgres;

ALTER SEQUENCE public.commentaire_id_seq OWNED BY public.commentaire.id;

CREATE TABLE public.favoris (
    utilisateur_id integer NOT NULL,
    ressource_id integer NOT NULL
);


ALTER TABLE public.favoris OWNER TO postgres;

CREATE TABLE public.participer (
    utilisateur_id integer NOT NULL,
    ressource_id integer NOT NULL
);


ALTER TABLE public.participer OWNER TO postgres;

CREATE TABLE public.ressource (
    id bigint NOT NULL,
    titre character varying(255),
    datecreation timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    contenu character varying(255),
    public boolean,
    valide boolean,
    suspendu boolean,
    type_ressource_id integer,
    categorie_ressource_id integer,
    utilisateur_id bigint,
    date_creation timestamp(6) without time zone
);


ALTER TABLE public.ressource OWNER TO postgres;

CREATE SEQUENCE public.ressource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ressource_id_seq OWNER TO postgres;

ALTER SEQUENCE public.ressource_id_seq OWNED BY public.ressource.id;

CREATE TABLE public.ressource_type_relation (
    ressource_id bigint NOT NULL,
    type_relation_id integer NOT NULL
);


ALTER TABLE public.ressource_type_relation OWNER TO postgres;

CREATE TABLE public.role (
    id integer NOT NULL,
    libelle character varying(50)
);


ALTER TABLE public.role OWNER TO postgres;

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO postgres;

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;

CREATE TABLE public.type_relation (
    id integer NOT NULL,
    libelle character varying(255)
);


ALTER TABLE public.type_relation OWNER TO postgres;

CREATE SEQUENCE public.type_relation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_relation_id_seq OWNER TO postgres;

ALTER SEQUENCE public.type_relation_id_seq OWNED BY public.type_relation.id;

CREATE TABLE public.type_ressource (
    id integer NOT NULL,
    libelle character varying(255)
);


ALTER TABLE public.type_ressource OWNER TO postgres;

CREATE SEQUENCE public.type_ressource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_ressource_id_seq OWNER TO postgres;

ALTER SEQUENCE public.type_ressource_id_seq OWNED BY public.type_ressource.id;

CREATE TABLE public.utilisateur (
    id bigint NOT NULL,
    email character varying(255),
    pseudo character varying(255),
    codepostal character varying(255),
    ville character varying(255),
    password character varying(255),
    anneenaissance integer,
    etatcivil character varying(255),
    actif boolean,
    role_id integer,
    mot_de_passe character varying(255),
    etat_civil character varying(255)
);


ALTER TABLE public.utilisateur OWNER TO postgres;

CREATE SEQUENCE public.utilisateur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utilisateur_id_seq OWNER TO postgres;

ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;

ALTER TABLE ONLY public.categorie_ressource ALTER COLUMN id SET DEFAULT nextval('public.categorie_ressource_id_seq'::regclass);

ALTER TABLE ONLY public.commentaire ALTER COLUMN id SET DEFAULT nextval('public.commentaire_id_seq'::regclass);

ALTER TABLE ONLY public.ressource ALTER COLUMN id SET DEFAULT nextval('public.ressource_id_seq'::regclass);

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);

ALTER TABLE ONLY public.type_relation ALTER COLUMN id SET DEFAULT nextval('public.type_relation_id_seq'::regclass);

ALTER TABLE ONLY public.type_ressource ALTER COLUMN id SET DEFAULT nextval('public.type_ressource_id_seq'::regclass);

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);


INSERT INTO public.categorie_ressource VALUES (1, 'Communication');
INSERT INTO public.categorie_ressource VALUES (2, 'Cultures');
INSERT INTO public.categorie_ressource VALUES (3, 'Développement personnel');
INSERT INTO public.categorie_ressource VALUES (4, 'Intelligence émotionnelle');
INSERT INTO public.categorie_ressource VALUES (5, 'Loisirs');
INSERT INTO public.categorie_ressource VALUES (6, 'Monde professionnel');
INSERT INTO public.categorie_ressource VALUES (7, 'Parentalité');
INSERT INTO public.categorie_ressource VALUES (8, 'Qualité de vie');
INSERT INTO public.categorie_ressource VALUES (9, 'Recherche de sens');
INSERT INTO public.categorie_ressource VALUES (10, 'Santé physique');
INSERT INTO public.categorie_ressource VALUES (11, 'Santé psychique');
INSERT INTO public.categorie_ressource VALUES (12, 'Spiritualité');
INSERT INTO public.categorie_ressource VALUES (13, 'Vie affective');


INSERT INTO public.role VALUES (1, 'Super-Administrateur');
INSERT INTO public.role VALUES (2, 'Administrateur');
INSERT INTO public.role VALUES (3, 'Modérateur');
INSERT INTO public.role VALUES (4, 'Citoyen Connecté');

INSERT INTO public.type_relation VALUES (1, 'Soi');
INSERT INTO public.type_relation VALUES (2, 'Conjoints');
INSERT INTO public.type_relation VALUES (3, 'Famille : enfants / parents / fratrie');
INSERT INTO public.type_relation VALUES (4, 'Professionnelle : collègues, collaborateurs et managers');
INSERT INTO public.type_relation VALUES (5, 'Amis et communautés');
INSERT INTO public.type_relation VALUES (6, 'Inconnus');

INSERT INTO public.type_ressource VALUES (1, 'Activité / jeu à réaliser');
INSERT INTO public.type_ressource VALUES (2, 'Article');
INSERT INTO public.type_ressource VALUES (3, 'Carte défi');
INSERT INTO public.type_ressource VALUES (4, 'Cours au format PDF');
INSERT INTO public.type_ressource VALUES (5, 'Exercice / Atelier');
INSERT INTO public.type_ressource VALUES (6, 'Fiche de lecture');
INSERT INTO public.type_ressource VALUES (7, 'Jeu en ligne');
INSERT INTO public.type_ressource VALUES (8, 'Vidéo');


SELECT pg_catalog.setval('public.categorie_ressource_id_seq', 13, true);

SELECT pg_catalog.setval('public.commentaire_id_seq', 1, false);

SELECT pg_catalog.setval('public.ressource_id_seq', 77, true);

SELECT pg_catalog.setval('public.role_id_seq', 4, true);

SELECT pg_catalog.setval('public.type_relation_id_seq', 6, true);

SELECT pg_catalog.setval('public.type_ressource_id_seq', 8, true);

SELECT pg_catalog.setval('public.utilisateur_id_seq', 6, true);

ALTER TABLE ONLY public.acceder
    ADD CONSTRAINT acceder_pkey PRIMARY KEY (utilisateur_id, ressource_id);

ALTER TABLE ONLY public.categorie_ressource
    ADD CONSTRAINT categorie_ressource_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.ressource_type_relation
    ADD CONSTRAINT cle PRIMARY KEY (ressource_id, type_relation_id);

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.favoris
    ADD CONSTRAINT favoris_pkey PRIMARY KEY (utilisateur_id, ressource_id);

ALTER TABLE ONLY public.participer
    ADD CONSTRAINT participer_pkey PRIMARY KEY (utilisateur_id, ressource_id);


ALTER TABLE ONLY public.ressource
    ADD CONSTRAINT ressource_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.type_relation
    ADD CONSTRAINT type_relation_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.type_ressource
    ADD CONSTRAINT type_ressource_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_email_key UNIQUE (email);



ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.acceder
    ADD CONSTRAINT acceder_ressource_id_fkey FOREIGN KEY (ressource_id) REFERENCES public.ressource(id);


ALTER TABLE ONLY public.acceder
    ADD CONSTRAINT acceder_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);


ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_ressource_id_fkey FOREIGN KEY (ressource_id) REFERENCES public.ressource(id);


ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);


ALTER TABLE ONLY public.favoris
    ADD CONSTRAINT favoris_ressource_id_fkey FOREIGN KEY (ressource_id) REFERENCES public.ressource(id);


ALTER TABLE ONLY public.favoris
    ADD CONSTRAINT favoris_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);


ALTER TABLE ONLY public.participer
    ADD CONSTRAINT participer_ressource_id_fkey FOREIGN KEY (ressource_id) REFERENCES public.ressource(id);


ALTER TABLE ONLY public.participer
    ADD CONSTRAINT participer_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);


ALTER TABLE ONLY public.ressource
    ADD CONSTRAINT ressource_categorie_ressource_id_fkey FOREIGN KEY (categorie_ressource_id) REFERENCES public.categorie_ressource(id);


ALTER TABLE ONLY public.ressource_type_relation
    ADD CONSTRAINT ressource_ressource_type_relation FOREIGN KEY (ressource_id) REFERENCES public.ressource(id);


COMMENT ON CONSTRAINT ressource_ressource_type_relation ON public.ressource_type_relation IS 'cle étrangère vers la table ressource';


ALTER TABLE ONLY public.ressource
    ADD CONSTRAINT ressource_type_ressource_id_fkey FOREIGN KEY (type_ressource_id) REFERENCES public.type_ressource(id);


ALTER TABLE ONLY public.ressource
    ADD CONSTRAINT ressource_utilisateur FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id) NOT VALID;


ALTER TABLE ONLY public.ressource_type_relation
    ADD CONSTRAINT type_relation_ressource_type_relation FOREIGN KEY (type_relation_id) REFERENCES public.type_relation(id);


COMMENT ON CONSTRAINT type_relation_ressource_type_relation ON public.ressource_type_relation IS 'cle étrnagère vers la table type relation';

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


