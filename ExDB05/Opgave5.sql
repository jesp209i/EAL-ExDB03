USE DB2017_C13
GO

-- Oprettelse af Stored Procedure
CREATE PROC spGetOrder (
@OrderID INT
)
AS
BEGIN
	SELECT exercise_order.orderid, 
		exercise_customer.name, 
		exercise_orderline.quantity, 
		exercise_product.name AS pname, 
		exercise_product.price
	FROM exercise_order, exercise_customer, exercise_orderline, exercise_product
	WHERE 
		exercise_order.orderid = @OrderID AND 
		exercise_order.orderid = exercise_orderline.orderid AND
		exercise_orderline.productid = exercise_product.productid AND
		exercise_order.customerid = exercise_customer.customerid
END;

-- Rettelse af ovenstående Stored Procedure
ALTER PROC spGetOrder (
@OrderID INT = NULL
)
AS
BEGIN
	SELECT exercise_order.orderid, 
		exercise_customer.name, 
		exercise_orderline.quantity, 
		exercise_product.name AS pname, 
		exercise_product.price
	FROM exercise_order, exercise_customer, exercise_orderline, exercise_product
	WHERE 
		exercise_order.orderid = ISNULL(@OrderID,exercise_order.orderid) AND 
		exercise_order.orderid = exercise_orderline.orderid AND
		exercise_orderline.productid = exercise_product.productid AND
		exercise_order.customerid = exercise_customer.customerid
END