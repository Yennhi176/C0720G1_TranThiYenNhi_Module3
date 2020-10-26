use classicmodels;
-- để tìm thông tin của Julie King (mã số 175), bạn sẽ query như sau:
explain select * from customers where customerNumber = 175;

--  thêm chỉ mục cho bảng customers như sau:
ALTER TABLE customers ADD INDEX idx_customerNumber(customerNumber);
EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;

-- có thể Add index theo cặp như bạn add index cho cặp contactFirstName và contactLastName.
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';



