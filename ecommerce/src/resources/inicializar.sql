CREATE TABLE public.roles(
    id UUID UNIQUE NOT NULL,
    name VARCHAR(12) UNIQUE NOT NULL,
    description VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL,
    CONSTRAINT pk_role PRIMARY KEY(id);
)

CREATE TABLE public.users(
    id UUID UNIQUE NOT NULL,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(16) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL,
    role_id UUID NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY(id),
    CONSTRAINT fk_user_role FOREIGN KEY(role_id)
    REFERENCES public.roles(id);
)

CREATE TABLE public.categories(
    id UUID UNIQUE NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    description VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY(id);
)

CREATE TABLE public.games(
    id UUID UNIQUE NOT NULL,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(100) NOT NULL,
    price DECIMAL(7,2) NOT NULL,
    stock INTEGER NOT NULL
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL,
    category_id UUID NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY(id),
    CONSTRAINT fk_product_category FOREIGN KEY(category_id)
    REFERENCES public.categories(id);
)

CREATE TABLE public.status(
    id UUID UNIQUE NOT NULL,
    name VARCHAR(15) UNIQUE NOT NULL,
    description VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL,
    CONSTRAINT pk_status PRIMARY KEY(id);
)

CREATE TABLE public.orders(
    id UUID UNIQUE NOT NULL,
    quantity INTEGER NOT NULL,
    total DECIMAL(8, 2) NOT NULL,
    created_at T)IMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL,
    user_id UUID NOT NULL,
    status_id UUID NOT NULL,
    CONSTRAINT pk_order PRIMARY KEY(id),
    CONSTRAINT fk_order_user FOREIGN KEY(user_id)
    REFERENCES public.users(id);


CREATE TABLE public.order_items(
    id UUID UNIQUE NOT NULL,
    quantity INTEGER NOT NULL,
    price DECIMAL(7, 2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL,
    order_id UUID NOT NULL,
    product_id UUID NOT NULL,
    CONSTRAINT pk_order_item PRIMARY KEY(id),
    CONSTRAINT fk_order_item_order FOREIGN KEY(order_id)
    REFERENCES public.orders(id),
    CONSTRAINT fk_order_item_product FOREIGN KEY(product_id)
    REFERENCES public.products(id);
)





