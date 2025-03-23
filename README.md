                                                PHARMACY MANAGEMENT SYSTEM
 
 Pharmacy Management System is a SQL-based project designed to efficiently manage pharmacy operations, including inventory, sales, purchases, suppliers, customers, and user roles. 

 Database Schema Overview

  Users Management
PharmacyUsers – Stores user details such as ID, name, email, password, and role.

   Inventory & Product Management
Categories – Defines categories of medicines.

Medicines – Stores details of medicines like name, category, price, quantity, and expiry date.

  Suppliers & Purchases
Suppliers – Stores supplier details such as name, contact, email, and address.

Purchases – Stores purchase transactions.

PurchaseDetails – Stores detailed records of each purchase (medicine, quantity, cost, etc.).

   Sales & Customers
Customers – Stores customer details (name, email, address).

Sales – Stores sales transactions.

SaleDetails – Stores details of each sale (medicine, quantity, price).

   Key Functionalities :

 User Authentication & Role Management – Users log in with credentials, and roles (e.g., admin, pharmacist) define access control.
 
   Inventory Management – Tracks medicine stock, expiry dates, and low-stock alerts.
   
   Supplier & Purchase Management – Maintains supplier details and tracks purchases.
   
   Sales & Customer Management – Handles sales transactions and customer details.
   
   Reporting & Analytics – Generates reports for stock levels, sales, and purchases.
   
 Stored Procedures :
 
   Adding new medicines, categories, suppliers, and customers 
   
  Processing sales and purchases efficiently
  
  Updating stock levels automatically after a purchase or sale
  
  Generating reports for management


