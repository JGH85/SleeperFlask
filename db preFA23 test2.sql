PGDMP         8                {           flask3    15.1    15.1 d    {           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            |           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            }           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ~           1262    16846    flask3    DATABASE     �   CREATE DATABASE flask3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE flask3;
                postgres    false            �            1259    16986    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    16957    cap_hold    TABLE     V  CREATE TABLE public.cap_hold (
    id integer NOT NULL,
    team_id integer,
    player_id integer,
    season integer,
    caphold numeric,
    reason character varying(20),
    note character varying(200),
    effective_date timestamp without time zone,
    date_updated timestamp without time zone,
    associated_transaction_id bigint
);
    DROP TABLE public.cap_hold;
       public         heap    postgres    false            �            1259    16956    cap_hold_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cap_hold_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.cap_hold_id_seq;
       public          postgres    false    232                       0    0    cap_hold_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cap_hold_id_seq OWNED BY public.cap_hold.id;
          public          postgres    false    231            �            1259    16891    comments    TABLE        CREATE TABLE public.comments (
    id integer NOT NULL,
    name character varying(20),
    comment character varying(1000)
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    16890    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false    223            �           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          postgres    false    222            �            1259    16877    data_update_log    TABLE     �   CREATE TABLE public.data_update_log (
    id integer NOT NULL,
    "lastPlayerUpdateDate" date,
    "lastNFLStateUpdateDate" date,
    "lastOwnerUpdateDate" date,
    "lastRosterUpdateDate" date,
    "lastTransactionUpdateDate" date
);
 #   DROP TABLE public.data_update_log;
       public         heap    postgres    false            �            1259    16876    data_update_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_update_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.data_update_log_id_seq;
       public          postgres    false    219            �           0    0    data_update_log_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.data_update_log_id_seq OWNED BY public.data_update_log.id;
          public          postgres    false    218            �            1259    17012 	   error_log    TABLE     <  CREATE TABLE public.error_log (
    id integer NOT NULL,
    transaction_id bigint,
    roster_player_id integer,
    player_id integer,
    cap_hold_id integer,
    error_description character varying(20),
    error_notes character varying(200),
    error_date timestamp without time zone,
    roster_id integer
);
    DROP TABLE public.error_log;
       public         heap    postgres    false            �            1259    17011    error_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.error_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.error_log_id_seq;
       public          postgres    false    237            �           0    0    error_log_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.error_log_id_seq OWNED BY public.error_log.id;
          public          postgres    false    236            �            1259    16913    owners    TABLE     �   CREATE TABLE public.owners (
    id character varying(20) NOT NULL,
    display_name character varying(50),
    teamname character varying(50),
    date_updated timestamp without time zone,
    avatar character varying,
    user_id integer
);
    DROP TABLE public.owners;
       public         heap    postgres    false            �            1259    16861    player    TABLE     �  CREATE TABLE public.player (
    id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    last_name character varying(20),
    first_name character varying(20),
    search_full_name character varying(50),
    search_last_name character varying(20),
    search_first_name character varying(20),
    "position" character varying(20),
    status character varying(50),
    team character varying(20)
);
    DROP TABLE public.player;
       public         heap    postgres    false            �            1259    16860    player_id_seq    SEQUENCE     �   CREATE SEQUENCE public.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.player_id_seq;
       public          postgres    false    217            �           0    0    player_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;
          public          postgres    false    216            �            1259    16900    posts    TABLE     �   CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying(255),
    content text,
    date_posted timestamp without time zone,
    slug character varying(255),
    poster_id integer
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16899    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false    225            �           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          postgres    false    224            �            1259    16938    roster_player    TABLE     �  CREATE TABLE public.roster_player (
    id integer NOT NULL,
    player_id integer,
    team_id integer,
    season integer,
    salary numeric,
    unadjusted_salary numeric,
    date_added timestamp without time zone,
    date_removed timestamp without time zone,
    date_updated timestamp without time zone,
    is_franchised boolean,
    is_ir boolean,
    open_transaction_id bigint,
    close_transaction_id bigint,
    note character varying(200)
);
 !   DROP TABLE public.roster_player;
       public         heap    postgres    false            �            1259    16937    roster_player_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roster_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.roster_player_id_seq;
       public          postgres    false    230            �           0    0    roster_player_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.roster_player_id_seq OWNED BY public.roster_player.id;
          public          postgres    false    229            �            1259    16926    team    TABLE     Z   CREATE TABLE public.team (
    id integer NOT NULL,
    owner_id character varying(20)
);
    DROP TABLE public.team;
       public         heap    postgres    false            �            1259    16925    team_id_seq    SEQUENCE     �   CREATE SEQUENCE public.team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.team_id_seq;
       public          postgres    false    228            �           0    0    team_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;
          public          postgres    false    227            �            1259    16884    trade_transaction    TABLE     �   CREATE TABLE public.trade_transaction (
    id integer NOT NULL,
    transaction_id bigint,
    roster_id integer,
    dropped_player_id integer,
    added_player_id integer,
    transaction_date timestamp without time zone
);
 %   DROP TABLE public.trade_transaction;
       public         heap    postgres    false            �            1259    16883    trade_transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trade_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.trade_transaction_id_seq;
       public          postgres    false    221            �           0    0    trade_transaction_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.trade_transaction_id_seq OWNED BY public.trade_transaction.id;
          public          postgres    false    220            �            1259    16977    transactions    TABLE       CREATE TABLE public.transactions (
    id bigint NOT NULL,
    transaction_type character varying(20),
    roster_id integer,
    dropped_player_id integer,
    added_player_id integer,
    added_salary numeric,
    transaction_date timestamp without time zone
);
     DROP TABLE public.transactions;
       public         heap    postgres    false            �            1259    16976    transactions_id_seq    SEQUENCE     |   CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.transactions_id_seq;
       public          postgres    false    234            �           0    0    transactions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;
          public          postgres    false    233            �            1259    16848    users    TABLE     2  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(120) NOT NULL,
    date_added timestamp without time zone,
    profile_pic character varying,
    password_hash character varying(128)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16847    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            �           2604    16960    cap_hold id    DEFAULT     j   ALTER TABLE ONLY public.cap_hold ALTER COLUMN id SET DEFAULT nextval('public.cap_hold_id_seq'::regclass);
 :   ALTER TABLE public.cap_hold ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    16894    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16880    data_update_log id    DEFAULT     x   ALTER TABLE ONLY public.data_update_log ALTER COLUMN id SET DEFAULT nextval('public.data_update_log_id_seq'::regclass);
 A   ALTER TABLE public.data_update_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    17015    error_log id    DEFAULT     l   ALTER TABLE ONLY public.error_log ALTER COLUMN id SET DEFAULT nextval('public.error_log_id_seq'::regclass);
 ;   ALTER TABLE public.error_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    16864 	   player id    DEFAULT     f   ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);
 8   ALTER TABLE public.player ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16903    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    16941    roster_player id    DEFAULT     t   ALTER TABLE ONLY public.roster_player ALTER COLUMN id SET DEFAULT nextval('public.roster_player_id_seq'::regclass);
 ?   ALTER TABLE public.roster_player ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    16929    team id    DEFAULT     b   ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);
 6   ALTER TABLE public.team ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    16887    trade_transaction id    DEFAULT     |   ALTER TABLE ONLY public.trade_transaction ALTER COLUMN id SET DEFAULT nextval('public.trade_transaction_id_seq'::regclass);
 C   ALTER TABLE public.trade_transaction ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    16980    transactions id    DEFAULT     r   ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);
 >   ALTER TABLE public.transactions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    16851    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            v          0    16986    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    235   �x       s          0    16957    cap_hold 
   TABLE DATA           �   COPY public.cap_hold (id, team_id, player_id, season, caphold, reason, note, effective_date, date_updated, associated_transaction_id) FROM stdin;
    public          postgres    false    232   &y       j          0    16891    comments 
   TABLE DATA           5   COPY public.comments (id, name, comment) FROM stdin;
    public          postgres    false    223   �       f          0    16877    data_update_log 
   TABLE DATA           �   COPY public.data_update_log (id, "lastPlayerUpdateDate", "lastNFLStateUpdateDate", "lastOwnerUpdateDate", "lastRosterUpdateDate", "lastTransactionUpdateDate") FROM stdin;
    public          postgres    false    219   
�       x          0    17012 	   error_log 
   TABLE DATA           �   COPY public.error_log (id, transaction_id, roster_player_id, player_id, cap_hold_id, error_description, error_notes, error_date, roster_id) FROM stdin;
    public          postgres    false    237   '�       m          0    16913    owners 
   TABLE DATA           [   COPY public.owners (id, display_name, teamname, date_updated, avatar, user_id) FROM stdin;
    public          postgres    false    226   D�       d          0    16861    player 
   TABLE DATA           �   COPY public.player (id, full_name, last_name, first_name, search_full_name, search_last_name, search_first_name, "position", status, team) FROM stdin;
    public          postgres    false    217   �       l          0    16900    posts 
   TABLE DATA           Q   COPY public.posts (id, title, content, date_posted, slug, poster_id) FROM stdin;
    public          postgres    false    225   sN      q          0    16938    roster_player 
   TABLE DATA           �   COPY public.roster_player (id, player_id, team_id, season, salary, unadjusted_salary, date_added, date_removed, date_updated, is_franchised, is_ir, open_transaction_id, close_transaction_id, note) FROM stdin;
    public          postgres    false    230   �N      o          0    16926    team 
   TABLE DATA           ,   COPY public.team (id, owner_id) FROM stdin;
    public          postgres    false    228   1�      h          0    16884    trade_transaction 
   TABLE DATA           �   COPY public.trade_transaction (id, transaction_id, roster_id, dropped_player_id, added_player_id, transaction_date) FROM stdin;
    public          postgres    false    221   Ս      u          0    16977    transactions 
   TABLE DATA           �   COPY public.transactions (id, transaction_type, roster_id, dropped_player_id, added_player_id, added_salary, transaction_date) FROM stdin;
    public          postgres    false    234   ��      b          0    16848    users 
   TABLE DATA           b   COPY public.users (id, username, name, email, date_added, profile_pic, password_hash) FROM stdin;
    public          postgres    false    215   ��      �           0    0    cap_hold_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cap_hold_id_seq', 1600, true);
          public          postgres    false    231            �           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 1, false);
          public          postgres    false    222            �           0    0    data_update_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.data_update_log_id_seq', 1, false);
          public          postgres    false    218            �           0    0    error_log_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.error_log_id_seq', 1, false);
          public          postgres    false    236            �           0    0    player_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.player_id_seq', 1, false);
          public          postgres    false    216            �           0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 1, false);
          public          postgres    false    224            �           0    0    roster_player_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.roster_player_id_seq', 6804, true);
          public          postgres    false    229            �           0    0    team_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.team_id_seq', 1, false);
          public          postgres    false    227            �           0    0    trade_transaction_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.trade_transaction_id_seq', 514, true);
          public          postgres    false    220            �           0    0    transactions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.transactions_id_seq', 1, false);
          public          postgres    false    233            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    214            �           2606    16990 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    235            �           2606    16964    cap_hold pk_cap_hold 
   CONSTRAINT     R   ALTER TABLE ONLY public.cap_hold
    ADD CONSTRAINT pk_cap_hold PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cap_hold DROP CONSTRAINT pk_cap_hold;
       public            postgres    false    232            �           2606    16898    comments pk_comments 
   CONSTRAINT     R   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT pk_comments PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comments DROP CONSTRAINT pk_comments;
       public            postgres    false    223            �           2606    16882 "   data_update_log pk_data_update_log 
   CONSTRAINT     `   ALTER TABLE ONLY public.data_update_log
    ADD CONSTRAINT pk_data_update_log PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.data_update_log DROP CONSTRAINT pk_data_update_log;
       public            postgres    false    219            �           2606    17017    error_log pk_error_log 
   CONSTRAINT     T   ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT pk_error_log PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.error_log DROP CONSTRAINT pk_error_log;
       public            postgres    false    237            �           2606    16919    owners pk_owners 
   CONSTRAINT     N   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT pk_owners PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.owners DROP CONSTRAINT pk_owners;
       public            postgres    false    226            �           2606    16866    player pk_player 
   CONSTRAINT     N   ALTER TABLE ONLY public.player
    ADD CONSTRAINT pk_player PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.player DROP CONSTRAINT pk_player;
       public            postgres    false    217            �           2606    16907    posts pk_posts 
   CONSTRAINT     L   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT pk_posts PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.posts DROP CONSTRAINT pk_posts;
       public            postgres    false    225            �           2606    16945    roster_player pk_roster_player 
   CONSTRAINT     \   ALTER TABLE ONLY public.roster_player
    ADD CONSTRAINT pk_roster_player PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.roster_player DROP CONSTRAINT pk_roster_player;
       public            postgres    false    230            �           2606    16931    team pk_team 
   CONSTRAINT     J   ALTER TABLE ONLY public.team
    ADD CONSTRAINT pk_team PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.team DROP CONSTRAINT pk_team;
       public            postgres    false    228            �           2606    16889 &   trade_transaction pk_trade_transaction 
   CONSTRAINT     d   ALTER TABLE ONLY public.trade_transaction
    ADD CONSTRAINT pk_trade_transaction PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.trade_transaction DROP CONSTRAINT pk_trade_transaction;
       public            postgres    false    221            �           2606    16984    transactions pk_transactions 
   CONSTRAINT     Z   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT pk_transactions PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.transactions DROP CONSTRAINT pk_transactions;
       public            postgres    false    234            �           2606    16855    users pk_users 
   CONSTRAINT     L   ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT pk_users;
       public            postgres    false    215            �           2606    16859    users uq_users_email 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uq_users_email UNIQUE (email);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT uq_users_email;
       public            postgres    false    215            �           2606    16857    users uq_users_username 
   CONSTRAINT     V   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uq_users_username UNIQUE (username);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT uq_users_username;
       public            postgres    false    215            �           2606    17006 ;   cap_hold fk_cap_hold_associated_transaction_id_transactions    FK CONSTRAINT     �   ALTER TABLE ONLY public.cap_hold
    ADD CONSTRAINT fk_cap_hold_associated_transaction_id_transactions FOREIGN KEY (associated_transaction_id) REFERENCES public.transactions(id);
 e   ALTER TABLE ONLY public.cap_hold DROP CONSTRAINT fk_cap_hold_associated_transaction_id_transactions;
       public          postgres    false    3267    234    232            �           2606    16970 %   cap_hold fk_cap_hold_player_id_player    FK CONSTRAINT     �   ALTER TABLE ONLY public.cap_hold
    ADD CONSTRAINT fk_cap_hold_player_id_player FOREIGN KEY (player_id) REFERENCES public.player(id);
 O   ALTER TABLE ONLY public.cap_hold DROP CONSTRAINT fk_cap_hold_player_id_player;
       public          postgres    false    3249    232    217            �           2606    16965 !   cap_hold fk_cap_hold_team_id_team    FK CONSTRAINT        ALTER TABLE ONLY public.cap_hold
    ADD CONSTRAINT fk_cap_hold_team_id_team FOREIGN KEY (team_id) REFERENCES public.team(id);
 K   ALTER TABLE ONLY public.cap_hold DROP CONSTRAINT fk_cap_hold_team_id_team;
       public          postgres    false    232    228    3261            �           2606    16920    owners fk_owners_user_id_users    FK CONSTRAINT     }   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT fk_owners_user_id_users FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.owners DROP CONSTRAINT fk_owners_user_id_users;
       public          postgres    false    226    3243    215            �           2606    16908    posts fk_posts_poster_id_users    FK CONSTRAINT        ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_posts_poster_id_users FOREIGN KEY (poster_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.posts DROP CONSTRAINT fk_posts_poster_id_users;
       public          postgres    false    225    3243    215            �           2606    16996 @   roster_player fk_roster_player_close_transaction_id_transactions    FK CONSTRAINT     �   ALTER TABLE ONLY public.roster_player
    ADD CONSTRAINT fk_roster_player_close_transaction_id_transactions FOREIGN KEY (close_transaction_id) REFERENCES public.transactions(id);
 j   ALTER TABLE ONLY public.roster_player DROP CONSTRAINT fk_roster_player_close_transaction_id_transactions;
       public          postgres    false    230    234    3267            �           2606    17001 ?   roster_player fk_roster_player_open_transaction_id_transactions    FK CONSTRAINT     �   ALTER TABLE ONLY public.roster_player
    ADD CONSTRAINT fk_roster_player_open_transaction_id_transactions FOREIGN KEY (open_transaction_id) REFERENCES public.transactions(id);
 i   ALTER TABLE ONLY public.roster_player DROP CONSTRAINT fk_roster_player_open_transaction_id_transactions;
       public          postgres    false    230    3267    234            �           2606    16946 /   roster_player fk_roster_player_player_id_player    FK CONSTRAINT     �   ALTER TABLE ONLY public.roster_player
    ADD CONSTRAINT fk_roster_player_player_id_player FOREIGN KEY (player_id) REFERENCES public.player(id);
 Y   ALTER TABLE ONLY public.roster_player DROP CONSTRAINT fk_roster_player_player_id_player;
       public          postgres    false    230    3249    217            �           2606    16951 +   roster_player fk_roster_player_team_id_team    FK CONSTRAINT     �   ALTER TABLE ONLY public.roster_player
    ADD CONSTRAINT fk_roster_player_team_id_team FOREIGN KEY (team_id) REFERENCES public.team(id);
 U   ALTER TABLE ONLY public.roster_player DROP CONSTRAINT fk_roster_player_team_id_team;
       public          postgres    false    3261    230    228            �           2606    16932    team fk_team_owner_id_owners    FK CONSTRAINT     }   ALTER TABLE ONLY public.team
    ADD CONSTRAINT fk_team_owner_id_owners FOREIGN KEY (owner_id) REFERENCES public.owners(id);
 F   ALTER TABLE ONLY public.team DROP CONSTRAINT fk_team_owner_id_owners;
       public          postgres    false    3259    226    228            �           2606    16991 B   trade_transaction fk_trade_transaction_transaction_id_transactions    FK CONSTRAINT     �   ALTER TABLE ONLY public.trade_transaction
    ADD CONSTRAINT fk_trade_transaction_transaction_id_transactions FOREIGN KEY (transaction_id) REFERENCES public.transactions(id);
 l   ALTER TABLE ONLY public.trade_transaction DROP CONSTRAINT fk_trade_transaction_transaction_id_transactions;
       public          postgres    false    3267    221    234            v      x�K36176J4J�4K����� *t�      s      x��\ێdGn|.}E��$�d&����/�y-˂i!0���`V�eu��B�b��ii:���D�̒��"���6Ջ~�����?~���������ן~���?��g~�ǿ��������/?�����������/��?�����K~�oҾ�xi�5�k���7k/��M���b^b�ncuY6"d���t�˸�X��v؟����j�[�/�^�_�>��"�{��4�-�.u|�n n,�����^�xm�k~�gw���ٖ����A��������_����<�t���a#�h��m���Q���s͵"<4on�T�W��p���pc�>Ft����]삯>M犑h:��ކ̑hp��w>�,G(ysp��`H7Y�ӄq�[_�3�7�5E��!'yQ���4Q������OD��/�_��ײ[����gp�+֜�:�]F��wg��C�9��ׁÄ��v�q�_��������/!��a�xޚg9��ֽ�Oh0�_um�)�`�e��7���v�4..���L�ϸZ�8�.k��u����/p��f�6DX�1��ô�p���S�S�]z��:j��Wg��)�S,��bG�:����PUu�Q��f�)	��*n��ꪇ����P��0T���
