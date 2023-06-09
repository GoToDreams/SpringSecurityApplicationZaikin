PGDMP         /                {            Shop    15.2    15.2 5    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
   TABLE DATA                 public          postgres    false    215   r9       *          0    16449    image 
   TABLE DATA                 public          postgres    false    217   :       ,          0    16456    orders 
   TABLE DATA                 public          postgres    false    219   Z=       .          0    16463    person 
   TABLE DATA                 public          postgres    false    221   !?       0          0    16472    product 
   TABLE DATA                 public          postgres    false    223   ?A       2          0    16482    product_cart 
   TABLE DATA                 public          postgres    false    225   �I       ?           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
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
       public          postgres    false    221    225    3212            (   �   x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0����x��uMk.OҌ0��¦[/6]�2��^ ���236�®��@������AFqq �W!      *   H  x���Ko�7�=��� )s����Vb���T(�h|�*��-���sBa�o)����;����o��xz�����o��n����:���7'��_�_�aݜ��:��o���ӧ_������U-7��������IL�ZЪi�)#�?~�r��?��9ay�ˋ��rk��{M(Nw:h��ͤ�:')��s5�RX�H�c�׭�!Vp*������s�v�
֕��:W�n�!2���w��r��i_q��LCE��on4���N����\�߷�b��:"�eU(�f-�z�v~o���U}�K��ҽ`�P1R,�G��\���(֐�\\:��}�F�i0����&U!"^:���~q�8W��N)�9L�1=,b�J�+�(�rq�87�[��yU��#Ϫ+&�2Xg����|u�an۹ⶊx\��z��gR�I�)w�|�mݯ��=[�Ɋ9�V�<�vO�FH��^+�<�t���e�Xu"pn$. ��R{�2�
~��8y�+:���&Ǚ�G_/cp�b�b��wY��w��&�A@,���P��ʦ�W�'9&c�+��pAY���B����3h��Wj�OA��0���{)�N�2d���=EĬFw��(��K�L�{-�>HI{����
�΋='��*��^�<-**ئ�H�XS�1V��,lS�*�q2���h� $O�4h5���œğΜ�w�y��<
$�['�sgP��9G�Z�����㏄���]b&�h�e�y�h�)�-g��*Ӂ�.1^�N��<�2�K�g�7K�ZsZ�O2(���\j�Xg�x��x� NOK'�^��r��K�d-q��_K4��XV��-��I�?�/^�g�p*      ,   �  x���K��0 �{~�n��I#��=���@�B�q]�2�Ip��_9�lh��\>H�$�y^?=?�z맗�b?�ߛ��\�����F�ݴ��X���Gi�v��eh�~ؤ:=�a�uZ�������S��A�}����,��w���R;؁�����Зl]� �*,����H�=�����������?|[��!�+�A����r��@gLgm�Z1��`��X*�d�N�2P�2)C,Xl��:eO��˸�t�`�I�`8'�]6��+rg�u΃��`إd{�<ɚ?�`{'KtFAT�8^ơW������Z��`͙�h9���Sءii�y��������ؗ �IER�������8вqP�
'��ٙh�Τ��
�Yh	��1�{����v��A2��n]Ҟ!���eY�e���ux����O|ʧ��r%�      .     x���ˎ�@�O����
r��JD�
�7�BP������$fB2�vwr���˿8 �9�1 �L&-�8�ٔd9M�������%�L��yM��"�1�b�n�1��}3�2'����?��r���GG������ބV�,��"�cE��q���^����������~���\�3�=ݢ���O�ӄ�x��0x�$�؞Ĳ��b�'�}�����<n�}a�N��皪�?��^����
��҉XX������Q̯�
k���Z��
��W�
���ͅ	/��q������`�<.nv���(��uD�����9A��~�3 ��߀Fh��_.��
�#���]���9�&ZP�aུ���q��<b/d��7���k��+��(o�k����'D�'�(�<̖[.���h�Q���|.A�f��rI�:�����`x�n�mm�a�&vR}u	v��X�5�Z�%���ͮ��%w\�fQfa]�F�'����.J�h�zn�:]#�7R���������� �xZ      0   �  x��X]o�}��8�����+1O�tU�t	��Bj���DNro� �Nk@<����BHcǓ���X�/���%��9c;�x�xh:�s�>�k���ܼ����n�����c��>�m����{w�v�k�;9sg����a��<�v�����޽��o6v��A}w��̙�����b�Y��wt �;r��7�n>�׭n�o^+Vs��R�T�^�\/���f�T��W��J�ZzU��m'��}h[�Y��3�7M#{��l/Mۮ=悾��(����gl�دeoK�cy+�Lz�ib۶#�Cw�3Y�)(�t��.���E:��۷N'r�(��>�m#{_�ў=�2 �"=��@�'�Q:PS��td�bTG���óS�7�j���I��d���l�"wB��OPxj��X,{z�h��#10�3���9�<s�LGy�S1Cl�^x��B"/¯H􁆸|�k�@W������2�`VO��su�<�g;��y�wEm�@D��F�y�����P�P\�9��%C�>��.���;��jG(�"�ߗ��O�4C�A� Q�)g0�
!9�����,�onJ����wP߿k��5f��WĞ�x<�l7[G�{���ڻ���>c�����.��浛/�W1Y�7����*u�Q�k#��:w�~p����9ì�����]�a-gd����Q?�������&���
���À���"|9w38z fb�@�|�DFiW#�2����,}rE�*K}��1 � ��XÖ3f���VA-ОcfzD�
�C��m/�d���ɧs��w�l�}��Шӽ�C�vD�����&��D���@��Q�L�dr�1���h�V���|&o��ļj���'�hx�q1��bt��(�l��o�PD.�ܒ�H�e9�7V7�8y��T�~O�䍙�Ҡf6Pa�8+�����@9��k��^���������cn��?��
6U�����+�/Wj�r~�R�\��?���۱����(d���N��g������
���'U�SI������D�L��r�w)��T�Ȅ�/3f72V�uP!N��F�:J��Ǯ��J�h�ZҖ��,�	��'�|�ؔ�O=��\�.$�I���+AЭ����qGH��Zo�J<����"��%�����;�z�JVO�ǄMH���'w�@��Qi�殬��x	=��k�{����c�Ph.e����P�%b��#I��UjZ:�n_�|.����}��7��L{��.h�4�\âq׎�Ef��5����j":&�̵:ϖ��i�����v�2M%YE�N����%�kyN��%m�T~�d�,(���Ц(�f]L7|���?r�,\�,�>a�8��GNHU�lj���O?UV{v���)u��-z���e��*��
�J�V.�+����?3�Czץ ��A`��������6�n�c�ՏL�P(����
�Ŗ�aJ�]���IVL;��Wʯ��	�j�#�'�<lF��#����B���a���}�V�8|��)h�>&c@�k��[�H�v�@��ɵ�����֪��f3mS�a3�O�D2�y��+���~E�N9֡�ģ�>�����ÁE�*�m|���c�90 �{�g�ŵCP�X�(W=~���m�"Nz��}�@�Y6N���� q���1�],�a_���e:�L��)�\u��8RUt���_�&�^-T��w�f�h������r�T�8-;���J	���)��ɗ������_Ι�ܺ��]L_5Pq�(c�Vq�z�mhUpʱ��%C��KVP$��1 .B��:�#3]���̈́�Fr�ۡ&�O����X��ӑV) ��7V ��7@�Pi$k��㾨x����
>���hЌa���%Ya�O'�}������\+��~�1�Kg�g���B�q_"�G�{7��}��c���Ϗ����՟O�u��>|e��;w��݂���.�USV_4?��R�T9e�]���2���Y�7��#����QK'N�K�p�E_��A	�}�K�F7%o6��>�зZ�az/֎�V����R�`��F�M#hd��y�t�J�)ηq37{9u#ߙEΊ�#�:~����U���W���;F���r�o{�n�7
�]O2�/�f��/���Y׮�	���a      2   
   x���         