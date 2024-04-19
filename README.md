# Electronic Store Database 

This project provides a comprehensive explanation of the database schema for an electronic store. The schema includes tables for companies, products, manufacturers, stores, customers, contracts, card details, carts, bookings, shipping, and more.

## Tables Overview

1. **Company**
   - Stores information about electronic companies supplying products.

2. **Product**
   - Contains details of electronic products offered by companies.

3. **Package**
   - Represents packages offered by companies, containing multiple products.

4. **Manufacturer**
   - Records information about manufacturers producing electronic products.

5. **Store**
   - Stores information about physical and online stores selling electronic products.

6. **Storeprod**
   - Tracks the inventory of products available in stores.

7. **Cart**
   - Stores the items added to carts by customers for purchase.

8. **Customer**
   - Records information about customers purchasing electronic products.

9. **Customerinstance**
   - Represents instances of customer purchases, linking customers to carts.

10. **Contract**
    - Contains details of contracts between customers and the electronic store.

11. **Carddetails**
    - Stores credit card details associated with customer accounts.

12. **Booking**
    - Represents bookings made by customers for their purchases.

13. **Shipping**
    - Tracks shipping details for customer orders.

## Relationships

### One-to-Many Relationship

- **Company to Product:** One company can supply multiple products.
- **Product to Manufacturer:** A product can be manufactured by only one manufacturer.

### Many-to-Many Relationship

- **Product to Package:** A product can be included in multiple packages, and a package can contain multiple products.
- **Store to Product:** Multiple stores can stock the same product, and each store can have multiple products.

### One-to-One Relationship

- **Customer to Contract:** Each customer can have one contract.
- **Customer to Card Details:** Each customer can have multiple credit cards.

### Many-to-Many through Junction Table

- **Customer to Cart:** A customer can have multiple carts, and each cart can belong to multiple customers.
- **Cart to Booking:** Each cart can be associated with multiple bookings.

## Constraints

- Primary keys: Ensure uniqueness within each table.
- Foreign keys: Enforce referential integrity between related tables.
- Check constraints: Validate data integrity, such as ensuring quantity values are non-negative.

## Data Consistency and Integrity

The relational associations and constraints ensure data consistency and integrity within the database by enforcing dependencies and constraints between related entities. These measures help maintain accurate and reliable information throughout the electronic store database.


## Queries
The database supports a variety of queries to retrieve information such as customer details, product sales, top-selling products, available products in stores, and shipping status.

## Usage
To use this database, follow these steps:
1. Create the database named 'project'.
2. Run the SQL script provided to create tables and insert sample data.
3. Execute queries to retrieve desired information.
