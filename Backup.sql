PGDMP         0                {            Shop    15.2    15.2 5    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    16440    Shop    DATABASE     z   CREATE DATABASE "Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1252';
    DROP DATABASE "Shop";
                postgres    false            �            1259    16442    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16441    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            9           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    16449    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    16448    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            :           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    16456    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16455    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    219            ;           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    218            �            1259    16463    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    16462    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    221            <           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    220            �            1259    16472    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16482    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    16481    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    225            =           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    224            �            1259    16471    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    223            >           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    222            ~           2604    16445    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                       2604    16452    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16459 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    16466 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16475 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    16485    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            (          0    16442    category 
   TABLE DATA           ,   COPY public.category (id, name) FROM stdin;
    public          postgres    false    215   #;       *          0    16449    image 
   TABLE DATA           :   COPY public.image (id, file_name, product_id) FROM stdin;
    public          postgres    false    217   {;       ,          0    16456    orders 
   TABLE DATA           d   COPY public.orders (id, count, date_time, number, price, status, person_id, product_id) FROM stdin;
    public          postgres    false    219   Q>       .          0    16463    person 
   TABLE DATA           ;   COPY public.person (id, login, password, role) FROM stdin;
    public          postgres    false    221   �?       0          0    16472    product 
   TABLE DATA           k   COPY public.product (id, date_time, description, price, seller, title, warehouse, category_id) FROM stdin;
    public          postgres    false    223   YA       2          0    16482    product_cart 
   TABLE DATA           A   COPY public.product_cart (id, person_id, product_id) FROM stdin;
    public          postgres    false    225   eI       ?           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            @           0    0    image_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.image_id_seq', 115, true);
          public          postgres    false    216            A           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 13, true);
          public          postgres    false    218            B           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 8, true);
          public          postgres    false    220            C           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 24, true);
          public          postgres    false    224            D           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 23, true);
          public          postgres    false    222            �           2606    16447    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    16454    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    217            �           2606    16461    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    219            �           2606    16470    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    221            �           2606    16487    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    225            �           2606    16480    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    223            �           2606    16489 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    223            �           2606    16495 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    219    221    3212            �           2606    16505 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    223    3206    215            �           2606    16500 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    3214    219    223            �           2606    16490 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    217    3214    223            �           2606    16515 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    225    223    3214            �           2606    16510 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    221    225    3212            (   H   x�3�0����x��.#�/l���bӅ �{���;��9/L���b#P��/l��p��+F��� ��(�      *   �  x�E���$7��]�X7[�f��
��@H&y�}��44�W������FXUd �R���/���[V�����x���_ۭ�2x�zp���D;��6���i���.d�5����M̕�;8b�0�6g�:�@|�Qz�~*P��0}0�Fn}L�i$od�,	�����f�R��A'Ɯ�\I/�e���g���A$p5�V}�vz������w�fT��h�6t�̤�b�X�����х�,'WZ�d�9��d�m"�P��I�I��l�4˂[�ej�0GV�Ʌ��|X�tؓ3=��s�^�X�O�o4��8M"�b��[��#�[�:������\��A%#��w]�_M�S�T�:�SM^�.��=��F`$��a���Y�m��o���I��\gv�8C�����o&�2�b6��X2ů��e9��n5Π�7��
��r �9���u`����<u�O���(Y/��� e��͚�x�^�S)'�œчY�s�� ,���Pm�Z��Њ���?lޞ%�[�c�dO���	���طؓ�Ű����A9Tχeˀ�+AO�o�����ð��~"�\����&���0��Tz�q����񎄓QqYDk�,���%򧡺*/S|2�0.|���=�va�v�Y�6#���͏�1ϫy(W���ͼ̀;��_�2�0-M��R8��-ǽ9� �'xy1}�?���'��a�      ,   )  x����i�0�\EX���w-�H��	��� $�>fI�R�2�@��mcY3Hj�q��D4$��cc 9%[`�E2s*��w\&�|���u�ߠ n̛��¥��2&������d��!C�YH���������3�UX���ϓ��W�D��a����b:̎���`tc�Nͣ��Y�����<��|!���F�	�~=J�~̛+��������}.a��|~�#�����^د���sS\]�CJ��ثL�P��:���5�v��$qMB|��������qu�\�e��      .   �  x�M���jP ��㺎���a	K�
i�������{�qϼ/�jk\Q����6?w�Sc06��N.�,��-:�s��NT\Y�K�����>֞A$+h�ǿ6:�5��Y���zCp0lo���ۍ���>��<��筚�Ё�%��Qx���K�
�̔GϞ�"}z�;��G�)�
�'~��E�K�mS.���{w��Jn��c'���b_�L���U��͉o�Cl�,�=xQ'�� ���޽�;,8n⸙�<���٬}Y5�l 5;&Tr���Nekwd���=�ӐH��<��O󿮈�SֽVc��;̣G��$'�*����NR�Sy��0q��iћm��_oF\���
a�s>�&�N굁t�ڲ��u�hL�M�n;q�̹��Vq��F�bA���JK}�| PʢL�
B}�a�D~��?�z��t���      0   �  x�uX�nW]S_q�mhߊ��'@0ded6�(%��?2Ȏ�ȲG�9x1���]0�I��f�l����0_�:��6�T��D��]��T�Su��V��f�V�}��q��^���k�v�۬����<q����y���g�'�,_��<vy�G����?ϓ|��s��?��}YN婼���<�3?�Cy�[\X�BJC1���T�pi-����^���p���/�m]���m���Z7����<L��H�'�9����O4�5=���5����K?v����G(5��K<��Oe���~+Npx�G�X*{΁�xZ�H���
'%ba� /$ܬ�Q��RX��]X�A���?���y��0嫸�3�L��:� s�p�gAv�X1�>�%1����m��OGGc�:���nQ}�R�M-�o�{�O5�Xl%�,�[H̐4G��A�,0�K|
�P(?�U������<:��]��+�/7�]2j|����<yx�䡻���W�*�;���*����.%���A�u���ݭ�?���u��� �����WuL�D���7~,����~��Ɖ�A�0]���� �NkE��s���( S=Y��K�`C���*�M��@G�I=`YϸJ��5���0*LCnY����c���H;>���	G���*�٪,�PкB�Pb^����F|���æ�!v
z@ʱ3�ā�Ss(ς�]�d+��1U��hI�����!���vB=uϪ�����5�C�l��'��	<���!9Ҳ6��O�XL�J��)J��ASY���v�;��V�b��'h�Q�����$#��i8�����=����?���NKh����(����|�c7�w�C�V��j����N%�w~-�y������8f���L�"$Q�`�(�Djm������Rҩ���VZ����<c�(hCdZ����+
F����2�&F¡j�@�ښK��r�b]���m��E�D9Qj����bOAq�"j�h�=�T�IX���̨���J9�6S�%�*�B]����G�0?�kCc>I�ޡ���5';lԠWtZ�q$+UB��iE��ۣA����
>3�:�R��'�QIW�t"��9J�@�˧PK��� pƎvS?�c�tAs8`�W�ͻ�cj�L�u��9�H1�g"�/�È��F���e���C*��ư�b[غ�?�Z%�5��򨠃ń�OU벍�R�2ƔDժK	�3�9�#�����D!�+�X�5!M��>D�����_������J������k6�RҬ���^�Qkw��l&�Sg�@��h������x������?�V�/�]���Ltc��͖[V�F����hQ��!�ݍ��DF���$�\��@K�A�JW`������K�ٴh+�p�T���>g/������
B��,ԗ�l�d�Z{޸�h���h?#(���*�,�����Y�N��B�f�2p~s�0[+�0����|G%˹������YU؋c�`�D�_�<e񆉖 ��6�	 ��Zϋ7D�,fٹ�X\1�����e3k�r�L��* m]��)?���>kG��W��6���ɽw��_O@ ˤ�+�ޤ� �*^ٔ{����5��Ӫ5��m�5���}f͟���(�B�ѹ�8��퉪�)���Ҳ�i�.�8�%H �	3�بW3����B,U>2�6��32;��)�9��J�$Yn���o�	�S�q1ӽ�Y��ӡ�m���(�}����5o�¾�v�8��z��}=Ge�$�{]����;vi�[��ڑ\�$s�￲Q���7w���͓G����oO�/Ȋ}���f�e�4�v6� !?q��n����=5�K͒�w�����Y	��|�s��KC/<ؗ����XO�5��چ9ӊa����'E��_�QC�D�R���Ǳ��;�sL���C&F�H��u�<d�GLcV6���I�L��o�tM�Wv�����~@8�zzGj���yw���*/���ݩ�M��M��4@��=�7��j{{{�!O I      2      x������ � �     