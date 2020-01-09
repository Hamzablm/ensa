create table category
(
    id_category serial not null
        constraint category_pkey
        primary key,
    name varchar(200),
    url_category varchar(200)
);

alter table category
    owner to hamzabelmellouki;

create table store
(
    id_store serial not null
        constraint store_pkey
        primary key,
    name varchar(200),
    total_rating varchar(50),
    url_store varchar(1000)
);

alter table store
    owner to hamzabelmellouki;

create table product
(
    id_product serial not null
        constraint product_pkey
        primary key,
    name varchar(200),
    sales integer,
    total_rating varchar(50),
    date_product date,
    url_image varchar(500),
    url_product varchar(500),
    id_category integer
        constraint product_ibfk_1
        references category,
    id_store integer
        constraint product_ibfk_2
        references store,
    price varchar(50)
);

alter table product
    owner to hamzabelmellouki;

create table legacy_price
(
    id_price serial not null
        constraint legacy_price_pkey
        primary key,
    new_price integer,
    date date,
    id_product integer
        constraint legacy_price_ibfk_1
        references product,
    id_category integer
        constraint legacy_price_ibfk_2
        references category,
    id_store integer
        constraint legacy_price_ibfk_3
        references store
);

alter table legacy_price
    owner to hamzabelmellouki;
