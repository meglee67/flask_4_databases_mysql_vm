INSERT INTO employees (SSN) VALUES
('123456789'),
('987654321'),
('111223344');

INSERT INTO contact_info(
    employee_id,
    first_name,  
    last_name,
    date_of_birth,
    address,
    phone_number,
    email)
VALUES
(1, 'Astarion', 'Ancunin', '1990-05-15', '123 Main St, New York', '555-1234', 'john.doe@example.com'),
(2, 'Gale', 'Dekarios', '1985-08-22', '456 Oak Ave, Los Angeles', '555-5678', 'jane.smith@example.com'),
(3, 'Wyll', 'Ravengard', '1995-02-10', '789 Elm St, Chicago', '555-9876', 'robert.j@example.com');
