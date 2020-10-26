use classicmodels;

-- delimiter dùng để phân cách bộ nhớ lưu trữ thủ tục Cache và mở ra một ô lưu trữ mới.
DELIMITER //
--  dùng để khai báo tạo một Procedure mới, trong đó findAllCustomers chính là tên thủ tục còn hai từ đầu là từ khóa.
CREATE PROCEDURE findAllCustomers()
-- begin và end dùng để khai báo bắt đầu của Procedure và kết thúc Procedure
BEGIN

  SELECT * FROM customers;

END //
-- đóng lại ô lưu trữ
DELIMITER ;
-- gọi procedure
call findAllCustomers();


DELIMITER //
-- Lệnh Drop để xóa đi Procedure đó và tạo lại:
DROP PROCEDURE IF EXISTS `findAllCustomers`//

CREATE PROCEDURE findAllCustomers()

BEGIN

   SELECT *  FROM customers where customerNumber = 175;

END; //

DELIMITER ;





