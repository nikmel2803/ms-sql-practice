create database shop
go

use shop

CREATE TABLE [orders] (
	ID int NOT NULL,
	order_data datetime NOT NULL,
	customer_id int NOT NULL,
	employee_id int NOT NULL,
	completion_date datetime NOT NULL,
	payment_type_id int NOT NULL,
	delivery_type_id int NOT NULL,
	status_id int NOT NULL,
  CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [products] (
	ID int NOT NULL,
	name nvarchar(255) NOT NULL,
	category_id int NOT NULL,
	price int NOT NULL,
	unit_id int NOT NULL,
	description nvarchar(255) NOT NULL,
  CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [categories] (
	ID int NOT NULL UNIQUE,
	name varchar(255) NOT NULL,
	description varchar(255) NOT NULL,
  CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [units] (
	ID int NOT NULL UNIQUE,
	name nvarchar(255) NOT NULL,
	description nvarchar(255) NOT NULL,
  CONSTRAINT [PK_UNITS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [order_details] (
	ID int NOT NULL,
	product_id int NOT NULL,
	order_id int NOT NULL,
	quantity int NOT NULL,
	price int NOT NULL,
  CONSTRAINT [PK_ORDER_DETAILS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [employees] (
	ID int NOT NULL,
	first_name nvarchar(255) NOT NULL,
	last_name nvarchar(255) NOT NULL,
	phone nvarchar(255) NOT NULL,
	email nvarchar(255) NOT NULL,
	birth_date datetime NOT NULL,
	employment_date datetime NOT NULL,
	positions nvarchar(255) NOT NULL,
  CONSTRAINT [PK_EMPLOYEES] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [payment_methods] (
	ID int NOT NULL,
	name nvarchar(255) NOT NULL,
	is_active bit NOT NULL,
	comment nvarchar(255) NOT NULL,
  CONSTRAINT [PK_PAYMENT_METHODS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [customers] (
	ID int NOT NULL,
	firstName nvarchar(255) NOT NULL,
	lastName nvarchar(255) NOT NULL,
	phone nvarchar(255) NOT NULL,
	region_id int NOT NULL,
	email nvarchar(255) NOT NULL,
	comment nvarchar(255) NOT NULL,
  CONSTRAINT [PK_CUSTOMERS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [regions] (
	ID int NOT NULL,
	name nvarchar(255) NOT NULL,
	description nvarchar(255) NOT NULL,
  CONSTRAINT [PK_REGIONS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [delivery_methods] (
	ID int NOT NULL,
	name nvarchar(255) NOT NULL,
	is_active bit NOT NULL,
	comment nvarchar(255) NOT NULL,
  CONSTRAINT [PK_DELIVERY_METHODS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [statuses] (
	ID int NOT NULL,
	name nvarchar(255) NOT NULL,
	is_active bit NOT NULL,
	comment nvarchar(255) NOT NULL,
  CONSTRAINT [PK_STATUSES] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [orders_fk0] FOREIGN KEY (customer_id) REFERENCES [customers]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [orders] CHECK CONSTRAINT [orders_fk0]
GO
ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [orders_fk1] FOREIGN KEY (employee_id) REFERENCES [employees]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [orders] CHECK CONSTRAINT [orders_fk1]
GO
ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [orders_fk2] FOREIGN KEY ([payment_type_id]) REFERENCES [payment_methods]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [orders] CHECK CONSTRAINT [orders_fk2]
GO
ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [orders_fk3] FOREIGN KEY ([delivery_type_id]) REFERENCES [delivery_methods]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [orders] CHECK CONSTRAINT [orders_fk3]
GO
ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [orders_fk4] FOREIGN KEY ([status_id]) REFERENCES [statuses]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [orders] CHECK CONSTRAINT [orders_fk4]
GO

ALTER TABLE [products] WITH CHECK ADD CONSTRAINT [products_fk0] FOREIGN KEY ([category_id]) REFERENCES [categories]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [products] CHECK CONSTRAINT [products_fk0]
GO
ALTER TABLE [products] WITH CHECK ADD CONSTRAINT [products_fk1] FOREIGN KEY ([unit_id]) REFERENCES [units]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [products] CHECK CONSTRAINT [products_fk1]
GO



ALTER TABLE [order_details] WITH CHECK ADD CONSTRAINT [order_details_fk0] FOREIGN KEY ([product_id]) REFERENCES [products]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [order_details] CHECK CONSTRAINT [order_details_fk0]
GO
ALTER TABLE [order_details] WITH CHECK ADD CONSTRAINT [order_details_fk1] FOREIGN KEY ([order_id]) REFERENCES [orders]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [order_details] CHECK CONSTRAINT [order_details_fk1]
GO



ALTER TABLE [customers] WITH CHECK ADD CONSTRAINT [customers_fk0] FOREIGN KEY ([region_id]) REFERENCES [regions]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [customers] CHECK CONSTRAINT [customers_fk0]
GO



