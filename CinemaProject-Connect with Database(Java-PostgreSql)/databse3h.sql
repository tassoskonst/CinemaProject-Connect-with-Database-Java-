PGDMP         5                w           CinameProject    11.2    11.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    17140    CinameProject    DATABASE     �   CREATE DATABASE "CinameProject" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Greek_Greece.1253' LC_CTYPE = 'Greek_Greece.1253';
    DROP DATABASE "CinameProject";
             postgres    false            �            1259    17141    cinema    TABLE     w   CREATE TABLE public.cinema (
    cinemaid integer NOT NULL,
    cinemanumberofseats integer,
    cinemais3d boolean
);
    DROP TABLE public.cinema;
       public         postgres    false            �            1259    17146    films    TABLE     �   CREATE TABLE public.films (
    filmid integer NOT NULL,
    filmtitle text,
    filmcategory text,
    filmdescription text
);
    DROP TABLE public.films;
       public         postgres    false            �            1259    17154    provoles    TABLE     �   CREATE TABLE public.provoles (
    provoliid integer NOT NULL,
    provolinor integer,
    provolistartdate date,
    provolienddate date,
    provoliisavailable boolean,
    provolifilm integer,
    provolicinema integer
);
    DROP TABLE public.provoles;
       public         postgres    false            �            1259    17167    transactions    TABLE     g   CREATE TABLE public.transactions (
    userid integer,
    provoliid integer,
    selecteddate date
);
     DROP TABLE public.transactions;
       public         postgres    false            �            1259    17159    users    TABLE     �   CREATE TABLE public.users (
    userid integer NOT NULL,
    name character varying,
    username text,
    password text,
    usertype text
);
    DROP TABLE public.users;
       public         postgres    false                      0    17141    cinema 
   TABLE DATA               K   COPY public.cinema (cinemaid, cinemanumberofseats, cinemais3d) FROM stdin;
    public       postgres    false    196   X                 0    17146    films 
   TABLE DATA               Q   COPY public.films (filmid, filmtitle, filmcategory, filmdescription) FROM stdin;
    public       postgres    false    197   �                 0    17154    provoles 
   TABLE DATA               �   COPY public.provoles (provoliid, provolinor, provolistartdate, provolienddate, provoliisavailable, provolifilm, provolicinema) FROM stdin;
    public       postgres    false    198   �                 0    17167    transactions 
   TABLE DATA               G   COPY public.transactions (userid, provoliid, selecteddate) FROM stdin;
    public       postgres    false    200   �                 0    17159    users 
   TABLE DATA               K   COPY public.users (userid, name, username, password, usertype) FROM stdin;
    public       postgres    false    199   !       �
           2606    17145    cinema cinema_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cinema
    ADD CONSTRAINT cinema_pkey PRIMARY KEY (cinemaid);
 <   ALTER TABLE ONLY public.cinema DROP CONSTRAINT cinema_pkey;
       public         postgres    false    196            �
           2606    17153    films films_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (filmid);
 :   ALTER TABLE ONLY public.films DROP CONSTRAINT films_pkey;
       public         postgres    false    197            �
           2606    17158    provoles provoles_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.provoles
    ADD CONSTRAINT provoles_pkey PRIMARY KEY (provoliid);
 @   ALTER TABLE ONLY public.provoles DROP CONSTRAINT provoles_pkey;
       public         postgres    false    198            �
           2606    17166    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    199            �
           2606    17175 $   provoles provoles_provolicinema_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.provoles
    ADD CONSTRAINT provoles_provolicinema_fkey FOREIGN KEY (provolicinema) REFERENCES public.cinema(cinemaid);
 N   ALTER TABLE ONLY public.provoles DROP CONSTRAINT provoles_provolicinema_fkey;
       public       postgres    false    196    198    2702            �
           2606    17170 "   provoles provoles_provolifilm_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.provoles
    ADD CONSTRAINT provoles_provolifilm_fkey FOREIGN KEY (provolifilm) REFERENCES public.films(filmid);
 L   ALTER TABLE ONLY public.provoles DROP CONSTRAINT provoles_provolifilm_fkey;
       public       postgres    false    197    2704    198            �
           2606    17185 (   transactions transactions_provoliid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_provoliid_fkey FOREIGN KEY (provoliid) REFERENCES public.provoles(provoliid);
 R   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_provoliid_fkey;
       public       postgres    false    198    200    2706            �
           2606    17180 %   transactions transactions_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);
 O   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_userid_fkey;
       public       postgres    false    2708    200    199               ?   x���� ��0Q�xvI�	��b�|v'�OA�U�e�Øl�E����MN�����sI��&F         <  x��V�nG<�~E�����7Y�� V`X�C.��&w�ٙ�<(��ǧfv��b9"W�~TWUs�.L՛�=+��dZ�f�-S�qך�|p��wQ�dNdE��8��(g�|�(-%<I�K�����hR�D�Y-�~3uB')=6ps��I���S��k���%����L4$�hC=g!��8�ny0��K.��J�'����%�%Q�a��J/.�9V)��zDo$Й��:���;u{�C'>�k�)_��]ښ-�hs�iKL�57���Q
