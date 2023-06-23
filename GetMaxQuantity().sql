-- Create procedure
CREATE PROCEDURE GetMaxQuantity() 
SELECT MAX(quantity) FROM orders;