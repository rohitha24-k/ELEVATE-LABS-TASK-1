**#E-Commerce Database Schema - Task 1**
    This project contains the schema design, table creation, and sample data insertion for a basic **E-commerce Database System** using SQL. The schema covers customers, products, orders, order items, payments, and categories—representing a typical online shopping system.
    
**#Objective**
The goal of this task is to:
- Identify and define relevant entities and relationships for an E-commerce platform.
- Create normalized SQL tables with proper constraints (primary keys, foreign keys).
- Populate the tables with sample data.
- Visualize outputs using screenshots (provided in the `/screenshots` folder).

**# Entities and Relationships**

**Entities:**
- `Customers`: Users who place orders.
- `Products`: Items available for purchase.
- `Categories`: Product classifications.
- `Orders`: Purchase transactions made by customers.
- `Order_Items`: Items (products) listed in an order.
- `Payments`: Payment details for each order.

**Relationships:**
- One customer can place many orders.
- One order can have multiple products (via order_items).
- Each product belongs to one category.
- Each order has one payment record.

**Table structure**
### `Customers`
| Column     | Data Type     | Constraint        |
|------------|---------------|-------------------|
| CustomerID | INT           | Primary Key       |
| Name       | VARCHAR(100)  |                   |
| Email      | VARCHAR(100)  | Unique            |
| Address    | TEXT          |                   |
| Phone      | VARCHAR(15)   |                   |

### `Categories`
| Column       | Data Type     | Constraint        |
|--------------|---------------|-------------------|
| CategoryID   | INT           | Primary Key       |
| CategoryName | VARCHAR(50)   |                   |

### `Products`
| Column      | Data Type     | Constraint                     |
|-------------|---------------|-------------------------------|
| ProductID   | INT           | Primary Key                   |
| ProductName | VARCHAR(100)  |                               |
| Price       | DECIMAL(10,2) |                               |
| Stock       | INT           |                               |
| CategoryID  | INT           | Foreign Key → Categories       |

### `Orders`
| Column     | Data Type     | Constraint                  |
|------------|---------------|-----------------------------|
| OrderID    | INT           | Primary Key                 |
| CustomerID | INT           | Foreign Key → Customers     |
| OrderDate  | DATE          |                             |
| Status     | VARCHAR(50)   |                             |

### `Order_Items`
| Column       | Data Type     | Constraint                                |
|--------------|---------------|-------------------------------------------|
| OrderItemID  | INT           | Primary Key                               |
| OrderID      | INT           | Foreign Key → Orders                      |
| ProductID    | INT           | Foreign Key → Products                    |
| Quantity     | INT           |                                           |
| Price        | DECIMAL(10,2) |                                           |

### `Payments`
| Column       | Data Type     | Constraint                       |
|--------------|---------------|----------------------------------|
| PaymentID    | INT           | Primary Key                      |
| OrderID      | INT           | Foreign Key → Orders             |
| PaymentDate  | DATE          |                                  |
| Amount       | DECIMAL(10,2) |                                  |
| PaymentMethod| VARCHAR(50)   |                                  |


**Primary and Foreign Key Relationships**
Table              Primary Key            	Foreign Key (→ Table)
Customers	         CustomerID	                     –
Categories	       CategoryID	                     –
Products	          ProductID	              CategoryID → Categories
Orders	             OrderID	              CustomerID → Customers
Order_Items        	OrderItemID            	OrderID → Orders, ProductID → Products
Payments	          PaymentID	              OrderID → Orders