j,N�k-al�Z�DSN�PO�Su���u2��>�:�#zg����t��^�éݛÏ�g�EՆ��|�7�56dVh�hs]!����i�1K��:�������6�!e��Ss ��`�#	1 �0m��i ]�4"�4���E}�_�S'��oW
N|3%Wk��ތ�H��`��-���LAtn^��~��ނT�-}��=�{�)ΰ�+�m���۷Ɠ΁W�.�n�Z������楺 �Qz6.V�_�|ӬY�q��s4����D���8e��`d[DTx#Wm��KO�Lt�oA ��l��}"j�UA�ޛ��R�ә-�)��cf�����X(�s����u�3=��S��y��TG6ߒޏ�,�5�!�[��[���Y��+S�v��W�r��2���Щ6W9��������}�nK��Z����N�mQk��ۊSS��s��o�X��- 8n��3S����u��Z��&+���&n���m���`,������rjO�)	�����V�T�9�=�-�֠\ɏ�\���f��ty浩�$_�5r�T��۸�	���/�/ 4�����r�m��)����נg@�ҕ~���F�dq{6a����Z�2���3XA�x������+�L��f�����)���@! @������B����\}��w���k���:�� C:0�z�.2K��5'�yE��Mo��F�~���wg0z�;���)�.4,h���2��f�������O�\���oO��W�:G}���8�Ax�]���t�ѵ��ν7������}���̀k��q�NmU�Kj��G#/w��:V�'[�&���Rbw����ՐCQC�j i�rb�=��""|����n�\�d;s��QC������/�i�K�9Dų��?[ᇉ�fy�>	(����I�&���ƮY>W��stm���%ư
i�����Y>UV��;<h��;��<�D���N ��
��8�)@���k ʄ����l.���X-�	t��{z�A�2G��,�'���ю^�?�T8̕iHІr������bc�         �  x�}�Kr1D�p��G�.Y���a\����\v�G%�H��G�k���!J$�l$�K��[ !p2vr�V�_%�+w��I֠΃L�&mA�4�"�U��)�x��6�$�&��f��b��]����"�Q��Qڅ>`Ű1�6�� �v^kWD	c0���/sm ;�z�%�e���>�X�k�u��2�g9o���+Е�ڸ�,��-d�<�N�5�)�	l����!fO(�?�Q��Q���kl
��Q`UӼ|t�q����V�"�������:�66��H� Vk�Dk*����X$���� I�~��_^%k�#�k��g�T���N:��:�ծ�\�j0w�kJ&�ڧ�%��	��N�T�+��(�Ё�]��PF��M����&3o�q�>�8y�����dWTi@]ʋss�EA	*�L��~^)Y�4zi���7����?���         5  x��S[�� �6w�
c�=A���h?:�U��JU*��a�H�땊Կ�g���WJ�q�vd�zX���H�}ס�<�h��K�Y����m�*]X��˂������y+�2�t<p���^���²��w�%R�+���\�i��|YU?r�E�����{$'����	�)��Y HB�^n0��r��| 36���Vha�à�v؃ ��b8� J�4���"p&�us6��M�E�ֹ~�ACl�Y<O&]'�>���0�M �q�M�Ɉ�yA�^��&\��X!j��_?)�_'E\         i  x�]��n�0E��>�0�E��%���"q����P�D��!$Gu�?p��rS<�F�W��*��Ng7(��!�LQ:"�A�ΓM�z��rQ����Ͱ�Kn���ۧ�|j����(�p6�%?�����`-���Eǽ��@�ך�q�j�^����
i9^���8���x�E>r�F��o��bP:S�0�g�h^O�
��L���.��������cl�1�i��i-�
m</�|g*��y.c(5���2M��^F��;����k:�:R�^�qW�Rl�i_�Pl[���6E�}M1�{��@ܟ�}��ĕo�]��yH�;N|Ş���&����o�D��HE�:֟_�$� ���     