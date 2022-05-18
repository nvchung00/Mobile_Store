-- @block Create Database
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Product;
CREATE TABLE User (
    UserId integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    username text NOT NULL UNIQUE,
    password TEXT NOT NULL,
	ngaysinh    DATE    NOT NULL,
	gioitinh    TEXT NOT NULL CHECK(gioitinh  IN ('Male', 'Female')),
	email       TEXT  NOT NULL CHECK (email LIKE '%@gmail.com'),
	sdt         TEXT NOT NULL,
	diachi      TEXT NOT NULL,
	role        TEXT NOT NULL CHECK(role IN ('user','admin'))
);
CREATE TABLE Product (
    ProductId integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    ProductName text NOT NULL,
    ProductPrice real NOT NULL,
    NumOfProductInStock integer NOT NULL DEFAULT 0,
    ProductDescription text NOT NULL,
    ProductManufacturer text,
    ProductCategory text,
    ProductCondition tinyint NOT NULL CHECK(
        ProductCondition >= 1
        AND ProductCondition <= 3
    ),
    ProductImage blob
);
-- @block Initial Data
INSERT INTO User (username,password,ngaysinh,gioitinh,email,sdt,diachi,role)
VALUES ('admin','123','2000-10-01','Male','nvchung00@gmail.com','0989439234','thanhhoa','admin');

INSERT INTO Product(
        ProductName,
        ProductPrice,
        NumOfProductInStock,
        ProductDescription,
        ProductManufacturer,
        ProductCategory,
        ProductCondition,
        ProductImage
    )
VALUES (
        'P20 Pro 128GB Dual Sim Twilight',
        899,
        600,
        'A smartphone is a handheld personal computer with a mobile operating system and an integrated mobile broadband cellular network connection for voice, SMS, and Internet data communication; most, if not all, smartphones also support Wi-Fi.',
        'Huawei',
        'huawei',
        1,
        'images/p20-pro.jpeg'
    ),
    (
        'iPhone 8 Plus 64GB PRODUCT RED',
        1009,
        250,
        'A smartphone is a handheld personal computer with a mobile operating system and an integrated mobile broadband cellular network connection for voice, SMS, and Internet data communication; most, if not all, smartphones also support Wi-Fi.',
        'Apple',
        'apple',
        1,
        'images/iphone8.jpeg'
    ),
    (
        'Iphone X',
        1009,
        800,
        'A smartphone is a handheld personal computer with a mobile operating system and an integrated mobile broadband cellular network connection for voice, SMS, and Internet data communication; most, if not all, smartphones also support Wi-Fi.',
        'Apple',
        'apple',
        1,
        'images/iphone-x.jpg'
    ),
    (
        'Galaxy S8',
        699,
        200,
        'A smartphone is a handheld personal computer with a mobile operating system and an integrated mobile broadband cellular network connection for voice, SMS, and Internet data communication; most, if not all, smartphones also support Wi-Fi.',
        'Samsung',
        'samsung',
        1,
        'images/galaxy-s8.png'
    );