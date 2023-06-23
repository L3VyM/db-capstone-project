use LittleLemonDB;
DROP PROCEDURE IF EXISTS ManageBooking;
CREATE PROCEDURE ManageBooking(BookingDate DATE,Table_Number INT)
	SELECT CONCAT("Table ", TableNumber, " is already booked")
    WHERE exists (select * from Bookings where Date = BookingDate and TableNumber = Table_Number)
CALL ManageBooking("2022-11-12", 3);