��u|M+f�q�` �p�\M�4��fa���4�k�-��$�P9���H <Ɂ셼�D����I:..�h�u��0��`Z���[b-�$�OP���z�8/;�9��u�MfjT��#�4��V�s%���j�	����=������=�6��%CctT8�G�N0d.��5�T��9S�:�C�Є����5n��aԅ!X���XS�&�mЯ1�$��E�������Ϗ�z�t�r�/Cp�$͙�q���y`C2M�y�j>gi���r��7;�ǆkĤ�E����\���-M>p�
R�"�����L�$�d� �����[2�G_gi�A���!�c�#�����֞��I�i�a�3C\uLf�>�8}�����5��a�,S�Sx��>��C�镨��z%Dj�۽9��w���d!6����5 (v�� �L�bl6KF	/q���Q�;w=b��?��[ )��uA| �)r
m�O�8Qn�΁�o����hL� Z���D����FMG��!u�M��$�����'Q�#Cd��Q�/�OW�*ܘ�ɶn���
�:�:�z+T�*�z�}sP:dB�p���� X�y`��5,��|¡@�,uNn^���{܁��t�J��>NfR)�U8�mb�r��� �h�QV�`L�Nq�0�)��_PRa]70�yF�DnP��dDS�v��|2���*`����u3ᗂ�}my!�YN�����s*q óvS"m�%Z̕�r�o�������8�8ϔH��'A�7;�8٬��k7��u<����n��5��L��{\)H^�,K`.�Š�h��O����g�%a�pT� @Iv��Bu�4�������� ��FSw���[=�+��p�i��F�����K`�rɲ������#'!��l�L�|��������߈�<��e-�)	�����Ƀ�L$ �OD�d�DS�F7ɉ3O�=%[
o��u0�������� ^���Dߙ�}V"o�-�H࠺)�c0�PЌW9��G�c�_� N(AT�BY��Id��x�V��
؂�NƢ�KD��`c���X��e�6�85�)����l�J:tr�f�%-��h�M�t� ���%%+7�;��$3�G�XW���3���Ȍ` �s��W2D+}�*?�6G���v��-��\9_�V���p�4�@� ���4�M���^�`��Sm���|5�Z�g'(���m ��$+	��],>��z�����~��ҝ7ǊT��gTכ�{���5����8�Gd�\�tM'�$5O8�K$jl�fj���鎝�o8.��6eI�9d��G���-���z�'KP+�42�)<�.����w*��'U_D^u�ʀ�?�IY� ��@�p�R�G���o�큏�x�:\����m���`]P�P�=Ew�]��.�����PM�EV(
� �n�8o.q��D*N�d�i�13�>�%{�R�Ψ������:�L� ���]�;��zm�-%++�S.b8G8�Q6�3	�{%���>��Ε%g��y� x�i� i<��z@ZdO�g�.�N�mu�D*��*�'p�A����ͻH�Z��|z�j5F}M����Xd���
�o	�߷]�mŽ����6�k۹7N�:D���F���E.�<7YH����+W;�zs
�#
�W�$ue �P�zk@ѭ�!�h�%v�C�_ݸxA8���?��|k7��`��<�8�%^��
��m�����JxŸ"��e	uj��t<��ALݽ�"\����rd
c�)�W�3ڼmE0��Tʪ��y�6�6��@ˋ`\>�	=N���s������z�A��>Hl,�Ym�@�K�L��`kxl���8�]N�ϒ���_!,7�$k�v��;�q�*xv��v,?�\��l�'��xj�����k�]V"�o��hg�p�2<D�����N2t�p��q1�A���q�r�Y+�b���h�A82�Ky�(�ٛl�F(�B0�;���H�V�� 3��uʍgt��IY���<���ک-�	ez����G�Gp:�E88�@j�T��K�(<>Y��%�ti�=�I��]�u4��]<�5&K�17g\Rv�<�4C-c�BV�l���9}v��l#��u�<����L6(��r�����*�։�L�ʑ:o��ic�\�4(�AgD�&�PJ Y,r�؟#�.���<�Ԣ��=�5�Y�� ai���2�}�cAa7jE��� �̆T�̲
����������'I4��D>a�<}D�:���������f�4dr
I�#Y����U_���KB!�!5�v�Մ��(�p\�q?�����
� 7�k��MWN/��5�"�*�M���F�O��7 �i�]܂�p����n�h�0��qy1M�E�(���-P��W�/)9��ٔ�c�3�%-Y�����[Ͷ�}]�-앿W���aʞ��G����ˇ�,��r��@6֜��,��v�ll�	?�1���Z�\5J0m$��
T��m��7�_�s�&;2p%���1�_�OGe��
��9��IhH,���=���L{�Jp�tʠ��ZfW�m����^�)
�]	78��vn�v2�p�Q������Yd�7�d�
���O��5fp�ef��ت����k�`v��j®��[���M-�����S9�/��F[l����O�^c�u�h�L���I4�qζ=�DF���sn��$��ݠ�y�=��[��y�8O�9+{]���Cp)[[���
	mͼ�Ar�1�_�X`���_�jWgi��\Á�p�n��CmYM�����9K	��7����o���=�+���~ĆJx"&��0���7�E+ջX��p���|���2���#�� o��ؤQa�A��Ì̛V2����B�[[��ƭ��^ciS�Up�|� 6�[v~=wR!�����O��ois|gI�����3t6P�±w�y��W�[�%�#� �����es�ܮ|~˚�u^b�Mn4�J���Ҳ�|��׃���q�(i�9������fp�}ATHѸy�9v8�c����eK ��1K�s��3�WW�svH	�C4
