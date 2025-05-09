PGDMP      	                }            chat_alumno    16.8    16.8 A    j           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            k           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            l           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            m           1262    25113    chat_alumno    DATABASE        CREATE DATABASE chat_alumno WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE chat_alumno;
                postgres    false            �            1259    25515    calificacion    TABLE       CREATE TABLE public.calificacion (
    id integer NOT NULL,
    tarea_id integer NOT NULL,
    usuario_id integer NOT NULL,
    archivo character varying(255) NOT NULL,
    calificacion numeric(4,2),
    created_at timestamp without time zone DEFAULT now()
);
     DROP TABLE public.calificacion;
       public         heap    postgres    false            �            1259    25514    calificacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.calificacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.calificacion_id_seq;
       public          postgres    false    226            n           0    0    calificacion_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.calificacion_id_seq OWNED BY public.calificacion.id;
          public          postgres    false    225            �            1259    25466    clases    TABLE     �   CREATE TABLE public.clases (
    id integer NOT NULL,
    materia character varying(255) NOT NULL,
    creador_id integer NOT NULL,
    contrasena character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.clases;
       public         heap    postgres    false            �            1259    25465    clases_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.clases_id_seq;
       public          postgres    false    222            o           0    0    clases_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.clases_id_seq OWNED BY public.clases.id;
          public          postgres    false    221            �            1259    25559    class_enrollments    TABLE     �   CREATE TABLE public.class_enrollments (
    id integer NOT NULL,
    class_id integer NOT NULL,
    user_id integer NOT NULL,
    role character varying(50) DEFAULT 'student'::character varying,
    created_at timestamp without time zone DEFAULT now()
);
 %   DROP TABLE public.class_enrollments;
       public         heap    postgres    false            �            1259    25558    class_enrollments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.class_enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.class_enrollments_id_seq;
       public          postgres    false    228            p           0    0    class_enrollments_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.class_enrollments_id_seq OWNED BY public.class_enrollments.id;
          public          postgres    false    227            �            1259    25155    jobs    TABLE       CREATE TABLE public.jobs (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    salary character varying(100),
    location character varying(255),
    requirements text,
    schedule character varying(100),
    contract_type character varying(100)
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    25160    jobs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          postgres    false    215            q           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          postgres    false    216            �            1259    25317    mensaje    TABLE     5  CREATE TABLE public.mensaje (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    recipient_id integer NOT NULL,
    content text NOT NULL,
    tipo character varying(50) DEFAULT 'normal'::character varying,
    created_at timestamp without time zone DEFAULT now(),
    seen boolean DEFAULT false
);
    DROP TABLE public.mensaje;
       public         heap    postgres    false            �            1259    25316    mensaje_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mensaje_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.mensaje_id_seq;
       public          postgres    false    220            r           0    0    mensaje_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.mensaje_id_seq OWNED BY public.mensaje.id;
          public          postgres    false    219            �            1259    25481    tareas    TABLE        CREATE TABLE public.tareas (
    id integer NOT NULL,
    clase_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text,
    created_at timestamp without time zone DEFAULT now(),
    vencimiento timestamp without time zone
);
    DROP TABLE public.tareas;
       public         heap    postgres    false            �            1259    25480    tareas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tareas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tareas_id_seq;
       public          postgres    false    224            s           0    0    tareas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tareas_id_seq OWNED BY public.tareas.id;
          public          postgres    false    223            �            1259    25168    users    TABLE     T  CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    rol character varying(50) DEFAULT 'usuario'::character varying,
    nombre character varying(255),
    active boolean DEFAULT false,
    last_active timestamp without time zone DEFAULT now()
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    25174    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217            t           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    218            �           2604    25518    calificacion id    DEFAULT     r   ALTER TABLE ONLY public.calificacion ALTER COLUMN id SET DEFAULT nextval('public.calificacion_id_seq'::regclass);
 >   ALTER TABLE public.calificacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    25469 	   clases id    DEFAULT     f   ALTER TABLE ONLY public.clases ALTER COLUMN id SET DEFAULT nextval('public.clases_id_seq'::regclass);
 8   ALTER TABLE public.clases ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    25562    class_enrollments id    DEFAULT     |   ALTER TABLE ONLY public.class_enrollments ALTER COLUMN id SET DEFAULT nextval('public.class_enrollments_id_seq'::regclass);
 C   ALTER TABLE public.class_enrollments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    25252    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    25320 
   mensaje id    DEFAULT     h   ALTER TABLE ONLY public.mensaje ALTER COLUMN id SET DEFAULT nextval('public.mensaje_id_seq'::regclass);
 9   ALTER TABLE public.mensaje ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    25484 	   tareas id    DEFAULT     f   ALTER TABLE ONLY public.tareas ALTER COLUMN id SET DEFAULT nextval('public.tareas_id_seq'::regclass);
 8   ALTER TABLE public.tareas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    25254    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            e          0    25515    calificacion 
   TABLE DATA           c   COPY public.calificacion (id, tarea_id, usuario_id, archivo, calificacion, created_at) FROM stdin;
    public          postgres    false    226    M       a          0    25466    clases 
   TABLE DATA           Q   COPY public.clases (id, materia, creador_id, contrasena, created_at) FROM stdin;
    public          postgres    false    222   'N       g          0    25559    class_enrollments 
   TABLE DATA           T   COPY public.class_enrollments (id, class_id, user_id, role, created_at) FROM stdin;
    public          postgres    false    228   O       Z          0    25155    jobs 
   TABLE DATA           b   COPY public.jobs (id, title, salary, location, requirements, schedule, contract_type) FROM stdin;
    public          postgres    false    215   �O       _          0    25317    mensaje 
   TABLE DATA           _   COPY public.mensaje (id, sender_id, recipient_id, content, tipo, created_at, seen) FROM stdin;
    public          postgres    false    220   �S       c          0    25481    tareas 
   TABLE DATA           \   COPY public.tareas (id, clase_id, nombre, descripcion, created_at, vencimiento) FROM stdin;
    public          postgres    false    224   T       \          0    25168    users 
   TABLE DATA           V   COPY public.users (id, email, password, rol, nombre, active, last_active) FROM stdin;
    public          postgres    false    217   �V       u           0    0    calificacion_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.calificacion_id_seq', 10, true);
          public          postgres    false    225            v           0    0    clases_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.clases_id_seq', 5, true);
          public          postgres    false    221            w           0    0    class_enrollments_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.class_enrollments_id_seq', 9, true);
          public          postgres    false    227            x           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 15, true);
          public          postgres    false    216            y           0    0    mensaje_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.mensaje_id_seq', 1, false);
          public          postgres    false    219            z           0    0    tareas_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tareas_id_seq', 6, true);
          public          postgres    false    223            {           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public          postgres    false    218            �           2606    25521    calificacion calificacion_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.calificacion
    ADD CONSTRAINT calificacion_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.calificacion DROP CONSTRAINT calificacion_pkey;
       public            postgres    false    226            �           2606    25474    clases clases_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.clases DROP CONSTRAINT clases_pkey;
       public            postgres    false    222            �           2606    25568 8   class_enrollments class_enrollments_class_id_user_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.class_enrollments
    ADD CONSTRAINT class_enrollments_class_id_user_id_key UNIQUE (class_id, user_id);
 b   ALTER TABLE ONLY public.class_enrollments DROP CONSTRAINT class_enrollments_class_id_user_id_key;
       public            postgres    false    228    228            �           2606    25566 (   class_enrollments class_enrollments_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.class_enrollments
    ADD CONSTRAINT class_enrollments_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.class_enrollments DROP CONSTRAINT class_enrollments_pkey;
       public            postgres    false    228            �           2606    25179    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    215            �           2606    25327    mensaje mensaje_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.mensaje DROP CONSTRAINT mensaje_pkey;
       public            postgres    false    220            �           2606    25489    tareas tareas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tareas
    ADD CONSTRAINT tareas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tareas DROP CONSTRAINT tareas_pkey;
       public            postgres    false    224            �           2606    25183    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    217            �           2606    25185    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            �           1259    25414    idx_mensaje_seen    INDEX     D   CREATE INDEX idx_mensaje_seen ON public.mensaje USING btree (seen);
 $   DROP INDEX public.idx_mensaje_seen;
       public            postgres    false    220            �           1259    25413    idx_users_active    INDEX     D   CREATE INDEX idx_users_active ON public.users USING btree (active);
 $   DROP INDEX public.idx_users_active;
       public            postgres    false    217            �           2606    25522 '   calificacion calificacion_tarea_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificacion
    ADD CONSTRAINT calificacion_tarea_id_fkey FOREIGN KEY (tarea_id) REFERENCES public.tareas(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.calificacion DROP CONSTRAINT calificacion_tarea_id_fkey;
       public          postgres    false    4796    224    226            �           2606    25527 )   calificacion calificacion_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificacion
    ADD CONSTRAINT calificacion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.users(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.calificacion DROP CONSTRAINT calificacion_usuario_id_fkey;
       public          postgres    false    217    4789    226            �           2606    25475    clases clases_creador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_creador_id_fkey FOREIGN KEY (creador_id) REFERENCES public.users(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.clases DROP CONSTRAINT clases_creador_id_fkey;
       public          postgres    false    222    4789    217            �           2606    25569 1   class_enrollments class_enrollments_class_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_enrollments
    ADD CONSTRAINT class_enrollments_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.clases(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.class_enrollments DROP CONSTRAINT class_enrollments_class_id_fkey;
       public          postgres    false    222    228    4794            �           2606    25574 0   class_enrollments class_enrollments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_enrollments
    ADD CONSTRAINT class_enrollments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.class_enrollments DROP CONSTRAINT class_enrollments_user_id_fkey;
       public          postgres    false    4789    217    228            �           2606    25333 !   mensaje mensaje_recipient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.mensaje DROP CONSTRAINT mensaje_recipient_id_fkey;
       public          postgres    false    220    217    4789            �           2606    25328    mensaje mensaje_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.mensaje DROP CONSTRAINT mensaje_sender_id_fkey;
       public          postgres    false    220    217    4789            �           2606    25490    tareas tareas_clase_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tareas
    ADD CONSTRAINT tareas_clase_id_fkey FOREIGN KEY (clase_id) REFERENCES public.clases(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.tareas DROP CONSTRAINT tareas_clase_id_fkey;
       public          postgres    false    222    224    4794            e   �   x���=n�0Fg��@���-c��]j�	�ب��W
�7;���鑔3ֈyLØ��i^n��߫���>��|��JH�@����Ր�#�E��؟�v����D$2�wEJYMT;�$�{. �(���!	����F*H�/Ff#�U;��BT���QZ%��<oS9`?sJ0k�������r��-s���yx��#N݇i^�'�� �����I�&�@ew$�6%���X�d�ik�����c�A �T�      a   �   x�m�1j1�zt
]�BIVF]�&�&�I�fX#�� Ɇ�6>C���ڄK�)����x�N�瑛|�p��=70�j�pm7��Pt�W�!	�]Ne�}�~�|L7�:�]cѩ@�	�����T3���/�6>�����E�UD�9#��,?�{�����Wn�
=.^xx�ӡ��<�4_������ɠ]c�V:�A|(!�;wS�      g   �   x�}�1�0���>��<ۉ��� ���.��	��E^?�z.T�]��m#(bQ[�S��1"ĭe&�p�l�%�`#�p���&5���N~��$�+�A1{�,��|���2z<_�u{���Q���k�F�7!R:2���?�piH���D�j���Y���'K�      Z   $  x��VMs"7=�_��]5łm6I�D��8e6Ύw�C.���5�D��������?�?��| ���C.0���~OO�e�����u��К�9�{v�iw:6锌���`���c�N�
8��Jl���Dy�G��s�\Bn=?����3ZE߇��bn��6Y|�O���ٍ�4�\�4Ӵ��Z�;���H+��m��L���?)m�L���
�o�jk`��2Y�R���+e�ǈ;�s�a�S��w�ztS�С���Z���Q)�%G������{�u��4mP�BO�q�D�t���ւY<Q�Z�3��6��{=�'�D<�w6���sP��2~�|A@�U�l�R�
�;~��Q�4�s��������P�u�.�Q&����1W&���4;��#i���TqH��g��aP�����F7˕ &0RZI�����Ka��1QP�Tq�SB=6P	C�ϧ�w�.�Q�%�lP��^�2���*I)$���I��Ҏ���g¡�
V�G7Q�/s����o�ܒՒ��{F��)D���u�SB�j�������JH�\�������dǴ�������n_�Q��Bl�|��.oX�� Ʃ"�}t�h����	8� 	���<<F�
��f	v�I��w�kD���gvi4
]]B�9��u��n��Sư� �-S��XI���4��#L��I�!.Ga�\���΀߯�_^��#��
��������hY�
��`x���5�R޾�2"N�a*d��ЪL�V �{I� 	����L�^%]�uݿ��C��]e]ڍ�m04��M�Y�<hr�2�U%뾄�*+�ز�g5m�gǌ"���T�j��cR��l{�\���̃�p
�X����˗�rW��ĔtY�������l�)7u�Hz�V�'����\��Aި����U�O�8��Vb�T��1�����PE�`[�w���E����1PB���k�����Os��O���p�'}�-�hd�|434̕'~���TPv�D�Bsa�wTx���&H�5�M=���
H_rGl���5an�/ߗ['�<s��[���d8�      _      x������ � �      c   i  x�m�=r�0�k�8���h�s2N�.I�f	�4Ȁ � 5���e
U9/�E������=�i�F��Ú@<���B�OtV��F�J*�D�ZhU��+1�M#�H�$p��[r��"��
4�8ʒ�\&�2�D���&��Z�Iu)��TJ�EƢ>�
�k+�����Eudk�-MBM��ʨ���Ǘ�;�f�����z���I���9��V�c�� t����7�כd'U��빴:��E��m��pdW���1X=�v��[B=��
i����ǘ�Pz�8�H��l.Wz�βyDb�Ot�Y \|�����IRܟ�(��zF)�,z|�T�Ə��.��ĉ���jq�&���(�`������ C�� ���P[���L��Z�9Z���^�!l푃��L6�*N�t��˅+S2̓٣�j7��o����;�)zt�oԉ�S��Ph�Z�9�kqʍ�50\�}�1��U�p�Pmg�C�H�	�����!��+�^^tؗ�Cco�R��iVV�\�f�c}'{`W����VI;��*�s��!��o��\���N��T��,Kh�p�Y|p�[��e<F�?�� ���������@j�|��qZe��;�#��W�X,��C�"      \     x�e�Mo�0 ���Wx�j�/@=mʀ1����,�ЭE[�ȯ������^��� NF���>-J�[����!FC��Qܭ�Gm��NA�e�[5�rU������%v�n=+`�IUQ�Hj�7� �*��G)�U {�舐�L�x�\�L%�2R��s��Z3��9�W���׍4��s��yn�;���R�׈/�7E���ܨ}�u6dc�v�E��Tu�u��$o�/�1%H�?��\��v���BčLN4��������Q{n��́aD��-����v�     