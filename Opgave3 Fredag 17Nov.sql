/*
INVOICE(InvoiceNumber, InvoiceDate, SubTotal, TaxPct, Total)
*/

Create table INVOICE(
	InvoiceNumber Int not null,
	InvoiceDate datetime2 not null,
	SubTotal float not null DEFAULT '0',
	TaxPct float null,
	Total float not null Default '0'
	CONSTRAINT INVOICE_PK PRIMARY KEY (InvoiceNUmber)
);

/*
PRODUCT(ProductNumber, ProductType, ProductDescription, UnitPrice)
*/

Create table PRODUCT(
	ProductNumber INT NOT NULL,
	ProductType INT NOT NULL,
	ProductDescription NVARCHAR NOT NULL,
	UnitPrice FLOAT NOT NULL,
	CONSTRAINT PRODUCT_PK PRIMARY KEY (ProductNumber)
);

/*
LINE_ITEM(InvoiceNumber, LineNumber, ProductNumber, Quantity, UnitPrice, Total)
*/

Create table LINE_ITEM(
	InvoiceNumber INT not null,
	LineNumber INT not null,
	ProductNumber INT not null,
	Quantity INT Null,
	UnitPrice FLOAT NOT NULL DEFAULT '0',
	Total Float NOT NULL DEFAULT '0'
	CONSTRAINT LINE_ITEM_PK PRIMARY KEY (InvoiceNumber, LineNumber)
	CONSTRAINT LINE_ITEM_INVOICE_FK FOREIGN KEY (InvoiceNumber)
		REFERENCES INVOICE(InvoiceNumber)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION,
	CONSTRAINT LINE_ITEM_PRODUCT_FK FOREIGN KEY (ProductNumber)
		REFERENCES PRODUCT (ProductNumber)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);

/*
Noter om typer:
Databasetyper "omregnet til" C#/Visual Studio
INT svarer til INT eller INT32
FLOAT kommatal, svarer til double
NVARCHAR svarer til string
DATETIME2 svarer til Date

#######
https://docs.microsoft.com/en-us/sql/relational-databases/clr-integration-database-objects-types-net-framework/mapping-clr-parameter-data
*/