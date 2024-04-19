create database if not exists project;
use project;
create table company(
    CompanyID VARCHAR(15),
    CompanyName VARCHAR(50),
    PRIMARY KEY (CompanyID)
);

create table product(
    ProductID VARCHAR(15),
    CompanyID VARCHAR(15),
    ProductName VARCHAR(50),
    ProductType VARCHAR (50),
    Price NUMERIC(8,2),
    FOREIGN KEY (CompanyID) REFERENCES company(CompanyID),
    PRIMARY KEY (ProductID, CompanyID)
);

create table package(
    PackageID VARCHAR(15),
    ProductID VARCHAR(15),
    CompanyID VARCHAR(15),
    PackageName VARCHAR(50),
    PRIMARY KEY (PackageID, ProductID, CompanyID),
    FOREIGN KEY (ProductID, CompanyID) REFERENCES product(ProductID, CompanyID)
);

create table manufacturer(
    ManufacturerID VARCHAR(15),
    ProductID VARCHAR(15),
    ManufacturerName VARCHAR(50),
    PRIMARY KEY (ManufacturerID, ProductID),
    FOREIGN KEY (ProductID) REFERENCES product(ProductID)
);

create table store(
    StoreID VARCHAR(15),
    StoreName VARCHAR(50),
    StoreType VARCHAR(10),
    Address VARCHAR(50),
    PRIMARY KEY (StoreID)
);	

create table storeprod(
    StoreID VARCHAR(15),
    ProductID VARCHAR(15),
    Quantity INT,
    ManufacturerID VARCHAR(15),
    CHECK (Quantity >= 0),
    PRIMARY KEY (StoreID, ProductID),
    FOREIGN KEY (StoreID) REFERENCES store(StoreID),
    FOREIGN KEY (ProductID) REFERENCES manufacturer(ProductID),
    FOREIGN KEY (ManufacturerID) REFERENCES manufacturer(ManufacturerID)
);

create table cart(
    CartID VARCHAR(15),
    StoreID VARCHAR(15),
    ProductID VARCHAR(6),
    Quantity INT,
    PRIMARY KEY (CartID, StoreID, ProductID),
    FOREIGN KEY (StoreID, ProductID) REFERENCES storeprod(StoreID, ProductID)
);

create table customer(
    CustomerID VARCHAR(15),
    Name VARCHAR(50),
    Phone CHAR(10),
    Address VARCHAR(50),
    PRIMARY KEY (CustomerID)
);

create table customerinstance(
    OrderID VARCHAR(15),
    CustomerID VARCHAR(15),
    CartID VARCHAR(15),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CartID) REFERENCES cart(CartID),
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);

create table contract(
    ContractID VARCHAR(15),
    CustomerID VARCHAR(15),
    AccountNumber VARCHAR(10),
    PRIMARY KEY (ContractID),
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);

create table carddetails(
    CustomerID VARCHAR(15),
    CardNumber VARCHAR(50),
    PRIMARY KEY (CustomerID, CardNumber),
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);

create table booking(
    BookingID VARCHAR(15),
    OrderID VARCHAR(15),
    BookingDate DATE,
    PRIMARY KEY (BookingID),
    FOREIGN KEY (OrderID) REFERENCES customerinstance(OrderID)
);

create table shipping(
    ShippingID VARCHAR(15),
    BookingID VARCHAR(15),
    CompanyName VARCHAR(50),
    Location VARCHAR(50),
    DeliveryDate DATE,
    Deadline DATE,
    PRIMARY KEY (ShippingID),
    FOREIGN KEY (BookingID) REFERENCES booking(BookingID)
);