H����>XУ�I �p�w��2�9bm�‴�Ҙ�Ɯ��I�}nd��r4?� nAm�E�ⱁ�!��Ϳ3P�~��� "��,�s������'^Z*��YK��#{��.0�	7ڞ�^V񔏸�xֺG�w��ۻ�N��(�A!����cl�L��@y��j�SS��%e����Δ�>��g��L�T��Cߜ�ݑ(�F)�e�l�|��a���I����p9�0���̔T,;^��ߒ���ᆂ+ �  �:�/�|��`\���+?�<�n�U?]:��`ff?ę}{�̻�)$�$��pk �No|�
�,�[Gj��k��'�g�e�i�6t��䓁4o��UT^�Wᔳ}���Am�D�=t��N�.��:�$��	q�u�	3���{�2����t�C�p �k��KSD3y����QJa���[��	���S��u�Q���+E�|���SX�H]7�X|˫�C�\N&�WDd�w��!�����֞��C<�(���6�v��8�֍�<�Ze��1��vF� �NT�X�)pF$���@j�4�ң�*��ۄ����|���>R�O��>��M�����Z熒2������W�<3���[i�\
��xlI�����3ס�'s�y[cE��D-k`C�O�X��Ԝ�(?�#?q��ӆ�s?ǹ����^x'��đ���*�c�+���"+�@���Ԗ}�����+�E<�T�%\��A-zϧ,�:��|�I�q�k!|��`�R١}�?|�RJpS���C����@Z���7l��S��}�k����3�ߏ���q{�v���n(�*wۊ�]�[Цr����p��H{d|<�ZL�o�n%�;�'P�\��>�Q|;�S��2V�͢v��ެ��B`P�ّB�HF�B^��*W�[��U�	���!}�t%x��1/�J����	�5����Z{���g�:��F�9X�ɋ�
O��E!F��	�#?�q%8o|#���Ґ8�(k8?L��|�5��P����#-Wp�˸��62~�LJp�UT���zg����i���mh<�Ĕʆ3~��h(��ug�O��{#5���|B�cݍ��iχORy@��q�]����E�p��}�W��2�.���{	9�"M6������>�*�ۺ$?��L~ �E�*���!��'�#�! >���
BK7��:���v����d�      j      x������ � �      f      x������ � �      x      x������ � �      m   �  x��TAn�8<ӯ�<n������M6���!�K.Ee�3��#~}���:��T���ja�b ��$�ܧ]�󵤾�K�]����s�s���e��c6˲���}�r3���_<�wcj��ǔ�Xh�%�h�����.«��ͷ�gQ�
x
l ��4>������/��v|��J��#t���:K��m*�"��K�m%c�ʨ����"G��;0S�}���񰔉�܍C���@ƞ{��A�W���(j�'K���x���cgn�����=��)�xJ ��lf�EljQ+�&�D>36I��*��������z���\�y�Շ�����s���+p$k	�ø�y��4��TWS�,�p�,�S���%�2¶��[_��O�G�sJ@]E�䁝��O]��e2_��5*��_ʏnw��|��&P�L1:�O�+��yH�6!o��������� ���.i�l~��)-yÇs��Euң�SFa5[��&�%�VKP��n]���F�WRQ��fX2�}?�u�b�S7U�S.����>��&g�:�n�o��~��|��{y#���L��b��k
C��T ��+��$d��ɛ�2m�q����y�����Ю�A�� ���0J 0�[���b�p��^ �����~�j      d      x�t�Yw��5|����U��D���У�N���~O�wCI�D�"RjG��_���:k%���n��(jH����fU���ou��F�Pf��ʔHa̟��ju,~���?X$Ss����c]b�*�W�S ��������pan�_uu���u]���(Xڬ��^������t4Mͷl��u5�Y�e��[�:b^�,�:`~>�����a�̆���م�d� ���t����\7�U>�T7��n�'��YB������A��G��L�s�4}�Cִ۬,�k�9
�-�:�}�����|b��㶮΃�m���XT�d������Z���|=x�ۼѻ?�ͷ���rp���)�yeȘ)�y�����b61?�cS�v���\֍QP���*(�ݛ����~�cQ���c�&0 �F��]���F4�A�W��� 
����ʺ��&���fE��}Z��/R(S0�3%R�{���a>%�������2���5��ǟ��r��tx��dH���V�O���^i��A�7����j�m�?����C:�W�s��٠�+#�ِXrW$����N����q�������:BO;cky���P�+��󟌆c�O���ʞh�)�jCGhrd|��k��V}�J�@:3���ο
~RV;<&�m֮��C";6|��pf��<�V�%@���Q�
`��i������k�
_��)�&�����v#^S�gf4���ۼ|���~kw��:J��qӍxM�[�"��bJ��W�|*O4MПp��F�|��k0�Ѹ�oٹ��"�FAH�f�
� ����t16w9= ��_0�v-1;�7Gv-o�t4��&_烟y{\6�����Z�������Ò�db��%�웺ڕ��Zd�!WJYdһ�����C:�d�\�UɌ��"���z!�tL߅��߿���;�q1G�_�w�f�۫{R0&Xl�
��]vz9����<M'�;�-*��PZ!��t5"+?���44ct-���Gv-_�1��{z��<�n�&+��k�)!_:�k�Pﱛ�&p�5�<��'[� ������ϫ��!���Y���!y(�S�E�i*f�+mQiO�Í��쟾�O����i�=��,�.��y=��Z��ƽ���Ô&As���PГtW4;��qfe[;�,�}ط���a�����3�o�o���_hQ,���}�Sf���VG�.�щ2��GÔV���,v��SU�D�%u�k��R$W�5y(T��S�#s����u]�3^�6MI��H���h"��J:���C/�>� Lv<pGdv'��)�z��U�F�&�!i���)��$Rv�����^w�_�4 �D��<���\�����yˮ�#&��Wʹӽ�<[��1�'�	o�E��[�JX��M�����m�?����c�,d"�1�GI u���=B�\�	�]`^���pRU���� �����,�m�ušE�L�����]�D���9ͣ;���a�.M�;�R�z��72�/{�ۍ%$���ٸ�2�j�q;iE�tz�+RneUkD:��m�< ґ�B�K��h�����?���a�X�CckG\Î��G��c���M������r������:NS?����:���Ɉ�FM�<MUi�Q�\(�,}7�\X%��ZLR�eZ\��a_�i��Z2d�;Gw-���+�K����<��w�����۟ߔ�Ȥ�H]��@/�?�U��s�������[U2-�r�c߻�.`��H�e��ouM�޵x��o�[Gv-���p:7��`�'>����kȀY3�-���
�|4I�'��낖�7�cD*g^[&E*OH�����t_Wkzu����d��E&���4�2������#u�N#�v3�m��Ep�O���\1�}n�g���|�A�Ev��I��h�m����Xd�Ύ�BYd2ܨ.��|���f{Z.�H�"���*�Q����`��=hEuJ4'˙_��(��d)��|�~K���6'��8���o��"H�#�T�"�p�/��a2�6�� h���wE�m���Dm7�A����$V�s�I�A:��J�Q���/��D�5"�*�a���F��>�I#�m��I�l�v���hu���o8�M�CA7L��X�]CG��d|��k�@�bNF��Y{S^ߍ���ĔH�1uwz�hA�"��|�PW���_�k0�+N���k0�+���|�_^��:�Ǌ%�Jb�]����)m?_3�xy��.��>I��(0>X��tB�tU�a��%@�Y��I�)e����&}&1wg����='�5;��jÔE&���;�i:ǔGkaK�x��WP��VA��&��v����b�.w���g�<�ς�ъ��d����K�Bd���`��%J��Hw.ϧ�b���c9
� ;��՘����o4�>�o2��a�iJZDY�.���X��R"Hٵx��@�r�&sRzhOSeIgc,�4kK%,�����1��K,M��|�  ��ބS.4�NǣS,- �ɛ9̳�14w3� ��2}���!�h����>������k���H}��ߥ��D�lĻ&�����yQ@H�`�NA���c:����|�-i��7t�-�4�׃v-_���0��@{��ٰ�J�Yp7�!�8��KMj�@��X$��ѮE�"��d>�����C������@�Ip8Ka�+�|��{��m�������)ߧ!)
���&㽤Efi�#�Q�"���c6�� G�$�V��*(k��k_m�d���F�X�V�b�=�GZ˺���/(���V���y���Q�Ļ�-��g��ܟ^O,��2�5eДo�5e,�Ѧ���Ճ;ZqI=Y�]�����9��4i�F�l�>+�!����I��s1� �,g���6���E]02�/��h����N���|;�Ev��+ÅCZ��dF/�c���v��lhg�R(z� k�D
/��x�_�]��s��|F���]�OH���-}��~�6@�W˸��M��+z��z:2��v-��|�=:�k�@oW7IFl<�MS�ݱxg-�{%,�u�[� 5{��B-��`�	z"bJз�_y������7�z�����x>K�a�K^���]a��:+�t�,N�~�WGZ�"ݻV����#�&c���k�u�`21�&��WҢ���1y_�>l���vV��j�N�M�-c�q?����}ܛ�
��|�\ hˊMFIkCt4.$m* ��p�W�M}>c��}��f��~�,Mː4^�W�l�%�'��&�fSԃ��=b�0�!4�V�u��x:����M]��	�f^�S�{�p���39'��'�lD���wE�yx�է����#m=n�	����q�ZQW$��V~�����,&4I70	(�
`+�����s�H��,�Փ7�p�����p���UP���0�M�"���Gz۱NX���V��E=�
�}ӄt󛺦9y�x�i��ta ��.�	GC\���-��*+�Ƣ�4� vJZ6�e�1���s3�\,��)���S"��4��<����Q�p�(!��Ѐa!}����v�ʚ�0���o����$��(�i���s���X�����7^������k]��Yu���<����j�>�z���>�;����,|9-�l.Wd�f�V)�L�o=��!��&�[>���$�L�d"���}�Îs_4�~�%{mNeI���<fJ�m�zM
�ҌG�2��|@
'�!�Sk����Z��t-�-� �����h�,`R̍k<����e]C7��(��0���O���g�k��.�L�h����׫�h61�gR�����!���`Mb�/l���U�������YPGV��~�$�W�'�[�ک�$�3u���Epޓ���tD�(u�lp[�U)�t�l͔Ha���5���g�O��7���a��E>;��y2�y<�I���׸���P�v]K�"O���\a_���s�� A��u��٫����C�x����Z[#���~�l1]L�zt��X�E	��@qW$���05w[6}��h�6;�������F���cs|7    ,ܞ0G������ /G���,u�n���ٝn�s&z�،r��ơ�&To�P���@2�7�i�U9��`�4
̙�M��0�kx���P7UF�����?��k�q(p�8� i�]ˎE?}D)���������>��|٠ς���?���i34��d͑�&͊a%��o$��tH[�;�	75]eV1m�ٽ�l�5v����p:2�u��WA�iH}f��q4���Ŏ���4K�B��a��Ea#sL��MF�p�������u}:�ͼx�}"]�Բ:�Ϗ��r�!�d����oU�� pV�����J�"�N��~{����&��w+�SсV��j W��)��ɸ�$�ܯv¹��{6[g0��mN>ӻ}��sM�-fd��v�c��:ܳ��pܫh����m}0
B�s��U8��Î����3�=����=dY`K���dW�o5��G�UP����}0�>�J�f��&�,M��MP���i:Nd�u[dMK����r��������8}�^��=�H'��4ҏ��4Q5��t��੺Kabu�OUiG�.D��jǎ{;�UT�Q�1%R�8��l_���QW;x-�������|^��a��@�m���k��=ĲȬ) W����=��ף<� �Fg���dGu-�у�����d�n�ڬ^[�w����`�@��������j����Z˺���B�x8�?R^a��R���
��;���2���h����ǲ�W��SL����^�k���N`��+c�~�Y�k����"Y��7;�#"����<���L�Jj����Pgu|t�9�Y�6�ND}c��d������1mdA�7��R�oe�rө:�ܞ�-
��d-}v4	�t��IU�E�RӃ|E��~G�UҢ����=�@)T��=�츗kϟ��� ��p�;��i�2�>��uA����.G�v}��B���s�l`��lL7JZ�m�����jt�Y��hYt��Q��,^���O���j�	�)�ya�2%RoifO��$�J��\츢 
�?���D�"�t�`��<@d�.��=z,Ћ����F�~n8i��֡7&D^X�f�+���.�k�l��s�Z�l�3ڭ�g�>mO����nG�*a�w�FS������f[烻�o��欍]����������$��� �=�,�Rױ7�D
��޴�'p09fyMo9���Q[t��p
���xDHVr��v���H�hudL���lNFI2;��xy)�Qt֔�٦:r,fsz��3��%�gAқ\�JX<jx�7�L���"|�O�4�
ג`ÔHa�[����t�$b�n�b�gYJ_��!�w`w?ŉ���p�j\�s&��k�SqwI�$1_���n�L��&���51�N��8���`m������թu��\�u�an8��΍����Wu�#b	��5�Y>�1_;�DjX����_�S���bw�٢�0�ה�ohb��a�3����ǌz�4oһ��{�^0C�7I��`"��0ꏠ�f���b�a?@E�Y=ʶ[%-
\&8�jដ�5�e�06�*(�� �q���>1�Ԝ_�M�EE����_l�5�� �1;3�J���1q��}���aJ�0��}Js�-]���)�����8�p�(;�I�rE��A|/����j��Ea���G�����	�H�����|N�(��i{1Wp{���p��;-pӠD�W�o٫v,����$����͇p����oc���H����ae:����,������YT;p��E�{�<�l���)�3NÞO��`��Y	��P"^���×h�D[eZ�X2Cz<ɖ	�LDQ�X"�Ѽ��C���p:��cҢ���"�[H~�k�R�Z�����]K�%݇>}��0-䈍f���*��9K����%S"{�6�\��N���.1�X
s��)��D[��p(�z�����ӑ�����=�ZQptdM�!�{�N+�6��Ok�mk��}i��Ad��6�_��bB}������Lq������o���2+K�+��l���T��H|�k�3������1ƪ:�w�=[V5��X�0�k��e�2�͒y(h��H�0�8,A�=���"я���H"��wv]�@���(R ��4w�pC߱����a%��=������ �6jR�,:�\	�� ���/�߇�<���V�<2�+K3oM�J>	7�����1��J3�o�)t�ܬW��|j���W�n[��bS�<���d�*N�A5��hi歉lP,��ț٢X*2����Uoh�+���_���>�2�)�Y�v���,H�"L>N��W�h��!(��r2���85�k�c]���"�ߠ*�ڝ����$=o���5y�IL��5y(��HM����^�$.h�8�p6�4�H�({ +�T�h���.1woP��4Ax�]C̎���k�w��Cn�1���{���,|�a��Xz��b|��EI��X�"�VI���"47?g�.;�昽�/�1{�����<q�O�>�Bѿ��	�>�D
��4�x���Yh�=MȤ�����f�1��k�@|��K5���?ҢB_�I��;��\ֱ?h��R��b���Srh|���]	�������Uڢ]�nA/�#�]��!lʘF�d%�����tW�h�����b6�f!��?C�M��9���q[�*�Q�;��jB6���|}���hjR��_�gJ���eJe���#���ۮ����^����~e樮ſן�iһ��s��:�qd�d��R��~�V��1��Q�gR���}� {������)��,6�{����j�V�nĬl��!�n r]�'��#}����~�6P����̅UP2�&�S�)����%;�s�m2X�SK��^��=��:���tO.�*{3�|AyI9ui��O]Za%���)�M�#=��xL�i�j)=�utC�آ^�2�n��tz�������:f��~�wl|�rjڣ��[���T5"�FV45�.�5�\���d+�S��`��.ԯA"�O���Z�wC�Ȯu��a<��B���)��}���f�yѾ)iQ��21�L5���i]Cmp��F�
ִq)��t4z�~r����u�?���Sǩ���%���}4ǜ�����Ǭ<ʰo0a��އ����F���k>Џ�?a�J0Z�t0rNΠ�mK��½����4�{��7���d��6d�^4�ʲ�q�O!�.-���\�Yu��˼YB��LGjI�nU��v4��aFcS	�V8�bo�ٔ�I;Ź���$m�6K���H������y22�)��U��(�t/!�PO[�-�w��o��5�I��aNٶ�9��(�i��E�������b";��-F��y����y���w�Rx�!������S.�ڰ[����<��F�ԟ����[j�5e���x�)c�=�''�47�[��X �#�Z	��+�ӧ�b>�?�fp[7G�:@�)t�����E���!��tm������ҮE�"E{��<L�u�8�E�fM����〗�x��R9���l_F�=�Ϲ���mq���ss�M`��֦�0m֒�p®���}��Y�#`����2a����1mɘO�9�L��NY>�G�� ����.7IŤ���A4��3jU�W`�V����9��u�~�1� sl�;o�Q`*zߧh�MV0F��(Ij  NA�ث6���yM{�k��C���7�8G� �[�}x�&�8Qʱ�&Fz��sZW�aM�A��	$��~�N9Z��B��|{��3���p(L��?�6do������G�[2�E�[g".@q��w�+���8�L�l����`1K��X�b22�')}�c��cG`�RQ�@���Tx����ȯ��G�
����s�(0�2p�~(V0Q�J�9��e[�O)0���|��)w����Bw���B�@%ӻ�!��K�
.��,}w�s����6�-��
��XP��JH��7o�p��76B�5v)}^e=��0'��N�?���U�����E;�{7g<A    ��&G���K����6��d��{˹��I4J���g�.Gg�)����"�]���8I(�� �8I��h;�ނc���=R��B#���UҢ��k�r�����6��הA�s���jy��V��h������^9��i�Ñ<�P�Vr�D
;�����j��W�e�>��
���'��"�����y�x���,Z)�)|���QT�e�5y�p��C�zM� _��l(Y_�f�qx��k���((U��1v8;�q�plc)67;ظ@�&�lE�~�?!j��{{_�c���?~��8��^m*��Dz�S3&DJ��0%g:�a���M�
̙5d)�SQP��f������4��Q ��g����W�xH��5�-�+��-���x�^�S.6N%��ia�v�(���+a1�y�1S[�M��lk��q%}kS�ο��D���'���N�{�H��"�b�X��cS��w��:[KOaŌ&��30x�Y�P��S�|S[Q����E`���	�l�y�K� ��|p�K_�}�ؼ�~��'�i�s���m
/�XE�Vڡ��3,?������B��a˔Ha�P��h8�����L���	���:r�#+52�x�`!V���O��K@�鍃�����Bin�UP2Rq������i�mrz�-2K7�d��E&�m�gT6U������<�EIԮ��}/M;!L��D�#��(0g֐a����l���R����E������k��>L����ֳ�^����"��=S"/y��;�T��%-��b��&k�m�5ڠ������L/YY�����{a����S==�NJ�UA�N��S��M���仼��-��(yR��v G˸�݅t��9)�Pirz|�Xmx���g˺���5��R��Ď���S� ��
�ׁ��	�6�3��egcQhdE%8(iQ��lB��\��9�Q`��!7�(0\w�fǓ{�=��qS�s���&������<��������O;T��i�5"_�%S"՗*\��^�U���ׇ�#� ���ʸ�H}�ȮMӧ���^�x1QLB��d�u�\@~�N��K�
G8�Qo�7���y�k�Y!:�kj4Rh����=��@���u�yM��P������x��3�z�ӮEx����SR��]SH��/�}4"-iv��2-�rQDɄ�t��L3���	v�JX�Θ��N����
����x����6.�*a�M:ٲF�bp$w��c����<���Su"��'�ֈ��n͞	�r��ĎW#����<���&ˎ�S׵y)��G�mܴI��z�v�pj-�m)�����YN�M�)MŅ���5���2�$�/\לr�n��y�|�m����8�������������XM�����7�b?x�4����w�^���U�,�C�@|i}������]
����U`�Nӡͷ��^�M�ŗ�Q�G2s�[��r�A��~U	��:c͐�Y����Ǣ��$h��(l�T�n��*kփgV<hFRڔG%-
ǕO\����˥a�\0�o�X(�G�~�0�"�'6d�^"�R%vx7��m������A���)���(�L�����G�Wj$���>.�Ep�]r���9|�_LHAHR> ���é����o((q���A�W�ٍd|��P��M�R6�9j��`��{��ò50�rJu������FAY��'|VA�`���,�x%���f�"w��3���M椿�Q����8@]AH=I�z#R�Hq/�~EY�C�W�'��-n���g;�"t���#�|H��#2?��ok�&� 
�i��}�F�?ti��!�슎b;��X�ӌ����1�4���1�����/�뿊�|�^�Z�g�8�Ҥ]K��(M�RX�&-�����E_m�2
�.����������UE?mY�-���L�&�w8I��8�i��(0'ycKa��:f�!R��v��������'ñ���+�������rɫg�p��١.1>d���E;`*m�u������'��>�>�2 ���M��u�zQ�k��Gcu���;'a�Z�a���V? ����^9e����A��7�-z�6B#�t�����8}�-�i����\��-}C�0�5�xY	���2|�._����eV;���)��`�:�k�X��ѣ�`+���H?� ��i�y���[7�5�h�4��^�/ى^�]f\#��[˻�_��'F�T�Bz
�;�?)a�Rէ1�d����s[�J_!����6�{��ͷ��q�{&D2{^�f�N��lg�6FAH��iNA8?��4ʖ\�/vS.%�О=�4�`������}�%a������W*̧;�	���?�r���4C.�Bg�7�9b�rx��U���!����'L/�f8#�M�K�g<Y�|����$T)G����J� ���;�m����5HGP�%T�K~~�D��A��VI���}os�����Ŵ�2 ���RRu�OLF4�p"���$��`�@�>U���k���\��/2ΧSq�����9_�5a9^��d��#�568�Q`�Y�
��T�4ˍ6��oZ��!8j~NA�#'�I:s�[V7R�9K��W+��p�����\C���89W���"9J��wm:�8�����b�tP�b��=8�v\��^^���ވd��eB$�[<m�P<����9����ag��Rxˆ[��b$I#�N�U}0
.eD+}�p�vmS$�y��-�փ9j��T����&E*�LK˱�2T��A+]�׃V*<������7�T�Yj�cv�HK˹i��/���	-KW{��hY��������=��?��Ϣ��M3N����i���5=1�����e\#:��|M�"����"�(a9�32�ZVm���d|��g���Wj�P|HTH_Lh����|A��$x��x�	��r�' h�)LP����h>�����#��v��fĿ��i��9�!�$�¯'�u	a"3JBs ���8ls�!�Lo�]��p=���r��G4�XjQn���t�g)��&r��{w��;{�<�ːj�k)�9���'Wtd�DFSз�K���6�7���6ay=(9nc�Z����C1���Jw�����CT����3j
e~1�fMa��C�R%��=�
A[��Ҋ�A�ς��D�iu+sv�Z��2�nJv-���]��U���R�[Py�2
)��u��J�����:{��5<hs��Zv,�g�g���f��Q�֬�ħj���4E��ZI�]�ߗ�SP�p�H��YG�uy��c
z�TBXdg� \jJS��n�3���
��n����n]���]?9Wp��\za:�-�͖�/��be ��z+}0�1��Mi��3�!��x4��#p��,�:U��C9I�.N��@�b�Z��]�%�B*��ù�iW�5rZ�Z���:�k-�pG�H�	QY�y+����*v��Y׉̓�T�{d��ͭEo!.����W�M���ܜ�ۏ]m�3+ȭ0
LE�vD��L0�3Q�x�H%�`��f:�(�c�ķ��G��i�xAJ�Z����������!NA�hf[��R��ȥJE
��h!`J�0�O���ο��v^!ܸwn����+R��8�ߩ\�g��;�_��:OՒ	�LD�](C %��
Y����W�|�Af������"rk\�y>u?�Q��k�DM�^���q=K����w�����������d�yp�o�S� g`��5�����ΡR�^�s�С�}���3�|��)/4��``Hi���Y��`d�;C�9��q�=�E���\*�P����H"��H�K7�������RX%��oL3�s���o� �ϧM��/�#����*���PU+̅�.+R(<gh�ΏV���3�-`����3K��@G)�-"����Sڞ�ĺۺ�h�0���Ս%Z�hb������n�E�;K�Z,���|n4�$K=L��gڏ�
8�3�W\�,������FM���£���s����Al��OE��?�ŨZ��m��    �u;M�"|?rĒ��,��
SȂ����̲e	c� W��k�b\�k��+��hE���d�H���o\���m#��W�nU��o>��:ϗt�Y:�i�]�}�i��P�r�7Efx(x�!��F�)rÃu�À�Y����m�� �-�_q(<��[��p��N��ߊ����a�"�X��ף	���/U��8�+��t���7츍\���6t�Sһ`0�3v����5EAY����*(�&c	��C��?�6@�7��\�IB�'.9��K�#�aB�$	��,6���!c����2���e���y��D|,���_=	R�2o~A���2�?��I�.$m�྆2�}��X�ς��� �SÁ�]U�kXAz`���������$��#�\�J#^�L�&x���;L���(_��ܢR� HC/A�T�"�؍�Tɏ����F��E����6�6�ݘ״��A����?ҭ�?>��$������5e,>7�V��~���܈��Ӂ�3%R��韙Ѫ?�B�?�r�h&W�� }�c����ܦk��2������l�Î�5��m��l���w��l���^��RLũ��>�O�/�1cȬ_/;2���T��,��?�e,.�%-�ӷ玎�I�����0��-�sM�\�y#qP�"�8��H�r�y�D��,K��,A�x42�[Ԕ��<~��5d��E&�ǔ�"v��9Bv�����;Vơz�d�-rQr�8�8Qd���(e����>�vw�`�g�,!�	��89#�d�x`>�,m@��k.=�e\�t�,�P�|�6�v�3�G�&x7ߣb�\I�@xz-\���b˿�V+ܻ�t-���~�Ȯ�c���4�T�
ޱ���ei�gl�UP2���z�G�״N!�ˢ��� K%-���E8ގ�R�up���#�[e�;"I�"�_
'W����8Z�5�~eY׸Td�r5��C�{�䤬Y��:ex@�sΟ��9~1�*�,J����8Y���������M��W��{�&3��A�H/y&p-#��}����ē�S�:NOb2
m��;R�<�I�W��a.��'�h�G<9�.��a;�(�d!>�A�B&�)��O[��E�%�S�"`�O�xR_�9|�K����T6tu�6������Ԡ��xjú&`�2�k�tt�0v�/%�
1_J^���ь��詨v]ߵl�^��ۺ��e��FG�D5W���������F�h�QDBB�=�5�I�
'��Ƕ>說 &2�L'|��k�/�P���J�5
`�â�HK����%
O�޵�b}�G�m)�=��	n�,8�W��	��{��4U�.�/Q�2ӵ���G7е�ܾ��#=$��W�.��Ϡ�Z�������̆�"ְ�]�C	>2��F$-�V�,���$ݦ���Ǆ���mQy��K�-*Ħ�k�����h�EBeIf|VA��!Z�t/��k޼Cv�p��.]���!eI�<y2���,�G���S7���Z�Gi�t��=�q��joY�P/(�M}B�����m��5�)�N��2�^1��X(ѳI��G���n��ȸ���[�5�~�s�~�f|�uŕ���e2�/�̲�!|ϡ[6w�,:�W��b��gO3$�¤�S������0
L�y�&�	-#����}��ؾ���ć�7�{�۾�_����p�!�ü�w���3�H�s��~�s�Hׯ��ׇ�	%b�nٓۢ���E�ns�����3-�ulf�Bc�p�t��&Ï�P�F���O+�5.@DtO�ӑ��;��6��j�]8�uOOG`�΃�<+�����mE���܂�{�5y(^Jg�x,�ß�z�7"���wEF^�8_J���.��}S��9�0�2;+�+������(�דk���\*e1�4�fG��pvI��$A�]�QA���P�h�	k)�s@a8���f�Ф�tw�]����FG)2K�	�W!��d��%s�7r4(Gא�<"TX��?W�I}�N�W4xX���Tֵ0�nE��A���)��쭜�<��E>�N�V`�떐�ΌSqű$�w"N�>IyVw��"}[���jP؝�Ê@��-F;��jϴE����v+����,5�~2)e���Ң���C6��\���6�٦k95��Q]��������;����������#���h}\��}q,�ǩ�m� ��k	�溡{�K>���m�JY�7u8�}%mZ���!j�:$��)RS	�}¤�lخ�B�[˸F���d����ſ5Jz���+�<&���<�w}���אr���������F���r���&Ӓ��x%wL���AE��*��:p�gƼ@���L����BN�Hm.��Ȭ)�JYd2�<H�]����%.�����J[��[���x:�"Т�y?ϒ|��J��#-�QM��>̅�'�a�c<Y�q��K�vTo��aې#��W�u���FH�~�*ff�,!ü�LE��۹��������Ψ|��KY�'H��
l�����qA�-�o�l�f���8�o�G[^�KM�q^�*�`��"Y�����_����l,*�*p��E���`8�J�_`��:�JYt���f,�ٷ�NY$R(�̾�)L4���4��~���"����]�6@·`-Fv��W�:֍Qv7��S�v6��)=�;Q�+��������厠�a�i�F8�6Ϲ�*��l9-֭��O�f	������ɡ�^k׼Րm�����B�v�K�l|��B��w݆�Sߦ��e���� �F����'�+�p�\���T�?���mx`R�R�"��� �5�W���j��G��d<�1�7�^Eșb�RҢ���Ny�H�D�?��5W�QZ��iW(�Ea�m�Ǧl��X=St��'`�s�z��9kx����V��(k�b��$k��.���ïJ"�:�{5�����^�'��� ����w�IQ��ݦ�lV�i:�de�K!m�nH;|ʛbC�"q�o�kq+��9����a�y���9�1�O`��#��M�U����=[�N��}�t��#�T��97]�u _�ِ�وD@ae� ��i}#�R���tĹ��Υ�_|/~����bR�RqH��j�f�'S�+����>L�w��0���AG(�rb�-�X�F�
�'/r�"D�;]��8҃J�l	�L$=�-��LX/
c�!G�t1�Q,?��s����xH��kN\�v'�55�R)�LF��1[@����%!p�H���!��l-M���/�$"̚d�>�I��E��<�d6�<gҵa!�K0,��s��6Y��	钅z���xf��~C-)3S�[��.�ה)V�(�=��0���E���YN)�e<Oi�x:�y��޾g�?�Z:�
����Z:�"hS�t�鯤�nI��٧�-Z+u�U:Dy�3�I�������LGGu���!���q����V��(�I���$�����pl=��ȍR����)��u�:�͵1��=��H��&_�c�����>�� ���ַb����� ���J[T��8I��	��v�%A*�^N�K&E*�'8���O���W�*^�qE*x��	*^5{�����	0|YTe�/J[T:2�Y�b��Rm,vQ1JX#�y�4���t��
��zFA~Y�w[�9r�����W[lh��
J�A�|_����M�RH�q�,��Y%�,da�l;�-2�c��dB��c�;L/�X�s�����VZ�I��Ʉ����]`y���~����f���cqI��n���Fd��۞i���[�X�P�Us?"����Q��Fi�6�q��K'\@�<���P�Q%��u~e��0����[��3�b�\����
��)��x�@�P�m��N%��q�����kD9ثU�w��b�����(�#��p
ּ9�[>�e^p0�ɽ-k^_�����S��f�+Z;�A:fL�g"a"��S[��#�vEz'$9"��Phr��Y��������Ro@���'s�ކ5b�nX#&��>_#���\�G��bFJ�����֎�ZY�7���TwM�r4"���    cB�\��t�ܝ�x�{F*&��p����E�!VU���|��-
�8�q�BZ6RFi�,����Ӛ��0Gṅ��>�8�@S�����8�k�����bb��z��Z�S�cm�'��H��<f���Ji�)�R��x��i����c�ڶ�&�uV`��m�.�zW��m@A���nA�ēp���
�j�yx[U�+0����/��9�̊ƈ��IL��`N�N�0H�q69bq �PtE^�o<E��rZ�$����M��1�G���Z:)���.s�x�^� �^�.j ��P����9;";�����EwByn����䳤�u�;�邅��سa��G5�\m�ô׼(iQ�lb>d�i�Z���Atve�Fp+����������\�4gc��/�=��X�FLi�f��DRp,:��^	�����+�Ss{B~���#�
B�5C+��p��x��\֊�\�޸��q&ص`�Ȏl�7.�Ü�p��u���,�X"�F&E���,{V�����0
��"�j��jN1�)i�kN1$�z�0� ļ��E���zArݹ���E���]�f������6�{%-
�q$0�_-��4d�ol<&���,�5x0�඘�Z�7���N��݈{�����/�W�����I�=�06N8���\I�.HK*9�Ώ�kKjR��}� �	�%&�HSݿ�1��2�^�6��%|�Dz@̈́�x��TO���w��Y�P	P���+a��S���3̣��z$�8'}a���k��v�t�פ�(]�a��6�u���Z6�r��pН<��# �E�q;�K�-*~�ǥ���K6���\�/J[T:��4�W�u�X_R.֔VQ��l��i�:xĕ>��}�!|!
�k���c�%��g��<�������?�g{��t�C�]��?���K��,ga`p�R�
<eG�P�r?��QY�d���rs�W�e��d�v_
)�J&�kv/��sɥd7�@²���P`31d��,Mz�4´]���W(t�H39�W�<[� �nѿK�w�&���t9Oz�h�����1���|6�u�)p���z@�!���u�U!E|��NH��f,:Ý_��ӳL��6���lC�Q�&�J��%3�d��>b��8���C�9l��2�~�y5���5297$�j����	���D��3-�H���"���DrńH&�x��ЕB�����!CY*mѦ���W�y2��E���Q/�\=�4\9��1�,�eQ�O�z��X��ĥ>>�k��+��.��m�?^}�a��́���Q��	��N�
`�2#cxt����o�9d�N��K�+�k�%S���?O�i��i����i�G�;��Xdz�L'p3�O��G�(���Q�*a\O͙����K<hS��[������W�Vp���8����]Cb�r��/�)o���6�vqk��Mct6��ˁ�^����ӻ��ߎ�2����&LG���]���� t\��Y����c���|®\.��~�Jںo�����1-#w?,3�e�ę]�c�Z$*�8��R�d���X�
BȖ��ZD�IF��T�y��\J�~@Z?��H2\�cS�sN���I�^L�PmPz��Y�2���W�޴#����L�'V��
MG��FSxǑ4���UA�?�l_*ޓ
Xެmk-#��ٓI�:�&�������7�!ӵ#3�C%�x�~�~��:�|%UѰp3N��kB��Ѵ�^��vFd�]�L��ht���N������D�mG��58�O�'���r����$[&D2"��S�R��Kv2
�LK����xa'�����)�튾�����ڵ���G0MGZ ���Z��{a���h1ϡ�Ssؒ� �<���W�%[���Y={�|�m���(�`/�W hx�>�Le�tK[Q�t˴��B����?jRpJ�A�
�����e�����W�y}������3�Z7�n�*��~Ռ}R3#:�ϓ	�B�Hr#�=�e_H¥�Ēqh>MK\�z�%�E*0���q�է�Z�5�lu�UJƓD�J?�kDz��7&D�v)��f�!��^i����3�E␵|��p��1>�!�d�)���SnA���v��#݉�D�
���!yS¢݉x�I�[Us6�XSMw����66
���p|�W������L�K˺�%��<���O�� 	�|�>"�Bzs��SaR�8�즁��}\��y�>�}��>��hj����Aڗ�	¼���z|N�u��d�=��5�de�M�A�i<���h��E1��Hvv�f���7�)���L���ss�[��ZN�?:�k����|<�V�`M[��B/ ]���۹:h�9��R�)�PCW�!}�>eQx���EAq4	[!QA�c��7~�cX�Cc"C���H=�n���%l���W�q�~�l����[���l/���M޵�$�ސ�+|�
�������)�����BD�� 5�ى�2���Np�{���+cV��]4��Z2U��H�v-�d�y&('��=�<.�$�Px�����Q��d4rꢲ8�BS�[zM,*��K�-*����B{q=c�5~��B��^8C�Sb/Tk��U����}C�<𯼤��w�b���������d4YH­?OE��-�K��wE��m�#�˴�Y�'�Y���CX�����2�2�Ҕ)�?gM}8�em����}�Ȯ%Y�����t8��1�65�����F�8��O��즄��m;"�+�A��������Q�T�c��߶x{<R�ٵx �����b������?"��=��U���-?���]
f�+���0�����]&�(j���m�`o�s��	�B������/�Pby��P��E�n�c�q�Q2O>0��$��f��g��hael��T��O��N���[o#a!iJ �.��E�#�%\�/Z̎͞�k���յ�6��RZSX��MN/�ӡ)��T\C��F�Z�5�﹪�j,�ߟڳ�ձ��Ԛ1�i�,kR��k��!��I��B���8Mm�F�k?(����_.��N�U�˩�m����V)��2&"H�	�O�B!��������ڬWdxb���-�g�����ݡd�o�'�Y�4 �KQyؕ�oJ[T:�������ώ�Ӈ��E��X�B�qEX$������A9I�_�F���#�h�Ҵz��t���f��kAC%5�85�ij>�4]�;V[Y�k�`�Na��Ƿ�m>��	a��[&��k� u���gZ@�je[���V��օ���a��?���RK�2P�~�JO���<r:��l(���{����(�a�$=��k`���g� ��DX��?��7�~=J[!HV�D(tE9 ���@[%,�cAi^h���*0�^
�R)�q�@\��xf���l��x�~��jӵ0`2p�=�q��g��W)�����E)4�Yg\{gky�Ё�Kb167�gaܴ�f�FN������A*�5��_��6�o�?JXdߚ;oҟ�3�ic���.��2�n��*��K�t���%m~�7�\<����7��<��-$x])i��ޕ��h'b㌯�L�i��/-��⍧��oB��j���|k�c��	s����kc�6���x�Q.!PX�IG��۴@a�&��C��+z����c��E�1�J[T:�w���r�P3@AE�EBJ�P�NA��W.E5��-��h��jK�27���r�n{AK�UY��y�O�>�.�#w{1����|ϋ���鷓	�T$��dX�]�t2��R�p�a���JYͿ� ��ie������Z#<@
O{���9t���w��JЍ�^�+a���e]C}%�O��3�,�.�[�h�M�-3���B��|:Jٟp�x:�V ���D;o�#�;�V\zWd /1A�M>J�� ������xy�����ξ���gԿ�?��r��Y�Ipǩo�W��pI�{'>5����?/�[�B3ԫTO���&��l��|d1�id�����fK/p7���iխ�9��E?�&+Z��U�    n�G�٬l-�LG.���f��X-:��A	�}כ	�`�$ՙM�^^Z��̗�:o�S.�G2NX�E^�/�Q�]CGX�%�Z�5t �u�ۼu����,z.J�R/9�#�7�(�&y�]Ch�
h,�����|��R���C��QQ�BK���^I��F�]��X�r����	J9)R�s�MM�h�³QK���D�b�~Q-�>���P�PH� !]��G���<��'V+z:i1ЊZ%-�VVy��1Ujݟ��ֈ�9@ɔHa��ʰK2���>/,��[&Ez	F��~S$ݨ�����BR{0,�9Γ�Ğ"|<p�5�s�\I�z��]!�M�Q>��:�@�&�`�ګ�_�K��yf'L_��AX���[-��|L���3ҍ>��@�Ŏa6]���)8MDU��0xTE���J?>b���Λ���M���Y)Z۱�ٯV5�gp�O��\�>�N$����f�R&"���L�fJ�0~���}��5���~ӥ�M`�!�t����!���=;�E��B��C�i�ҏ�s�eE�:>V��-3
B��}u΅S.� z�0�Ռ��dPѨ=Mi�ՑS#+x��L�nDF8�l���6ߜ��Bc�#X+iQذ�pK��k����IK��<W����M��{���5�\]sȅ@�tN8�K�I�� �����2)����y�?Lҙ;������(�Y#�W=�ݎ�ˉ��+;��p
�R_.h���Ӻ.4�+��F	��:D�f�_��ǡA�}^�_��.��P;A���7�s<��E�ث"�X���3K�b����jU�Z�c]Tܵ��{�s��\}��_"����7�����8uГ�.�0*�"�����N��v�)
U����HpNT��X�8i�A����I���1��fhzF�0b�[hxF����B����%�[�.(h<���|�+���eb<��wDZ��qdZ��)�����I�ԫ��L:��48��@����\LӮ�-R�I5$�V��x��up���I�\x>gey:�ȉg#�Bߍ���a�,}a{`�����}g.�m�O���QF#{�.ێ�*J��<�_���b���rWd�<y<�<�a�=[�'������)�P4)�u���V
2H
�dJd/),� .��#�1l9�������O��?%aݫ��ѽ�=�#�*� �!'Y&ŚC,�k�D˅e\����|"�d4���6;5<I��=��#&\Y�5t z��y:׺���6"��K�E0�NR�F!ZSn�'jD���]úR��\2���||\�8�H�Km"�l��1Qg�ƹ��:�4���+{�?�Q�C�)���b�0�!��կ��T��y�A��(L�f7�9-ҖU�[N�+R9����I�JE8jcj<0�Vm�&�¥x��E���������yE���8+�d����5t�z���Hqz3D�ӑ���r�)o3q�=�#gt���bt��uJ�Š �FI����Q*��=!�q�3��b ϖq�~`���aRw�C��B�oc��$v�1��R��� v�d�Rm	1���o�j���u���x�.�PM^th"��	� Afe�Y)e��x�2_p��b��N�ɈT�3��L�T��������{L�ш�W�|�aJ�0��`�����͆�W���X2��R�⥬��t>�N��!Dtl�!.�"�&�㵟w�������)6��s��of�2>�f2�i��1�����[�ϫ�@�mɦ\2��Y��h9E��mV��vr�$깽b��͎J�k,�eu3��8�FAH>���p
�Eg��p[�c�X��4k��p
�E��p��ԧ�%��
���&����t���+����W��x�e�GY놺��>���h:�b���H��
BB3%8� \Tʞ�����}���P���K�yD���^ +=��-��Px0q��}�0�s�1ѭ�z�̎�Ӟs;zmFV:��7�e4�-0��Q�^>��(% ��<��F�
`�#�:������@�Q`Nv�{avֿ)��:�'�s�o��r�D� �d�Y+a\X����)u���'�=\��_�5oe��v��\�
��j�����������Zz
D�>�9�,�"�3�,-.�a�!%��"	t즂�-\��sPA������$`>E��zhVq����c�Bf��Y2���a:ҽxX�ۇ��e�gp���\�x�=���ǯE�E��K:��y5±�Z��`��y�
�}f8@�C.��ޞ٪}fOC��f|cR�R�u%�d���+�ʙ����+��Г�#���5�B(
m�[%-
�%�	�r-�K��RH����{��`:J�j �N�g�� �y�Fᢧ2����7�����m�Α��MY��
l��k�����f��Qr@X�.���-�
�C�����*-]��@]�
}�W�3|�6�)=���i1����ud׊s�r����rت6��=��Q�
Q��'��Bm���,Z�نW]�h9׈�p���V����_|�m�����/a��o81��ة��Xt�݃ٺ��R� �7'�j+�)��*���v=�L�9K��JEF�B�4/i|����N��q.���U�2T�5Z�dd��"���YX+���=*%��3��xG4�����oU�̚�E&C/��0�)��%���3%�+22%K�ʂg �F���/5��SrW$��_�}2i֬�wn:�l5(��w:k-(w�%��9J�Ӕ��l�{%,Fv@�����4�}�wM����dB��$�����Ql"�Xb́��KD4���g�[�d����2�}�2��'~�7t��y�gM�0t��.�檬��:H3"���T#��̓C�j���;P����ԍB���,�*�x;���}ʅ�F0o�g�e��T��(��WV&-�r������uS����G(�%.�#;E�,t�}*�|�Eo�m��ȉ�把�q�g�AA�S"��Hh@�6W��ǃ|�5yL��7�5y(�j0��/�?r8rBx�}�,�6*�u�u�� �Bk2zM�7 P/oDג�����$��m^���b!�*5!Y��r���k�StזsQxc��к���P��9�K_�Zs:��W��`�j��L�0cHf�~����4�d"��K�lp~���!�]~ͷLE^es����\f8\s����yoyװGϑ�g�Y�k�B�Խs�yҏ�pj<�I�i9P������j
G�[��pX�Ad�����6�*(�`&�d�eU����=DU��`�n3�&G��@������?iT.w�%7=���R ��T�k&D2�M����c���7f�`}1##.N%�R�0��ʒ�^e%c?GL��J�5U(�b��Tab�{bݿ+d#�A�r��]-��T� %��s)�!H��%3\��1ƤY_��kxm���sf	�F�����$��3a*A�t&L%hτ%�iz���Ȇ?�O8z\X=�h>f�T�Tʰ�S���)VdVj�n���d\m	��r���)*��'�)����u�� #��%4�y���(|6�毜�!�	�+k~	�Uĕ���hf��]���N�U������"�-9����S�Y�*����2L����v�UI�ܹ�?����M�wO�y����^�An���]��{���˅���K���
J��$l��U�.�/��՘8y�A^c&b#��#�V��UƢ��m����������p���A��g����Zڬ�JZ6>g���S���FؒpH����\,<�z�m�m�H|�����0!0,�	��z�ả,W�"W%}؏X��6 �x�訋ĺ�+���2��;�/u��V��:�ku;�@ۚ! ������q�>���(<���kv�~�W$3�T��2!��^���ؚ0�\2���&����$E�7��+�&C�ʼ��!%?��۬|ɪ���m��gk�v�ţ��#�aG�u�5??��ᓦ���b?7)���?W�-֤O�̐NrɄH&"g��|
Q��h#w����2	�)����٤��r[��{��,p �o	���,�d�N��]��
�o�9    7�P+#~�ǳn�ۜ�3A�Ő>t.TK�g��V�ݢ�_ߍ��+�����|:L�8�J�y���SE�,�r��>Ƭ��b�x
EJu��O���O���r�Dy������Z����7%,��>e��=(5gJ\����4��p
���S�dڗr��7������.ݍ#ɒ��+��U��'H.S�|TJ��Ni*��3��H��A2U�_?n��� k�͜s�[����H �0����ٟ�I�F;�[a����aȩ���o6g"#˓ذ=�d{�����;�pg�dJ�UƀT���Y��.��ϵl����(ӡv�����A��w��$�g�c�*��)��$�X��|*�4�z߄ĹĠ�J$@�����g��ص��-a��΋�ވ��q6q=�А9��{>wzm@�g�){����p�}�`p.:�#�!�4��%�S�@#�cf�a(c�6�sh�Zf��Lg70���MQ���������yA�s��_?5�
�|��N��k��M�R���Z3ߺZS?�Oa?�c�����f֥3c�=��p��� S���*�Jv�C��a����j)����(ʚ�/F��+t�d�&�����(��93�{8�2�7b�
�8#l�f���;E����5�?�N݄p7����&���Q�qd#��F��@��i���8�c�I$%�WbQIǦu8c9L��G�(�ഁސ3�ձ~�|m��s�b���e�iE�qE�U;-$��d�ے.*�$�|��A7��N�9�ӷ��V��ȹ�u$:�BnEV�Q�˛���}�c��%���}醄Zݨ���w���g��[�Zy� ��֑��K�j��.!#�|4���;�Q�����^��[󱶱��W'�s|n;Y�1��։gb�������)��rC��5�E�C�����r浍%R8�����{K����H�6���#�}�>R�U����"�0)��p>�n�I�Mr��<��Q2�\�ҧ�p�� *ZZ+g`EK񋋶�_��C��;�V#�Bp4fU��8V������&%�e��e%���<���N����LWZ܄��n�s@�~�ڌ⿼�U�]E�Ƴç��h�F�kB>�j��쀗l�摴�\
#=��xZ������*��%Sy��R{-�d2��~>��l20Y����FFK'��"�U`w�/��Հm��`�.�H|�U���W�5B\�Pi#�F:T����!��6{(�k>�
��MR�h�d<������l�	��%�'�XP��P�~H�]]���Aq��� M�>��tC��6��Z�|���z/�1�'n#��9q��a��j�t�j��3��N8���0J���.��d���u��C�AޜTq���nq�w}>�3���~!����>������ws.1c�����	=�����p6#���r�m	]{g�a�\�tVo�Mۦ�q�z��Oa�Aw��(�iu�|�K;֞����K��F��Qh&��kpTm^^� �s�FI0���_��<�������i���7�v��7���)$�����������P�m����w�_h�Ĩɫvo 8Z��l��ɫvp 86�ۘO�r̪N"~����	��k^vzD�u���ӣZ���ڤ�"�����A����de�"6-M&�$��Oe���Jw��7K*�6��ꍸLzo�B�Mc��3+J0��������E����/�u
�x�����Z#��O1��;`�T:ִ���b[�OM��\~����'�5�Uv�]뭣�I.�O�uhn����>..�A�.�1�o�{d��9�2���l�c��*��$<8M�8բj�Q�Kf J����U���n�	B�;��~Qq(r��o�eH%��|�>j��Toc���ӽ���@_��,��w>dj��J��)��$���IN���<mP/w`����������n�1��H�w��ߋ��A��	�i^36fL�՝�����h_�����ʢ�'dU	5I	�@!tjM�:h�*�=*�Q@����������`�(}>~S��L4(�̅�AцNo�ig�=�������N/i��)�c�0�6۞:t��C��Oo#�]|T��!����F��BuDh����?��&��8#� ��6h���ݾ'��h���M�����V6�J������Ze��s����k�c��R0VN�ĥ�F&!�|�;a$*7i+��D�7ȸ���'s��KNn�I�~c�C�O���[0�0�$���I�uH��Ӿ/�}<�vR��A\�{t|;�LL��L�s�\��>bΦM��_I�]^/νn_��'*}�j~U�oM�;&�i�,�#؈w��)��d;�v���M����.���r`���e]�1�OJ\\�%�ҺXVR]\<�8)���J�aHKA�Mr�f�M��w�,8���[�j���w KȻs�p��8G�V�L�-du��u�e�|/�ӒY�,4��7h<�J��w�Ivo_��R��B¿	������h���!iﾀ��S(K��N�l�Ԁ��1��Q�!3>A��b��T5c6U���b�̡wbo�p�@�ap�=�����E�dv$��y��T�)�d
�Z���~�I$/�0���{.ɋ�G(��:y=����ד��N�O%:c=�z4$�!#�r4�!�T��Z�cu�f4Q��3{1��\���c4젼p"�

'"P��e�0�g����_��W�����;����i]3
2l"䵿�w�֑�/�i����N�������՝���8���� >�(S(|
�"�<*k`d��1�۾jp,��I���!�4�0����p/�	sᷨ٘M�@D(Z�z����\9��O2�G�����}�Ӱ�7���2۲+L:����p{���A�+�Jy�!v�Aؖ�=���py#���K	Sy�>]y������h��6fc�ֵ� �n��a����Z�5��@~�R�G����딲�k�N��������䏙C�J�t�زFù�t?����	�^���k�w�[�<.���ʶ�D��`Υ�����~�`�׬2?�;<�	�v#}��y�{�#.zj~dU�#*z*g�8�c����؟3��,s*@��ԧjZ	
\�r�����@@_`�F�� ��"(z�{��Ń�Q�lϋ�� ��
Ӿ���X�t�6�n�I��"�;��g6ڐo�����f3�Gk��Mj���ݕ�o~;$Ŭ�f��`\�jd�ס��d��ŢZ���H�^t����7�:�\Q/�@+����w����<�Eu��h~�ZmqX`LSESϠ|�B���f4�����p@R�:M��_��|_�d�/q;�חP� �b��@����PVM�9)����j�Cp���b)�x{\n�h~�0�z;�S�W� )o�p�lw��ڤleIRmP�reZ�ep͝:�8��Si\��B(ҟ�����nW��A��l_�.�� ��}ve�vn8�Y�������u5��#����+��n V츢��{f���+d�o�����	am�2ɒ6�lM�`M_��#�T�N�	����@���|��r<D�0{�����k��ޮ�	��7�P=#�hDKe|]��#�T�h��ͮ>��D�\��PƀTZ8�U'_����2�(Q�U9�k*Q����훾��Ky9��j��N��P�e<mЌ�v��,�d�C�eċ�,��5OҴ9����,�Z-Zhp����`��]�r�U��Eܺ��.Lᚗ����,2Z˻w9�;�C��l	�8�H'��9N���DV	NV0J�\V��r�F��H�h8�i0�/��Ȥ���~�0i��A�gfp�?e�}�Ⱦ��XM�,.�502y۞������٦�� �zTTR��8Uҡ��S~8�'v�h�ǃsF�<���k������4p���{!��+?(^b�$TO���&�������G�i��Ì��i:Ⱦ��fX��˗��e�c���8~4�\UB`ջ��H)�/��@V;c*��Dg��MII� �� V$~���:�5�oF8�Z�8�>��e�    .~��X��sN	kF^��tz��'�͐,�՗��V�羱�//I�`<���%(���0mA�[rUI9��y�t;��z�9� ��^�'~�|�k������S����Z�]Xc��h8tk��Z�&S��gRjm-���՚� �s�b� ��s	�ҧ�7|:Gh�Zֽ9��� 
��z��`R���q;�#��.��w!d7#�o$e�xZ�J:�?j9���
v(�(�f�R�� |�j('�Pil��F:T6M{�ϲ���}��zF��l'�W4�J^ӹ��W��]��	}��܉��!\t�Q^�R8X�YI����g�zw^T(jG����hG�|��"�H������tF���n�7,�q�X?P���U���sy$.ݞ˯IK��w���Y���	��h���Ƕ�H�>&�>���1hM l��Hׁ� P��d�WT^m�B��d�����^�2��M��7�j�	l8g�3��2=�n_�2����M�~���(�R����87p��A�t�/w��������hp�U�b_�J��qq(�t��?���r��C},3V��&j��H&:�뾗l�^o�}�a�rJ��ޛ�S��:)������hLI�_Vvm�I��pg�����#��a��T���,I�5*<j�.��G&�MAdG$�q�x	&���"�]:)�vd�4�c�����n%I�T���ҨM"��j�}q�n~�^y�����gF#W��ǘF.⶚�1����Ř,���"�bL2rLq;@1��U*6sH��r�gX!�2�o
��2��kG����v�#�>آp�l-
���^��qzOBmZ��6{�єѺ*n��CuU�`I�$�3��9۠$��?f�$";����a��e4ʇ��y+S�D�>_se�Cfl��8�]�ئQvۥD1�"����Xl�
��q鍛%m�`NQ�[z�&I/7��z��T�b���r%��2�:+O��;�j�1mڬ4J��wsu���Ⱥȶ�$�(�ö+@�Cv���Iμ��ʒ:�ɱ^��`P�����N�?|Ap��Q�l�Pi�P�x�%�P٤��\6>M���d��W�W,���^�NH{P^�7e��Ե
��VZ�(�th�d~�V�miex�����}�%�QN��H��n�՛��� �+g.���{�"�ƕ󩥎�n ���'���҅c��2K5�Ѩ?��[� �����Ć(kGvOm���hGv+�-��<��}/VH^Y]�ս��i�t�"�`4ˑ���g�C㑪\���8.3�P�[ֽo�j�Ӳ!Hy4ʺ1�!���A�[lLz�u����!�l{4�!�T`+�s�?�[4s�k�d��]٥×m)��s�i4C'iynt�*�{J��+�v�#�kN��4I#�M�h\ۙ����.w$��Q?�4
���i�T��j>E?D�©�+<ra��YޣP�G)6tF����Q&Mڔ���W��C��J5����}�GC�N/�!{Tt:���*FT���4ߑd������VR)< ƍ�{7�6@Qء�p,�t�l�k�Y�~���O���U��)	��FV��{���KF�~D���N$��������$I(?a�^�r��X�v�e�]���̛3�vm��|��u��m\�h�e���l���F�p��aL���3�i�-ӱ�J�	�R�#"������.U�ӹ®� I�]+k�Rd��[x��_�h��\ԣ��3 �6F�Y�H��?m�k|�c��.��|����ay{~~��D-.�˕�~p���x��H�<a�־�Jf?��K��|:�O�9�p�=�|��ld��vW���S{'��4~9���'�z0���O��߼?� �}�s�� �>��� 4�ޗ���N�0�����7�)X4L�����CJ�2�D:��]#��[��FM���-[��Z�8�j6j�P�+Ȓ��n<Վ��!���i��$7�a��$f�,p��jȷ��-�����R{����};g�w�3����7R��	�pT�+�^:d�[6�5��Ӗf:B�������2���Bm72�<�xg�d����9��H6p������;��������"f����7Q�h=��v�p��iSH�P��+����r[�zn�\j�L�d���@Z&S"��C�;U$���2{Ӹ�=^u����E[��+���Xl:�e��^e"������I������ä�K� Q���8s���ʣ�٫�W#<�F���GN0�kU6P�QR�^�1Hc�o3·&:�~ށ�D��_������A�ݩ����Xf���F�/(��ԨXe�U���^T�ؤ�_�@�(CI���"ﳜyd�5N�;↤Z��H>Q׈Qf�#vY�6�+��&�q�� �v�vSQ��%s�tV^�t�l�w��3�������Z/�,��}�,�6�����7Ӳ��y�����	��[����0yO&�φ�d��e��+��]_ٿAF4�Uoj�Sta� 	n�'�j_�1����1~�>�q{L�d���?�p*��d��\M���h>�N���@���U^@�ɼb�W�4����ʳ�;vs(vϙ�ۻl�p/���\�ñ,�Z$�fu�mVGZ{�:xh�l{7���� �]�����,��)צ�u��x+�V�����U��e\�b�PHK����>3,��g�o�~Qgj[�uh�a�[j[6�f��<�/kxgzk,�s�ڑ��v���F;�[�S'�w��D|B�M"�G�$"�o8�j��)фVR�/O�&�rIߠ�\��vU���@j��G^���N��E�������mC��Y�L8L%bP�<�z���<Z�ci���ѩ�ߤ���&������*zm�C-����h���#u{(a,���l�� '�oH�@�X�cL�(����o~�w���l�M�M+�u�1b��,��v�2�T�B��2�R�I�#�h�;�07�S�Y�Ww���O��C���Md����ݓPK���������B��4>G�"�c�#���O欖�Q��Mu%��3���$:��hlS������� Px�)c�j�A�a�^��kSx���åMW�e�>|D��<�+eC�*{�+9��>������M�U�ys����I��MS���BULe�0$ܜ�1�l�Q�
�QeȾU�趮��x��j�Mf���P�@�F�'���o��Ҡ[�#��=3��M�KK��x�.����$P�� �g�7���y�폦o>BA]�k� ����R�� I���G|��
��MRio��M7�{SC�g�`)h��|0������<�I(�-�G!H@q�>
i�	���|���2��
���+�o���s��󑓯��4��0��鰕��S�'����|d?S����G�j�=�0"P���~�k���:+a�pM���Fz���"��mCo���HB,�2F�;���Y�>���Nʘ�Н˧A�k}M�����l7RG��r�]�n+H�fJʦ�R�@��8����� �,-"�x��m-�T{�ꈌ�VU�EF&��t�Bv�B�Kڮݍ°�'ۑ�E^���*T7'~p�l�߯��D�p:�5ߒ,5��a�j��C&\�;��kC��I�mh�-���s�C-���ywh��z��T1���2�5� �G<LE�{�s?Z�V����:H�m��&��V۽���z/���'����Rp�0���r�z~�O�#�z�)��A�|n�����]B��9���gAf���.6/��JE]k9grQ�έb�Nģ�x�>%������A�99��O�]'�!<m�a]D"	J��(
$(�z~�K��W��_�6TZ�Ї��_��^�3��b�,Z��x��D�M_x�;v�6Zݠc�݊:�L�s_�.HqH�/I�[�̐�}[����\������y���u�j�!���]#v����3rl�[*c@*���}�ce>�]��OjGW2CP��7�Q�#��T�s9|mjY��]S�5�S� ��˴j-���N&���d4��gYl�k^�U�����L��#��GY����ɏ�Q���5+@    ��G.尠�O�����X�6����z�9����嚄CW�L���oۚ��ŭ���fIBm��ф�6�߮tL$+��[�c"�pnE��L�ߊ%�����e�~��̀T�O<�ˇ�Af�3�Y|"�1Y�ئ��}�f��k�,���,ՒAu�r�JB-��ẜ�án����m��OI�Y3F����F����5�QB�p��^wR`��h����ÿ��j���㮐�p�&�a� 7�$���*��J�ݔ��]�T�t�˟����w��ߡ�A~�K�q+d��F#}c>`�Ǉ���)�|k�D�\�K9��n�9*X�J 	aZ9���s@.�˘B�B���a[�����	�r#Q��g�_U��vQ�R�B�ȮL���s�]�$���D����i����>QDM-�� �&��D��;���Ņ�KW�`O�l[��P,�ܠ����Z]Z�L��ܒTkT��M������`m*vB2yŇ���f�_�tڕ���r�l�3P.�E��� ��4�h4U��i����4q%�q���7�Q5�:.��-?R?���R&�ʇ�4VtEؕ��7]V�1�"e�><��&�VZ1�4�.��9���L#4�H%]g�_諼�W��W��o(��� ���8������ki������0��ֻ�-|E�^tu��|u��5���Yy���#�82�҃�!~�ݪ|�Jf{�Z9��&�#�!���sZ��R�빉e*�L��d`��Q��m(��{�$jG� �(��g�l$��pX6�$�p8���ǹLƗ��e�D��!Y���>�d"�9��'��{.��~���g����DE���s_��,��SS+�?�#���'O�#��F��9�AD��n��ɤH_V)�[�n���ǹ,�h�W�z�+tp�������V�c�@����}B��$A�(��� tp�rM�	��>q'�J���p�ɇ�I� s(�}&���W
��hYR�{��^���Հ�W�e+ �pw��/Ҽ��kI��>;�A3�j}���0��i��,����L�c�8��=;������ �7�0@e;1�6 g��cy�]��{9��§b�~�4�aW��{�	3Fw�2D�����Z\����D۬.���7V�����ޱ�`����5��� Ǖ��*�����q��M���hf���5E��Λ�2�-=A���g�c٬��@� ���|v��M�c��Pn7U�`��!YY?��rH2��]�3�w��zs��>kG~��x��y�G�ޣ�}d����E�j� p/�W�8��ȥ�5T�yO$ˎXl�4�H2ٻ��j�+��7"0����e�*utB������͹��a�!�����n$3�?v}�ޟ�����0�I�l�`h���m�~x6�)�����la���\��u0���ç���FŐ��xX�+�0A�{�n�T����L�>&�T�ϳOg���sw��Q�v���5��t;�;�o�-'��z�S�y���YG�6`۬��t4��=ʷY��7u@�y1K�v���C������]Ui�np4W{E�^��7eq�8��/�_���A�	k�rT^@���f�Z��l�e��oL�Y�����s8a4,�h�!{y�ɱ�@o'����B}Ye4�	�4zB���p�M�>�v�3�n`�A����ERL�	�o�T���)i9TZ>��H�ʦլ�?�9t�����ŅK��@6���y8��u�kC���x*��sH2iR7��h�G�-����:)Y&�
LN�v�0���)ǀ����XdH��z>�e�-�m����w���l��G�����y -��qx���u��M��)�n�
�*,����m����.���0����g|:_���3����Qm��kX�W��}�o�Xuw�q�I�������n+c9��G6|���?�\WQiy: {#*�h�~��d��c�3�t�S�q�9v>�I�5*���P�E�#J_*.�o��
�r��WKs���$W>��2��Ձ�)�p"�5�Nd�zݤ�Fo���>��
a����tm�C�;����!r@�u&�3��A�L-6��B��(�fN��ayw`ʌD�L��VY?�&�4���������/��eɡ��K������Q��Og�3'�ri�vj�u{'��`�FP|F-^v��{���Ulܫ�T��A��m�ɻ��C�! }d#*�a������(��R�Pc�CT�1�c��'�`�����{�9�ͮ�/�@�	���? 6����vl	H�+Z�4���,������`�]�!��kݎ��C�lG:��2��?aGv�B_v�2@�%�B����s�ؕK?��,@Q��Q9+��=5��\�3�xb�x͌W�6�VF����0�ev.��\�?�jWY8<��\�Z&���Y� �t�=��'�] r�v����:�>���{Y�Q�IJ핸?'���A��� R�}I����W�������޸�h��������X�D�%�K�6`qc�;7���b������2.A�2�s���G���dj�c:����Z��M'D,��>Vp�T�p'*�	{#*��'�k[����xj��aд�Q�ee�ir2�������Nx���];eҾ]|,Fy���\`��2P2;6�(��?�CY��L?�fm�D^������?rd�h���Av�dp�8�/�B-��w>�LZ��X����� U�s�\m9:NG��/�c�Ϸ��5��s���Z�:�y�[�[M�J�6)S����k����С>�	C���&
y�FLL^� �[mJ	��� Mm]J	�M��\&�w�¢7�6�oC*xz(ڀ&t�/p.|���4$+��؍QI&]���|�c�꛵۱r��mu��x<��圼�����䨼�㞫`R��\Kr�\_-�	�|wUG!v(��=�I�rP#(��i
�4[l�Ծ5�6(�:j�9�W�v�������,��M���5�!��X\t:͵��LD�87;�=��F8d�x�DJ�#���w����!��GأQ�Gkُ�q`@z|�Qź���xT���ĝ��$S��v�K	i�6`hZ%�p�3A)"3��=�L�(	K���K�P��"y�H��Ϫ
�%�ld������wSo���~���cS`��v�w�P��j�j�\���=(���N�-�s.XZ(�
��rp��WeH���|0�捲:�$*_�C]����r��9���v�|����@�kF������~ϛZ���ю7�z2�� 0�����z���	7a��V9��O���7���9F�"��[Լ�v�珍��Q'1�Iۍ�{Yhw����_��)(�$����e�^��͹���7LW����|W��b�I���,I��	�JHBN};�]y��3ߕG�7�M�l8�e����Y�Yr�*aKeZP`$�)Ǉ��XB1u�_	��5E��Q ��
��CI,���%��I&��L�����N�jϧ��˺.v�8? ��&#ك�p���V�Mx8R&*N�O�}�Tn�7j���]܊�j�y���M4��*��|�f:Ue7�c7���p,�/<��M��K�xY��A(��ox�B�oŦ,��y�<e����H��&����}���J2T�J��%/�F�"�
���wG&
��C2Q��$Y�8�H���l����J�����(���@;˱?�-�I��6�#�A�h�f�J�#�H�\�C����-{��R�Y��U��֓�B�EP��<�Mf`��A��x�����C- ���p	�ur�g,l/���%W
%��K�L���N]=�#޸��v$=َ4� ���"���	�PH�ލg�`��nt�AR�T�w��ߞ���W.v���d?�O�V�R��[�C�5a��f�Ce��}"���b]��M�S�G$J���X���h2��v��F1���R�an?�O7���u���M}������Vq������ euW~>7'�d�n�	�ꞌ���#;�5k]bK�A�p�h,!�$gH��r�?W�m})2�Q�Zm�Cs��زő�ʽ/��������Ŋ���@�Խ7�!���S�xj�C    	pOR�Q�o}�ok��U��6S�L�I��i���/s��*��𰼃ӅV)���[8[h��ϒ#dt=��Gd�2a���?��1l)OQ(��)��l��������Q6�-�^\42M옌�Ef�6��WdfV��6��&���X�*3$
eTt!�p�)#��L.}�ό�C�\z4�!�K�S�p<�_%�)h�@�����Ƚ�]9�0��$�b5>�m]`c��? /O�إ���t�+4��ݖ�����j���r+�[�髭Bq$�o'3d��+�>J�5Z�0بH����6�<V��J�`�9�0��Љ}�D�*,n�52E�����i��L΄د��u��C;�9��y��F'�7G�]��+��ؾ#%� �{vv3�6�V�1�����pfQi��rך�G��Id=_A˭����������n�b.�){y6�#b��*w���-yJo�nGz'u��R�x�s�6p�i�,���K"ޣ1��TT�j���jYe�ȿO�#���ˑ����=gAfG1?�p.YV��ܱZ��Lm�9�K��ا�D&U=���]Q!�b���	G����I�2��"_�Md4D_�3`�)[NF�R���2�BP�4�=FX'��[�2��S%*h	�'�F�f�u��V;�9mvȇ_�*`���/|�B�eo�:�П�^�V����o�����y�mBxS�z���������;���U�7��37v�����Gg�v�;(̯ʥ'�o$���l>�MWӮ�I�մob�|5܁5��w�j���S	�V��1��f�3�\6������|>��1~�����7ʭ	Y�L�k��s���k�4��t�}�K�&��묁}qQ�L<�ɨ�4ߝT]���3���`u����9��Rӳ�����a��F�x:��V�X�Ų�%)sD�vF9,�kg�?P�\����&?a*���]z��Fڇpe��G!�s�����?��ix�ԟ�ö����Z�t�ʮ�����|dSl��妊"��ao#�F�%��ﺅ�"^�Ae��xu_�t��y�6[��l��y%�l���#a�π�\5� �jPt��q_�:]��x�e5T��ju�6��]���b_F���ū2W�/<qWjͩ����굁+�V~2������.qJh���K�^'"|������r'{���e���N����MrMCߔo���B��SF����h��˟�����|�𘂒�7�(�x�g��|�Py�j� t���~iՂ~�-��糹�J}���[��W:H�P����n�)-eeSYn�a�q��rᐱ�8UjdT�� _�oz������,���dꦞ��3��ƺY�YY#�7m>C�4�=hWS��dH@����v�����i�Iu9�,)D�J6C4"/�������a�ؾ�k?2L�D{�7���>�\�����x�n�`�;i��\>�ߏE���Q���VK����@B-�(9�ӍL�c�IT)�9�s���N�&j�3����Ӯ�ܡ?���px�0�����%�Ӷ��+{�9� 7�i��d]F�=I����P��8����q�/��V��I���]sb@X�n\V(�E�F�����5"����A<^kF0G�Ex��Nr�_{�;�����lDGZ�m�h�L�g}9=�5e�3.��K�}���`+P�2:<�i�g���s=���z�a�9S}��@��SS֨�T4�~��h�F���HY�
<�(�xe�C����������At�C��i@Ő$[�B�,-0�N`0D������N���n+���!�I�u�s`���:�8ފ��Q�E��nNMtxCc'���x2s?��4�X����)����Mux���[Gg���x6=F��t@-98��(�=��.l����5{�2�k{�$�Odu|����M�t��� Ī8�j�JJ��x��Ĺ.wu��h�u�M'	���;�G��p̖\-�=k�]L��d��Qq��L׍P�<�;,մ��zˡ��C�l-��bǷz���@o���>���'��t��`�3j�6`�@���2���۹@�{��C[g4�&c@*ɦLu�B\��N�E�u�
.�J��&)�(�F9L%P�{���7�s��� wma��+�k�[����~L�Źw�P{zIC���}��F_��n�������Z�#��jW�s�P�lG8�P�h_��[��=������C�iF��H
���u:ʗ򇬰���<;T:;ތt�l�2'����j?�͡,2�@��Y����6T���}�Ʉ͕mp�ayܹk?X�NC���r^-e�\UJ���л�LZW��'*��z]Uf J>�bs�k0i��<�}e-�������`��-��p�;����/Q�)qebI���?����1� �����`��U����QNr���)~�C��U��h��^kp4F$�t`�78fj}F䂗j�\HJ��ڝ� $͜M�������$���R�>U;�|�rk�^�h�M'�zw��Ł�N�N�[����S�(Q1���w{$����y�ם���~���Ņ�h����f����Zǥ�@���{��Xe���R��$�ډ�k��(�C��Bs Jf���rʥ��$�1cY�p� ��1H�9Xm�(���u�!�6���KBmZ���|���b�����DR��F9�ҦN�D�آb����(=�ФBI���sf�ߨ��-5A`<�܈�pi<����꧹&�b��kR*��36ZÑ��8A�ޭ峐]�C�e�F:T6V#�����F�2��s���~I�&>� MX���x����z)��2�Z/����R�\�0�-p7��ni��O7�e����YY�{b�>cc��ERR�M�X�$zӐ��;��*z�3Ӥ�����@�6�ͪXm�Cŧ/�o��7�(����*sh<�נ��\�u�l�NM�Ü�K��3;�����I��t<>s��^וL���n)N\�1䩸�"�f(��e�69C��Y��U�^n�.����P6�v�B�G�����wC�Q7\���GR�h�`Oj�O.�v�ײ��%��R&%���L���"&l�F��iF*&��x-ը�r������e��q�>���]�����HwER{+OEI}a<]�-Os�*��k1r4/���e�lM��7pl�??������k�!l������i��d:u5	�����aE�rIʡ������C(�S��l��?���Q�;���y���Vi��E��ᤜ�%Ep>B.w������O�Ja2ؓR�L���G�!�D)K"4��#��p�9��kS�#�)���.._��>��O��>qUT::N7��aIR�Q�<K���J����R�TV���*�3���*��wZ�d&�R��*Z��!�Y�Mo跶�?�-��7��A]����[�Z�d!�� ��7���Ǐ��r��,�a?h^C�p��e�I���ݰ	%����r�9��3��q��m?W�K6g�8�5��T��پA}��0��p:��������y_��S��0q�	Z#���7XYq�B����*��j=9�=]����4���1m�����g;-E6Lw�F;�&���]F衔���0��ګ���%���\�[a$�\�1�����4K��kFߜZ�5k=y�%�EC6i;WzA��o%�L��߈I�oUA9E�F%PxS�@��9ͭ��=���1t�X:���W9:2��ʕ}E+�reO������֗w%�~�6�.�V}�D��lT�0��AE�|tմ���	��l�P>��Ȁd��j�C��x�Pe�ઉ
��UH
$�P������"�7�|�b���'�X����񹺑�b]�,�˽��H�$O�}�,�Pl��Y;JN{�]m>�!�����:�|-N��Ƿ(|.>T8^E���˫�X�6r�T-<� �:mVF8�ٵeu��+D���G����6{�1Ic,?�+�z{_ϲ��e@�W�We�F��c<��K鋁�{<T�ur֚M��ԫ�_T]��hW%	�$    R�?~���S���D)�����$t�߽Ǣ;P}���S���k��Z�$˾�d�VʷLm�
4$Ԧ%H� �f��b_�i�`�l�uL�}��zE:�fb��w����zm@�k�ș�'����|%>�(��E��͉E�w��&/�}�k
c�i��,��s�ZS�GA�lE8*g�\���, ��f��b����c���q~@:���GD~��?EՔ�����2ْK���'��_y#��?H���hj�o��
��
���Q� ua��#,_���1��h[�2�XF/��O*~R/��h�`�xR����x���G����"jH0�:���Q:�A ���Mݬ7Uf "1�2"m�=vY��ȏ21�AP��8?H+�t�6p��>�U+?K!j����5v�r���(�F����ޟ�!�{���(�M�=�*
s�|J.(dq���F8����!�w"��K���y/�S�S��I�%�� �J�r���*ql0M�T�%,H�U&Nb���ʽ��|A��NOn��a�;�EU�h��� ���[�Fr~�� ����kʍl�0�[j�M��-j�:^�eRX�%5�]�s�����eH%���Y�T.vf���G���Ύ����M��C8��Q*s��R��w>��h�v;�����#�{�� ���	�cWE������<�����e����ȟ���c���1:"h>by��X�9l��p�/�}�)���{$��5vƬ�3����%Z~86�V"Y0L��/��t8��!H�@�I	���Ԋ�.��*M�6ת4I'���yمby�T+��*�](��K��F��� �ׇuF��.�f�F��|�&i�q��u|6�{u�XC<�ΐ���>��+eD����D���3�.�)�T��ּ������lG�$G���i>���赲_��i+���'�<�q�W�,���Q?���h�S�����Rއ ��X}��T���D�6�Ԛ�U8�Q3Q4�b��wk�&B�źS���X�<��x02و?wŪޞQ7i�@4�v���23�fp@e9n �A�(*Ma�z�0ҡ�����7u�A��@Qn�c�HM�>����=�Y�oi���30ݱD1w2q(a�{$�&���I���XڝN���;���i���Q�wW�O���i1G�ry�zc��I��	��/ñ���3��q.P�=&^��6��\��m{��R-7C�aXff�H�dY���Zu��xa��wE�n��,�e�6�F5$��6*�O�9�e�j��9�r^#^K�0�-�3���E�!����T~:E������V�����+�ꀔ��R�@�0��\�uZ��tŠ	�~�F�b���[�nvu��Ԃ�W�\�R-�������?Ɍ,�8�D��k&�bHaχsk=}��������j�*=��㠐�C�	@mR�Tz�Da��R���֯�+>�,�]�w�̐�R�7��d�w�zO��B��wPDvB�#�otTG�ޠ���r�=�Q�Ԏ����F����&{H�,���G���]n�(�2����!��r�;Χ��� K��������@�M=�~||C�T�+�F)2rL�t�l*�؟���Fv*�f�C�G���Ipo�G�����H_ V'z����b�?H^(�Mr���`t;b��A����@�����a0uab�PX+�Ns��n�M���c{W5�a������:��ft����t~/NTq�u��0UX�>AF˪�$A�̖b�$�e��V�MrЃ<R�{��y�~���ni��ܝv��I,�6��Z�c�O���Yc��r=�I�hrʷ��G| 4�N��͵Z�)2��p�)W��~N����a�q�)V9��ZT2%��D&^I��q�d����L7�ޗ5j��Ȼ���PK"����3���l~%e����ʥ�0�O�N^��=���n�����%y�S���:�x8x������Q(���d��\�H�w��b��4���d>�D.ԏu�cw��i��r~@:�I��,:���:R�[�Q���?�����0��z����ʫ�yu���S�+ȴ×��J�Y�+�ӥ�]v���/����@���ס�9����@R�/z:����r����fQ���l<5��Y����A�!]9�8��04�Q�s�LBk��n����o�`����?E'�~@$�y�4Շ�rʥ���E�ֻ̝g��5=s����6;y<�N� hvrT�@�����O�YOw�_��gM�F������(�{`ױ1�͏�s�b}�/]AIy*)󩜁r��q�d�'>Q?��¡�h}%�l�Ce�i �˶�5x�T-�ૐ4y[+k����jU�El�ưŦG������=?h��7l 55:6�>�޵�0�$ �,W}���{}�~�̡�*�PUF:T6MpL��2�ПZ�����j��Nc�v����#̴��x��V��L'T[q��� �A(���(�i����~�O'*�ܙ͕��ɜ�\B��v>Խ�bA��d�vF?x��LO2o}��uh����5��^���87�:���\rHV�D��J9$��ȡ��h�u��Q]�Xu!�v�V:p���\M
�����Ĵ��~�ڤ�Qk*s�R����4���(w��rY��3&��E-��|y��2��cra��¦��N4�LmG� ��+�$'�I�ֲ�]}^o2�`[(c���©n4`G�v]k����Z[oI) Z�P.,V쒶B�=֦/��e\~2������wH@U$����j�C�I	ᘭr [���9������c+iP�Pu�Ƭ��ҽ�����R �7�qKVˣM�I�{U;pM�@�KeH�	���ls
~�=��o�UJ�߷=)��D޲ّ��6��2PR�B��(�����'mvU�{*���|-�s�.;�	��;��n&�`<�p	��^^�C����n$z���l�},��|jʒ�Р�J*{&�I�U&9]�DUH���u	��I�C�H:���\��]��Z6����m��m:��*���<� �����4И�|�+:��A�V��r���L��'�E�e��-��7��1QYN&CD��:{#2Y'��P\���{gW}�0S���Ns�f��j�>����9�>��_���z�d����>xȵR�x#k�cہ��H�zSa^�=�k�|c�� �Q|#өoU�ͮ�E�rJe[B�.�L"e0�C�]f�j_��j{\Ew��vá㓄-��)\���J�;4^�e�3ڡщ��;�}z<B�n�N�Q��L���f_� $�w�!٬�}6�!Ɏ���i,Y�dj�Rm���c�+ ��X��#Mf�����k���o�рf��Z�S�$_-٬)�@o�U���ڹ����,���Y�FzK&.���ۑ�I�*wqx_ca��[��h��m�G3�o�P|�x�������n��<U+��;LZ��v�m>*�1
��h@�/�:�ff�>���(��O �m��o���2W�4�tR����h�[8DQ�B9�N_O��6;���J�C�͇c�������4G�������Y�!Y��.�F9$���fs�u�7�5�	�\���Ik\P�4C���\�d�3^��)�*���}�N���wO�R��pX�R�L"m��,�h�Ի��ݨ��
�f����v��k�5�謴A�7�؎�j:X�����h�o\�plT�O�h��H��LH(8U �N}�*c@*Y��#G�`��S�(4�N���� q3ԇc���g;�y�T�Q���H�������R<\��@^2��a
nH�5*i�:�Ϧ�~*ہ�tuS��5��'6?F�|[9.�O-ȾV�	�$�)q��!Ų^�T��b]j��fB6)$JK) �e+>N�Z�#����3_���q[bx��h�˽��;�m���O�T�$lC� [��k5�6�<��r[O�#͓K�d�+�7����č�_&����(��6��&��@P��t�;}��l2�M��qs���A dtT�@e���b�7=�+�nCY�n��k���ǔVi؀������F�HBͣ� D  w�CR�L.c�\\լ5tq��D�}���=�Y��4!����S�f�(��P(�-\����|!�"�
��ՙ?3�R�I9�|p��x�8���V|'�c�a�i�p�|���g���vZ��$��b�&�7�8��6]�*r+���8��̪���:����K7�~�����
gu���}7�Y�}q���зL����%�$���������h���縎�͡��_�*���A�@[ը��t~�,�����]�l�PmI��:](�F���w�E�Q?���0���'u���@�\����a���̾�c���Sm�N����	�aP���(�W�V�~V��{\���M��I��ǳ��֪aw�=l�9���{�^�<:�a\�(�i\��.x!���e�<Y�������vt���x:#]�ǝ�s#�Y;�,$�v
�aR�����<85����	��x?�ii�q��@Y�ivűH�.��К�Ŏ]�b,v�vz��\���N��i%���2�p7�ϧZ����hN�+�{�k�ş�(Sb�ʽ�6t�T��}�q~@:YNf�.�V����bxM���l�x4ڡѩ�o>VA����3/P�& �'��W�λ���z.0X�͓=���r�-^���8��ΙC��ݡ�"	�����h<��o�e�y�9l�PF8�:"F�|`���52�*^P�լ���rǊkB����6Z�>��}ݔ��D����Y֛�-�.���kFF����/R��<�&���diS��`ɹmZ>��[\�>A�mY�Y�a��H�Q$���!%)�$;y����S���������L[^M��6��DG�@RmWA_k���QN4Es����Ȏ�na�ߌu,��������kF���`h:���{9N�
�4�»�3)+�љ��Lr��#�Ć��8X0�F)��n���ϐ3�&�pХ��C㭫�na�C��'�("��M]Ρ�����C�w"i��({fh������*�v���%a��v�w:U-��t�W����-6 ϗ��q��N��s�a���`�t-�|8�}^K
�;TT}�t�l�>�s��-��s��V��Q���H��tO>q��,p !��B�>:i-��2��N�9���0�T(�=�m�2�Ww����^�Ԏ��Ģ�0�nE2=Or�-1�E�z#��;e�V�8���C�?�lxצ!v�����vx�O���~W�K� ;l�ӖFy�cI.K���i���i�Fc�Sl��>s���}+.LBq(����n�ҡPIƌ�F��@��6	�����/Kw��K���GÑ�ߔp��D��ǉ�s�o�2���;��(�Ӟ!�2��Z�(���)�?lV���v��`�f�̆�������+��.����y�m�7����8�]����~�k��;.jH��,���L2��?5���^��m侖l��9�q�F9L�y��H8�|Wp[$�yc�:�xy�'�u���聉4}�e�X���BMk��A�m?m:��,�@��j�'oA�D�jʧ��P�	���-�2��[m �+��2�SY1�eK_�I�_��G����1�@7n2��|��@Vt��>k�v��m�� �籾9m��
ݘ~%�.�m�ox��E�>C4��f;2q��'��)TK�L2��<��čB;�7e��A2Z]�c$ڹ��f��l��J��ԏ)҄�6��j`�|o�~r�g.� ���9�ƺ~ݕx��G��j�C�S�(��U�̯��Ěm�D+��h�]�L����ِ�>:[�[��#���H�ka�A��Dˆ��u��>��=v�4�ri7ڑ݊v�������d&�L���^�卦ӱU���y�����A���;���ב�B��KzH��@Pg��)��4�nGS	��J��ó�p����i����p�W��Qp;��>�ԾJP�i_���N�~���}�^É�0���txE�����z���u�օ{���a��>ʾ��e�f�Y0�ǖ��$�[�An"0�KJ����7�6`�s��O#�������E�����
4�/��aE���5ơ� 0<��� �2Uq?QF��J�F����u���@z��	�Z�4nsx&�V��WA�T{��0C9
>�nh^���F���>b#t�����(��"��G�9�F8��$fC6��H�[�!�O-�lO�/�H�S�7�%�?�e��wSiPѡ�X�F:T��r2�f��Z<V�L�R���=)��$k�hD�L�~2�����Ͻ��@K?�����Q��6�u���ԯ$��=@`�Ҕq~��.Gڗ����G����V��HV�oF9$����G&��nWe��B-���T�`�����Z�VQ� ��_��8��M��!��M��F
�����Mk����_���ޟ���P�쿄�H�ʆѻ{�,9I���
�I]�~a��P�Ը�i���/O\��$P���l�8��i"񼯉�i���9���*���Hf8�r��-�*�(�Q��d;�"C8���l����Q,��+	���Rj�I�݃�X���Ҩ� Z֎xG[�=َx#��ɏ�(.(a��l��ǘf�Ƅ�{
�G���ߏ��ț��v�wR������eq��5gL<�d�얄Zqw�|J�F����6X�sx0�Rۮ!�:��'�m����P�U����P'�G���M���hx#�G����u	q7V�����!d����V^���[ɣ��PNcQ	��ʢҝc2�Oq�e�\+���ZɎn��d2�k.�+`�4�ږ�d����֓i��p�e��,_ʰ�M"b�L��Lm�z<���cڮ^i�v;�B������R���J��MR&#��z�z���O�����t����b-)3��86���K��I`�����m����_鵁S�O���0{:�νw�;o *;�)�� L*�cV-�^pD4h���[l�$ԒHS���q���7�0v�#:�̟I>��$��5V2�^����:,N�h�ĳ�Sq`n��?k��ڀg�u��[}NX}����W�p&�y�����d
(ҁ�*��%�?��%�T��өs�'����<)��u��*3�:�2k1���,���g���9��BхN�v��_=ݎ�y�����*eMK�Q�]��d;�,�x�9��g)_0�K�DA0��N�Ec�(F&?FCY���� v�7|<�����Y�TkT�^��{�9S�G?zE�ً���u��p}�Wo����~�It�HoekB��v�w�2]h���ܯ�s)�<���������Z�����,�����:�M��Om�e�C��wC������&���Vl�o�TZ8��E�۬�(^�f�Z�:i$>�"M���3��:����oo�Q9�O�G�	�Tָ�Q�EΌ��Tn?Q�T���c�H��a��!#�$����Vu��屓��!ø[T�p�C1����@�lK8*g�\����}4�;�G��1��o�p8(c@���~`> 8!3���
��yu�T���$�;�zI��%����M9����Z�99Ճ8�9�<�����A,�=�B����<,��]�6���7d��M{n�}�짦���p�H��X?贿����/��� ����      l      x������ � �      q      x���I�-��ؾş ��.^/��PN�I_&3)B���}�����c����F~^�w��uT�?ه�~�2�G�[���*�U�?��U��?�������/�y������?����O�W��&�����s��_�J��������@�_�~����LT^i�SH:T����'T���Њ��'������0o��چ��O��+�����O�|��Ngo�s!oR;'�������V"~�@0���߫*�W<��������D�Y���Q�:�@ยw�'V�������������ߖ@c�� ����N9���
?v��Eo��=R����@e�m<}\V
7��2�X�ch�ҏ�׎ʏ��)�˨�;��A �6�Y�79hmBC���F��~��P�P�����q��dl�x�ZG�+��Ǒ�hk3���*����d��!t��+����o�g\
�5��� �s��?��տL���^�4��,D�:8P~A����q]ӥ/4|Y e��������쓋��+�1�q�+2��Fl3'�Z�������1`oh���o0�ϸ��E NE�%��t!@�~���d�Y-]���Q[$<^�[-]� D~����7�g�Z����&�E��7F���ؖ�`�ǑL��1ƈ��Z���Eᧇ8������WKW4�s4Mo����9iKW4����@�{hNs,�p���-��Q��������h[��R�KkKW0��0�q�E����`x��7��s�Gݖ�PT�+ۢ����c[��A7f��J���F(悰�K0��ro���;G�fY���tEsixm� Mh�W$?1ӑ�Y�.F����#d0����7�.���tV�ߠ|������̃��{`��a.���,��!;��j��\�裬\������g]tXY��i����ǆat���MQ�m��ċX,]В�q8�n�m}���c]�2�P���������M��@u�
�`$��ߑ.����]u�
{I��Y�Q��\8Q����I�&(3��і�~���%��=37�`����ҕ��OqI��BL�;;A�kKW4C37�&���
hu��@��If�mQ	���ۖ�h
�ֿ��OZ]����ğ�]4$�U���Jc Tg�{b&�,�<u�L����������w�R�I]���y�K���)~�>��?����������������_��?��������?������NO�<�k�����vݧ�?^�?����{"}�ə`\�6��~\��01�d����΄R�hnB�~V������'��r�hӅJ�@�+�X�`�� ��X<��)Yptm}�L�w�(xxζ�EW����4�.C(���d�#���3�A��#2oB������å�S!<��/?n<���Z},���$20qC�g�k��\���8��,���`����x���ރ9�<,tӠ�q��\�:"��+��4tߐ�nܳ��@vZ=~4��a��g-n9��쨊�����c�;�D�`M��`Ll/��/�!�����4�C��::k=�`Q4hR6�ox�=ADkC2P����{�g�3�Y��=ܪ>�|�cJ�eX�P�}�<z�v��cZ"��c���*��Q�_�>��)���!i(��x�Ni�0	��� �Ee�	:��@���wZ�U�Ns��W�8Y���}W���o��yIK��R��3��痨?�y�O������@�K��}%Op�'�L��ی
�3$�;Q]5�T���!����e��l�e���������<�j������W�SL�k������!F�/�yV��h�*U��B A����q�-4��ϰ���u��;�Ⱥ�t����m'F��H��Ԋ��a~�u�������܋b�9Fu0J����C��8��������]��R�!����ަ�7<B���ɿL��<���C��p��E���`Mg�t���;z�ȝG�C������,�0"��M$�;M��I |j�~ d3/C��8K:t�<TJ��n3�� 9~��D&;��a?�)�F��5���T���ҋ��U�̓GCt�Fű.���:�e�P�?AO�U<�Ytb8��}�Vɐ6 4�K�'�6v< ��,�H�a0��j���Q0�g��O����+�<pU&�t,���C�.Q�xC[��!x~��oT��o����ҷ�8	77����ߚ�hJ["�Too�0�\(�ѷ�WY,]�\����%,��p����׳���_��+���R;ۻ����08�v���T����K��u�Z۝��mZ�q	�[V()R�bp����n��!|m]��Rd�΄�E��Z��1 n�:��j�8!z֖.h����b�AU|�m��i �p�&}P����@А�'�_R�����,��N�V�@WKW^�D�t$P~=���n�[��R�-�<�"6^�e����1����6V�.��	��H��[i��ǔ��ז�p���z��x��<���r+��`[GI���|�-]�p����߄�V����+��B����M!G!��-]�
Jh{Q<�p�e�y����WI��ߘ��KW�H���h�i��+Z��Q��D�p�Ҍ�n��]��	$R��p�K Av�-�
�Q�m�
�b\�����末-]ࠄ�����N���:��ݗ�h@L�x�v� ��`���+Kxm�N�N�e-���$��t����:�hy����-4� N����y��EFxqm���(�T��h���եk2zI�N#��9�H�V�r4��wL
z�=��Ն~��XZuT�8�$5c���?����c����7�d�Bv&a;�d)В�ݫt����|;w���Y���2��,ܶs�N19תּ`}���,8��Ke� 0�X_o�8X~��55���)��m���=Y����>��P���wC�?�N�X��.��
Z[�4��m�1pm!]$��0+��v�U�c�����ԧ �@y>W}:bJ�ؚ���xp��;����?^������{�|Z^U�����������_��[p[���&� ���"�qrJ��K�-����f;6�N�۵��&E��{j"؎ӌA�g��3З����?���b? �d������@xU9��WMs���s~E�'��r?�Qk:�L?b�DX�(4�f2��#*�9��Ǜ?V�9��}��'����b+�G<<`Y�C����A��M��Q����g�ﱌQ�������˲��(�:-[<����4� �I���ǏO:Ff�������c�>3_���
ps���B�؞��3��p���((�2�f���&�?����S镌1�n3^o���+�� nJ����>!��A�,N���"�X��,d.�V�i�(J�:�܌����3ic;�}�u���A����,��`a�a/�u�k�Љ�������M^�p��0\hqF���u��b�z̭�^Fwҡ?�����F�\֝b�8�Sa7�S�)�tޙ.]۱PQ=��T�Tz�a01��Lt����f�S�WW5�lGA��S����&�܏/�Gm;��s1��\��|� A�Q��U���=�B1dX��� ]�&��te��3E�)e�����a+d�D�����a/����Ĝ
��P�]��6�s=y y^����h�>���0�����:�D���[�V�����.!# �#������9"�D��ƕ�������ϸQ4���PJ5�[�������Z�����=m��XKI��t%�����y�m[ZF�h����YZͫ� Ś��<�Hu�� Y	%+m�ꭓ̸�����6���i��ե��xEP����N tΪXx6��L�5e�=n�O�0��.2v@掗=�A�����8`�Ip���c4j@!��@S�.0�/�F�d`��&��Q�^-�ٌ�H����T��v�W;����(&	)m��n�^�Re�ĳ���$[n���nK�<v��	�;����    �*�Pw�����D�PV��g�lVs������Ѓ�.�� �a���#���5*>��(�z�0����^䣷���҉r;�Ot������rw��ԟ:�-�a�ᶫ�m27U/ڬ��cv)�bG�[`z߂�'�=40:5zj|Ѹ'������hK���j�19�YĽ��Qc�.��S*�N]zbvv��痆oJZ8�����b L��#���������&�835n���
�TG]���w�#7��5�>N�Ĵ��M��Y�Ұ/n\��͘���<f�Kuv�T 6Mu�
ӄo*�6��AȂR��TZ-�/����A��H�	��^��.0����@�|�=m{w�x��5���C��u&�F��bگ��vd�jE�̤��̒{S������L�7�ZMG|�K�,�k��@��
E���4���V֤�&�ly��w���ŋ���}7sԚ�������HJ��:�߱�d��i6�f����Yy�;M���')k���A-=[`KAL҆�COq	�67�$�{��_�c:��zv�caf�Ι2�c�����P��~`kR#����X��<{-_�&�6c)�f4x����a�U��a�(�k��f`����o��v�BW�I&��wYh���媰�ql��I�=��(Js_���ұ��nN9�T۹*dh6/<�=�$4�6?����{tl������3�X%c�so4;�8n�Mk�u`�A�澡�`�Qb�E8WgЌ��DUsЖڎ P�c����a��]�xSF?��W��?�.�+�s���zQȚ���&y�*X[���D�6�H���NHtBw�
�EPv�� �[ Yf������Q8av/��K���Q@���V���������=�ל{c�4���D �d�;��ő\��S�͕S�+����ZN��=�ZYTw@��.N�A^��,¶Դ�	�l;�5��'�i�/֥NN������	sl�1����	��R!H�������-�o!��h��@��G���P�O��*�a����F��ַ��zy��/V��(�I����bd-4�ωsmK����������\��ڽ��w �,*'tCس�e-_l詆Ѻ���	�HE&��8miHEW:��c9?�H��G��/}�Cfq����ԉ���1d_���!��
.U�sW%�oT]j;`����d��<=S�܎�k��Ö�Rå�ԥ��"kzun��-�nw@�,9y-����[�����q`�Ai3��Rd]jqU�)ކ �3�[�G���kx��0X*���RWO����khMJ�[x���!tZ�����Db�gm��$ck��-�x����CK9�A�!���f{l�f��<��-�/��XE��bi�2!�.��O|12Ԯ�G�=�Bm7o�%��G
\<���r�D~�J�^�C����a�&𪖖���䥲�z;�9���B��F���.Ϫ�kK�N�nJ�"���t斝a�T;5��znh�y�k�5��HA/Yf���x0���t������C1q	{=KT��g���G����7(H�`qRʤ܌p�umk�n�wz%/��>Ɣb�vU72�vtt�a�iZޔ��DwJ�v��g��ß6S�'ȏ��2\V�����'K�w7�����]V�?�}���㱤���f�Ŀ01�N���x,W'�V��0��p�K��f'���ˋ�P��|<����<�,�:��8
�{p����H�(�����m��4����eh�}z��tLgãeOZ2-q�����,�=�0�e���X*��#]�\�w�C�����҈����};S�%�Q��Y�����{�s��\�����45�N:�&=��3�tt���@t���x��bT��U�
W&��d����~������zsWo�=��Zp��dD����`Y��h29�N����vcNZʷ�ۉ/0/����a&s�vl��@������Yp�Իíĺֱ:���! �=s���۴!\g��y*��`C�C;� Ue�1����@k<��0^v�Ѡo<iK٭�؎giܔt$J~����N�i�j�6���� G�G��5{*!i����za2����Y�܂�!����:)YO򝦢�n��������'J�Ƀ�)� �]�׽p�=l<�n�������i��u;���i�*�"Y�v���N��AHPf"��5	ɤފ�}�ܑ��~�ڥ�۶�]
H��+�5��>	ȗ>r�,B+�����Y&����Tm�����`F6�Tc�'n�#�1,j�����)���K�����F�X��
�du$���'\08V఍_ǵ".t�13[�ŝ*6�����p�S���s��a�iv���U�-�xDܒ��ˎ;����R�dEX6�3[��4f[������}�M�a>�vڑ�Wsa���Rj������/��������������7������f��w�ډK�P��� q����V$u���6d�~���7S��aAN��)��D�n�I���C`g�8�Rgy6D�S�ϫn;е��o�U+���j"V&��i�e�@�u��D�.|Uy|%ejc���ཱ�|s�Lc�=����Q����:ݴ���p���l�N��,��	�]'I_�j�-&L*�q��H����!��[rY��K��2�Q�����x��֨��"�/�5�L��fp��.5�5)ʪ��cG�H�]z�ߝ���<��ye�[�;I�ؕ߃-���덋�j�DՍQ�X)k9�c�<_h� 9#����Xo.�f��V���)�����`Q7#���!>����+�#v�V�I3��Mw֚	gP����Uf1g.�t������.�ow��,�.�@�V%��Kː���+x�l�-��1,���p �����v �:����k5�M��ꊾU-�n�k�SB<�-�͛٬7>��&IxRH�<R�.��-�C3mP�,���cF�]����7�����z�6����OoKm�p<�O�X4�@�5-���$*�k�Q�,ism�m`�m/�C�1=�;�b>u���4_�-�Y��}w���P{�{�Py�RY��p�
�S��*8:0>y�&k����:-�';� O�'�Ȧt��#[�V�k�K�-0�a:�S�N�辗8I��˫c��b��'�P$A�>ƃ+{v����D������(�Z`��	T%���c��?��<���bk]�4狯n�8���_Y^���l����f���ɻ��DN]Z?t�tN#��}�'~y����=�-�G`%�؎2��R��2y��X�Z�qJ�s�ڲ����.(��mZ������T�z|Wx�k�
z������W���x�q����kK��-K�;fʮJ����%�8MX\�&odzٙ��[{�~����%��q���B)C�O{�k#��ҥ�u*���ޤ�Z-}�S����΢8�͜�3�֫��t��z%mK_g�+�C�0�XE���⏧�I*��K�~�e��	`{c5X�#��֥�]�h>�T�KXd2�g��׌%�.�w]�-�M�j���-�����r[yؤ���+�^;i��f8��,>�O�7��:�:F��9oiB-�j�[��}=�rϰ�WK�q�S[ݫs����v�"n��e��]f���7�d�0K�-]�ɹ�6'�Ԝ�cH�Ȁ=t��s����Cl<q��t�h��iK��ĵ39ճ����|�\��/&6M ���҅)��#K\��G�����wq�%s���[f�?�����2uէ���r��������-��>=�W��g��kvq����
�t�qC�����ӹ���vDqS�"+�*����(��F�܎e�J���7�|�ڤV�u���#�:yI��d9��f�I���6��@�;qVwj(~+
�ڞFB�:n	X�d�Q̶�:�iSؘ�ؐ=�a|=���jK`�x��\1o�"�E�f�pcZ�ZV�p��ڢ3�^�1��@]:�27���'��������NL�7L�牥e|Kbweʠ�����B��mi��A���.&10�S�IF��FTF�K�"�{��B��֓��z4X[���\A<��    ���g���A��ʨi&���OtQ���ᒓ��nP5�4M�����d�=�s�©R�"�k�ke�D�kR.�Q�����7"�N�Ӵ�E�a�'���vD9ґ��Ћ��i5�s�t��4<�Z2�o~*�#��7[�uq@o7�D�9{�E�N�Du@NC�V6d%ڐP$�4�H�0Gr$���;�^���FM[��&����(y����}��/��hY?k�;��9O�Yi�er�����}���98,K�#�;�5������
�.Ҿ#��;���ȃ���_���	ҋ�u�I�G����2:w̵g���ޱf|7�ͽ~>�Y,}G��L�����گCk�>��2~g���G�jZYV���\sf�K�����{��%+X9�]I��1�J�N���KN��9w�n/��xT�/`�rr��sp�l>� �`�
6C\nyA�:�!]��%��~��=�gؠ���ef����/90Z�L�'�K�J^��V�+X���[�	k�)%n����qVUm1�J�-U�e�/�.Ni	Y����q'伤����j��isS܈���p؝�t�x�-�"n���vE+��zh���<�x�Q�������=���D���Z>캰���V�q��B�pK?��@�ҏ{7��~���"*o�͗����ט���C�="n�>.",1�0���b��� ob����0�S����n+V���d[>��[ X�;p9�CTWv���4;���GA����2�0wחt�8�$z9�v���?W�ʰG���cqh[Ж��F?�ӆ�a��;��瑗+X��`�qFo�{�'=�UW���t[����S���.48C?�j�����o��Ք�I�!;�Ah[��j���1�t+괱B#ȶt��k:�VB"޶��R����Bv�3`
)�m�[�lm0
lW�ҋe����Q|�>����[���-G"{�m�W��E�6��=+<Js�'�}�ݦ�Ly�v���.~N}7K×��;&:��ꆕ\��r�j��˄5�γ+�R 	��"��|Ŀ��en��,�����Nh����Z�&�����;�n:���9;m�N�ɥc��wC�7�tqx.��#Z��� E��FLb����v�In����\�~QUP��ֲv[az߱�K~P�#�/�j9�}oܮ�
wR�UuN�W��ߎ��Ȃ�r�C~S�Ň*�]]�x|`s1,�����"�Y��u�L����J��6(��ﺉ�d�0|�b@���"7�g��V\���bL�J/�X5����p�}+�e}���t�z� *3��Z�Ĕ���D���K�&��?�.��l�����>2/ر�r�=����k�_������6��sƙz&�/ް'��Js/������?���?��c���l�E�������]�}$G߁��!0�В-����3�O���ՁKq��NB��M���F��k��/���G�����J[>,�mpf�#lL����嶂���c��
5/o4���qN��/`� �),^�VZ�5��v���S��`eB�Ǽǽ�\*��K���4�u�c`�����|I��I���u��y�%�����a�4E�e_����'A��t7�X��毎�x���L,�������g�ł*����j�Q����,����eY*f���c�$�S��_�U�/�.�;��������M�Z�X"��R���X�Nn�����z�0G�@��t���Pf��P\�R���oR�{�j�|Ck��k.�.�\��j}��*D��#q� �6�p���	6u\+U��*EG-�ɞ�Ҳ� S�������%^��*ǭ�Tfmh��J��7A� hu���kيOe����ܓ��^�A�j����=�L����/lN=�V����Ϳ�L���`��C�N�zK�N9K���U����g�ptg�6n˚��\N��j���)���e�3�'�~�oB��Җ%,�,i��0���sb�a�q�8\�Py�wfΕ�s�^\{�J��ݖ�Jk>��Z)rV�γ�5�l���o/�y�Ev�ߒ	>����`Dvrr�1��Cn��O�7Z�g��d�+Z�wZ� 8�yȪ�H�	"��.�.�)c1K`����צ˪w�N��i�F�9�Sj���~���O��X���ӥrQXzI� ��{j��IqbK��	D`��-�#�SG�/D&n�V䇩��a��)��=����u|���v9�gr钽�N݇W����6٭|E��;}u��P��*5(�Ԇb�@i�)K%�Tʽ8ِ:��Զ��b�b���}����b9�@��0�-U{ߤ�c���4��J��=Z)�n��-�\�-!������0�aӢY9,����)`���X6��,r��'m���r@�U'o���/��G���y�cPb�J3v��n�#�v)[N��ʄ]<W�.DߪΔ�P��g�FĞv��æ��@.�M��3,����V�cA�{�oB��JG�(��!���M��U�is��40a��i@���is4#�Pa���R'Y˜��	x�Opq�$*.��Ӧ2d-^�,�ذ����S�gצ�ޛ�K��.0��sͷ�4�Ɍ�������G�y-ro�����u0j�è�W�y���R��坎�}9��F��c�	������a����(��q��q-���<���� �l9����]�Y��0��*��ހ#��{r|.��3�'q��"C*<a�(�Q%p\WGI�(��po�6?���aJ�J���m<&~D��%�0�m7�å4�S�?�s-�3�ٯ|�c7x"10�:�R��1=��Ș���c&��y�Ȝ}<N�ƨBi�>e!<
�4*�?m;�g2�s},e&��dd��Z����\����̄d��1�J��1ܳ�gBF(��E�bhW������er
�gBB	wc;����I�1���}D���̄+����4ea����}Bf�A8���Ae|k����>��ܿ5W�D�K��Ӏۓ)'�d��<�Wo�p<u��;i��N�>����&���e�2f
�#]5l�s��;(K��l��B>�(�p�W;��K}������7T�VٿX�׍�3p���d��Ӌ��V�/��[���v�\$|={ڂ�i�^,�CБc�8tE�S���>W��Gh����!T���6l�N���TL�[[(U����.C�j��r��E+�6�x�xF���V��y�_�Q[?uI��mb�`6��èET��^72{f�=��D���8,g+��Pc��
�O�²�㖣�#l�!��X�Q�-�f��-O�6��E���UqSښh��c��!k�x$�T�-�
lg9hY�
���39�/c�wp�R:��+:"ǽ��,��r�|�D_��l��n�z+u�US��ݽ)�b�Q`d\�[�m�K�rx��,2n���-e��Y��ȳ+�ȭ,E�n8�Zx^۔'	��VL���%et�k�כ]�+�[���߼�������Wޑϑ���[��0Ĺ-]*����Yz{=�����Z��A�9���`�`w��y\SS�o,�0_��kt����F������yI�X��B�L���r��ϋ��;��*��ݶZ>�j�D�t��#��M�z�l��8:�ͻ� �������?XhU o��O��^8�*�1५_�Q��}r��^�G�G��옮��'ۏ�e���a}i�_�m�^�C�z(�ͷ�G�|l��8�"���%S��Xa�1}��KX�2��۔A{�-�R;��t�l�^��SԾ�N���8f)�v4��X�'n���)cO���tXE����c�9�[M}�u�&qn�.��I9&,q��ķZ�"t�0���e�Q���]9��x��0ƾ�c���H��o5Fب	J�a�՜�\G�;-S>��U}���X��9���s9�{�!���E�� �m�T��]�'�v��r^j�uld#f�u@�ڂE��cw�v܏PX0ͽ'�ОeL� �~�?],��gB��5�1��t�ら��Ll?�Cig3So�bzNn��5OǍ��M=�]�V��z޴z7�� �  La�r��3���=�0�6�bL��>�&�z7�O�a�>��^���0��>�E�ԓb�����u�,D8�EMw�t�,/+��N/I|�,i����<�:�d<s��#f�`6���J���sX:�7�Hùy-������A�D7�;�A����3l08O�"�p
~�Ά�!!��ݘ�1��La���[��j�s��mIq��uŨ�I%�;��'�O��<����$��8�`l����M`�F�1' ���@.�1T��C�Ȱ���MTrL_��"\_�T�o�Te�9�
D��U]L�겞�O�?L,|�f�Z�/��)Q&%81�"ԭړ��V����fn���;��|�����81�2v��Ι#�e���'�!�w��'Ǔ�䘔�ٙu�1��W���1�A�ud�5�ø1�4�m�5��P���vk�$9�f�եk����)�U����Y�
L�v������\x���(y6����j�hN��p��Ò>7��"%w'��{�%��Q�&*_ّ-�c P�0;����C�ӆJ����W��(��]�2�P�f5ly5�1��^M��j��H�����]V'�.�.�"F:���z����Vb�<���D]��Sn������o��lC�K��re��xZ�;:��=U4�4�r�d�/��+Bw#��i���a�q*ZRM�P=?����n��GN'�/�{�'�!�;��QH�@
�-��=�Њ�����d��4,�L�)��>�8=O��Ø��#�}�B��7�]����i#�G`_S}�հZ Wc�|Z��f�Oai�m>D\�>^xC�]!7�c��F�sӲ֞��j�Q��Ǘ�2�H��r�ЪGDd:x����؛���
X�ӠB	���r������Cz�־Vqv��ab���pBw�F9�����0�ԝ��(��l�B���e?:�<�^�q�����)V��%0u'�!8�3Z��A��63
����L��gN�<>Khh5z,m�_��'�� �Ŵw��S�­f���=7gO%��A��Õ�՝sF�<40�`Rx���<��<5>Txζ{p �S����ϟ�%V3d�#��~kJ�zz��F�o .��/��f�������%���t�9`S��y��8�� s��N���C�Zz4O���];�,��������	��b�кt��R��f��c!g�0ϲ.]��AՏo�0���.�3.��%��9 �??܉c@i��-]��1)�K��BR������5��kA򻨶���nW.Q�\�uf]���&�❱�g ����(Xp=���I���={̖�E�ճ}#r��c����8��[{HEr[[J}|�V��91�˚��\m[���ۮ���b)��8���5l4=�=[���Pg��OF;�pUd�ºƤ�c�m��!��m:srFm;��J^�b��j��IsK-�.`6��so�%)/�-]z�9_�gn���q۟ȓ?]qޘ�)�S;�$�8cc>�(�EĦp�zV�>����l�Tr� 	�)
L�(�a�J|+vZ�� 6[�i!�v�f��Ŧm)����Y��r�X��F�g��S�X굠�:�CMJu.�j���]�t;�J��vX����5�m�d*����[d�zT����h�u�߁�ڣ"�9��?��`Ʃ�-c2���fee;l{��|o��p�p����s��f�cu�����
+F�@(���N�����x5m�a��R�l���R��3���1���^٢��2�{z�F����o(�J��^�������Ao8�i��	�T/z�%��9���c4D_(ہ5gbwx ��i'���5�sy)Res���M�Y�(�Κ������c����ܱ9}d	�)D��m#K,�m�Y5�r�-K�y�>OSɤ[Ѷ���9�\^�Yl�V�g);x9m�
(M9��Z2��3��OXLMR����	��:qb� ���+B t��o.�f�X�p^l��	]��pt�v�P�` �e�eL���E�K{���x:�t�����n4B7
h�b	O8����gG�y�x6/6�B�p�y����p0��^�,-��M�sf���l�)���{J$��Ff��(&�w���b �uI�BMSNvà��	hb�\��RJ�hK�eS��	���Y���t�c>F���~:�!����vY�#�q^Nm��FS��z;Z3svl��a&�8u;�5�N���ܟ����]�J۹��i�6^��m4vHy�|7���>�(J^L,t�%�֩����k�:}�d�mEZ�����z[��{q�8U�l�}�@��ic�K3
��1��b�N���%�T�t�Xꊓ�	͙ )��!���O_�4��Xj;���z�4�ͷ�*?g�\Ii-4���(\a�9{���\���54�Q��n�`�
��o��A��t�?�z�˰6nu�-�:�N`��i���Z�䲀W#�^[F�u��[��t,���Fj�LVR����_�X�����d}X
�dP���r�*��%N9��(�lߎQ��ζ#�X@�2T���(����dE� �� ��Ja���n(͜r����ʖiJ�4�z�H{Ϸ���i��p��.��=��f����bƙ&��z;x�A.3#��{���N{N@���UG~3G�2We*(����-.�qY�%+<�f�Ju�R3=�y��h��{���|���8�����wK魔�γ�/J�Dy����c�hƐ�����*(�y�i.�Ph��^哚��ێg�{���paTlإ�ہ�A7`=�� �LKE�T!�*�lǀ(Ԡ��;ɖ����B�f�5M����q�d�F�e;e�"�����Tеp{>oG}�#���+'�I�]�U����/�I�����8��QR���,)�f>'��vv+X'�/cG<�q~�N�����ճ���p����z�ZBb��ᗕ����K��%$���1*��S��jV�WY,�rGK.��-��L�V�Z���
�X���@%61Eh��R)�s�nVE��H��e�?c�ӤW��d����R���cY�s&8��q�f/��P��쫺�7�md3J*nO��Q䱠�kϨ��������t|��'��F�YI�A��0�m�����0K�B�µ��t6t$��:'�A�O,�V����Y�N��Q��'~�}QE9�'��#E�nt�LME��4�����~Q���4DD��C}ܲbL�����WB��JI�P8�^�nڗԙ�N�7C*FN
Z,]�Wh�+MMĞ&����@�!��H?���GT��,+3���Hk�[��Y)��&�ǲ^-]���t��b�N��������r��h�Ι�b�#�ՒqiLl�S���elI����nO����r�D\c��1d8dW�9EY�_zz��^�S��\R��Dؤ�V�N�$��ؘ�%�A|����O����vm
��e��޼M_�:�x�8I�.��f��_�H�[L�n	t".쌽�5k�㊍�c~2n�N�{��&���'D��F�[��*Ϙ�)����nʸFm��9_&s��+�4�ɶ���F�[��s�8f����-��W�U�B�J�GX�����(����<=~,�Ceؐ�VC-a�mG�Z�	������V������jYIY�VI�T��!�6�S#��x�ښK�5���|[���z[{��G��dK�mA7p����_���!��       o   �   x�-��mB��b"����'�'���ӻrn!�m���~���i��E�����v��byN֨m�8"�۝���R�EZnz�b�Ч��3�ٙ����ٴ~0P%,�T'�!v���J�9	��Y1tao��3�%E0�      h     x�}��m�0�ge
/P�������C�MۃPA�%_~��l��)Db��� C���0D����y���	S50)L��d�p5A�Q��>r�kQ�`f���z:��7�;�]�yO����U�jOW�U�ZAc���	&0lHF��_j�2\�JI�%SJIɽ�N~ǭ�̝����9���)��$i�9� ��/�3��bO���P�h{��;�r�Z{TsGKv��K��5,Ek��(فq��.�eQ��&T�P��������{�W���.��x�NY��*�;/�ߣA� 9�C��I��V)��z��m�Ϡ.��S��ͤ���YϮ���2���B��q+xOiCg�󂷰�(D9<�c>M��%�j.���i�����ʭ��ӹH�5V#�T���6��.s2�g��-��G}��A��V�FO�5�7��(#��~����uo�zE=[��^"��I�4Tn����H�g ��R"Ջ�)+��7�� �j'Ί)K[g�3�Nr'��[�{*=]�?3}�_��������      u      x��[Q�$����>E_�"%QRbO0�b�;������^#��Jf�zz��cO���`�T��R�Y�tM-[J����?��������z��X{����Ф�Wj�������j�?�Hڒ�Q�
���h <�:h�)����y0���<z�՜�b���_I�x�=E�����ڨVSʩ��������?���?���_�G��__������gJ�R��m8 i�Y��!-��Mؾ�+^�%?�m���-��s�F.���#�Om�����L����).��(;�H���wK���a9�{���Zr������ ��G��z(�?4��{�3�����aC������J��@νex�h�]�l9��&K"-������8� �Lu�۸����
���#�
\�)cK�����RhD�m~��?,�d��bZҷ-ٲ{2-��Uxf+���*[{Y`,\H�}E�̂GCn�9��Pl�%�o[�u�2	��{O߶�s(㵇j��+=���	�8�j�K��Ora��M��V�i�g���j���^��T�H*7n��H�x0K����.��M�~Ef0m���������2��I�ׯ��0>10�il}�"��:��ƨ�]R��^�N����;�8>���F)v���	�$��Rw<9NA)���6��$��:��}��hz�[bz�\i�S�<S���
����q��ܿ��h�n���l8�]�2DSE��Q6Zzk�0�j��BB.���,t��gp�z�1qG�����'���Рb� �"�I�O$�֭��(F�3���i�FJ�O��W�}@,����mrI{�>���$l�o�@hZU�8�����c�ۨ��<�����3!��Y�&zt�=��򿱑/��k{Xǅ���jm�J���/<|�Q�In	G@����`_��|���!ui@�a�V�A���c������!�R�����\8���v�^�xPb�Zj&W<�<��d�l��@���ܿ"y���b�ϣ;��ڹ��(c�G�ǭ?@Fέ!7�UP�x�:$��`���L�@��Ry������[�1����b�m��Y�>���Ur�/�I��eSW��"���MoL�8�[����*��AJ1��Kرx�Cpr8�+_@:oy��G� ������A�����]N4/���Ýd�:3 � �a�9���?ppu�G"@���7T	���ǽ�~Y�s9�e�N/������g���0�zi�3�����7�A�}s�6�%�n�~��7��|��Y��g���
�f#�) �:��F�M�I ��{�	��B��� ��oȂȤrp�a�h,��8�F�~x`p�h-�C�|�,/
=]���eSrFn��L¯�s�o7���*}�X�t�\��e�~PD�'�^��(%����{p=�}�����E�1Q��#'�:]S���?�S�!� `Pខ������k�a=��/�D��C E|������X}��D�Q9��(���
�QU� �W�{�>�EU�
�1tpi�h_�\n��e�aA�1l�k+B/;%(r怆-����U%_��>Q�"���S=,�5>��©eA9˸=i�%�s�
�_
��{���L[w�q��������V����fC�/g���F���õ�q�c;�$,�0k�p�9�7���x�p�VO�J׷{]� ��~%9>�n�:�����}����si߄,�LՐ��Q��2]��\��B��A�j�mDkj�dЮ|̕���nÞRٛD��p.� �`A��61q��y�Q�[on���zV��m\�����]!H�i!��y�޺������1-��!��ڑ���9V'�N��y�(*�@�}�W��/���ړ~�C�̵��eGg4��1��Ck4�"�>�y���y�&IG ~��Z�K�`:/����1wW�r��.I��Q_�_�x ����l�.\EY�qF��I<����cP��}���˱}x^?S�FT�l�+<�����z�jC����r�v�����{P��N+�V�s���+|I���` =�8;w��>DCf�O�'7#nqN(xG�H݃�JDѠԋT�X�) ����y��c�t��$6�������F�G������������o�Z�{��|�
������Yj�,-P�VV9f�8�)wJ�5�b��Kb��r	z�����2��j	K���6X?-� l$�
�+�����`]m�0�I�M�S^����
ч�)má�X����Qx�~�ė#g�-	c�����}7�l���,�D�o0�^PLδ~ RV���K�L6��#Ye2���^!�B�����������k�6�xd;�L�zJ�Q�/����X� ��IT���a�<.'��1]8�B���+�
����(�?�D�;j,�(�y���\�.�6R�;��r�?�Z�[��Tn �&E��}�]D�xDj.�tH�I��2�J�b}��\�Cp6������	Rk��� ˌ:�OK<��,sක���O��#������Q3�Ƃ�T�l��>#�>=��v8@��e�d�搱f��Y*�ţ�G����<9�jޙ+����*�Jِ�� �D�]o�����܉��b�.ԽI�V��Q>��?���a���K�@��`�q�聟
M`5Q�k����S�A:��r�J�:.��������L�Ķ�m��͋H��/�N��0���Y���2��]jU�ġ�/���)���+���2���Ɠw�H��<z�S����[�Q�p^[qtE�V�[�RE�OE���ul=� c�p��]z{�9�j �q�wI��-�&�IH��'��y�6a�tfs���g�8/��o�hn�7`)�?�C��!������� ����K��S<t��&��� 7�5^]�7�J�o�n'QYᇲ��g8tzf�%E���?y�������T�L\8v��"��u(�T�_PoU��>�x�Q:�9X���H���L�ъ�J�>]�٤E؎��R<������}�gH�VC&� �
;�/�~�{^~ͻ�x��
'�kd��=��9o����تr������!
�Ń��/�q�C�D�g���him �,iF��AK�/���)�
ϩVN�O �0��Ջ���w�N����cRC���y|� ��(I[�to��E�/���g��� ��W�N%��rEv���|o�VRPv��+"�f��})]��9c� ��;�(Y��q�*A �X׻�K�U�Q��� �=ȼc9�x>2�IPk�?g���'~�x~��E�v��փ�\�7�����`#�H�����^�;	4���e8��y����V2���QQluC��η��?:�C��T&��� �<�p�-�WV^�,9[Qq6Q�ϼ�3���3$<N�� �z�9ϥc ��߶2Ѡ�|K��د�V�3�,�<�f�=#@��Z_���P���+���dՇ�z���ߐ������fϜ����@#�L��ʤ�n�l4�=�����`�b@�/�Ϡ�>���z�lن����
�5J��5���@S�������u̸1𚟠��Wvt�F������iS�_-������5�����Dy�>׆_�+z?}��*B�C�:�2=��r��x�A/��8����8�H��0��՝�u����bw4\b�Ty��U�,� ���:_ަ)ĳ^�n�o��E���|ea����㦜K�ݞ�i�u�m]�;�b������61�Oٻ� x>hS��8��fͥ[%�,��:>q����c�:��c�VS\�#����`��3�G�+�[�}c`�U�?�c��`n��yb��X��q����؟��p�ۃ3������l:��B��	�9u��9��4�����!x:�|���eo�Y��J}���>���g h>m���ε�x�~��Ԅ���5�\�P�u��y����OSs��_��V���h�����$�]�Q��:�oUW:��|§E��1�Na�_����:`���ٜ���J�����b��>e�ru��T��A� o  ���g{��xv�y������+�ӱk�_��1�kN�����&�,u�\2�o��Wr�p�R�S��R��z "P��ϵ��'�}-(����.����+����_F��sI�
^m�!y#�Δ��-q<��;>��%�3!���*�����3�S��+ ?1n���j뒺u�u'�_Z��%�hTܗ���4��<c'���dK5;�/C
�
�<���#N[�qu%��Z/���M������u�T�B.-��k^�� v�}��>����=Z�.��ڋ�z�q|P�|A�p<���[�w�������^|х�S�D��۟��~���˸|���^C&q2{X��0��X>�A��L|X`�i�_e��'�^�~�\�4�������ΦkX��S7�"�pY�C|^�m��]B�O��!�U)��� ��f�����?��5Q�w��ƷQ{(��7=�� ��A=�W*zy�铖9�\�y}���h�qK���1�Wߏ�V?��?й�uU$�)���Q�����j�ҷ?�َ+�%�@�o�*�җL��'�K<�^���E��Ǎy���f��8x�~i���۠B�$��L��[��~�Nq<��h����y��gaY��c�����m�e�
c��P���7$p�=�gcW`��ʑ�Sߠ�'>�]R%[|�4Ǎ��a�géq�;g�!�R���x>G7�K	�c�p|��$���q�W�|�Yǥ��� j_�s����{�����Q�Av"�G��~����s䛰4J�
d��A��.ʁ����m�_�0C�
��Ŏ�ް%z(�7������}�|��Y<*	��7���P����G��%¡���S�l�'6�^��z_������k��^v�n�m�Yz_���`����:�}��_�Bgb;qZ��W��G�>�
��VuJ��B$��Փ?qq�7x\ {4���S������e�����.����e��|`�
i�B����+����#{|�u��g�^���(p:fa�81r��#����{+��4^��V�Ƨ��7�����qos<#Bd�u����%��-2N��s��T�񩎺xO��<,�xl�o�<�\��<�~%�;���Ǐ�@ф!      b   �   x�%ɱ�0 й�
VH��]S&'��htbpii���D��k���lN����r,ڝs�⚦=���z��B�J@%� ۠m@���a�ے�He��������ڟJ��}g�uA��D+��ZRS���t@F{m���?j����/C     