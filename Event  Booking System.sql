CREATE DATABASE EventBookingSystem;
USE EventBookingSystem;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    event_date DATE,
    event_time TIME,
    total_seats INT,
    available_seats INT,
    price DECIMAL(10,2)
);


CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    event_id INT,
    number_of_tickets INT NOT NULL,
    total_amount DECIMAL(10,2),
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (event_id) REFERENCES Events(event_id) ON DELETE CASCADE
);


CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    payment_method VARCHAR(50),
    payment_status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    payment_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
);

desc Payments;


INSERT INTO Users (full_name, email, password, phone) VALUES
('Sai Patel', 'joseph02@jones.com', '4tFdM%uN+B', '001-190'),
('Krishna Iyer', 'xsanchez@gmail.com', 'fa#5JmR75%', '001-281'),
('Aditya Reddy', 'bruce69@kennedy.com', 'sQGhmz7q$n', '706-694'),
('Diya Nair', 'torresdavid@edwards.com', 'wXYJ1L4L&9', '881-517'),
('Ananya Sharma', 'michaelfranco@gmail.com', 'r0T$CPLQ0G', '972-643'),
('Kavya Das', 'nicholaslittle@johnson.com', 'W%47ZJ9#Dg', '529-377'),
('Aarav Mehta', 'richard71@gmail.com', 'ZHZLxppWy2', '408.951'),
('Ishita Bhatia', 'kevinrichardson@phillips.com', 'JbHZo*K4&!', '086-154'),
('Vivaan Verma', 'murphylisa@bryan.com', 'rhr7%T@b5A', '595.507'),
('Meera Kapoor', 'williscrystal@hotmail.com', 'XpHLqfD8#b', '001-105'),
('Krishna Reddy', 'allison72@hotmail.com', 'Z2tHZ0DWY!', '873.960'),
('Ananya Verma', 'adam07@wells.org', 'QAxzPv73!#', '050-648'),
('Sai Bhatia', 'fergusonbrian@gmail.com', 'ZtxK%N71&v', '672-787'),
('Aditya Das', 'roberto77@barnes.com', 'JW$07Ex1hj', '640.089'),
('Diya Patel', 'jonesjessica@wells.com', 'pLpTUbJYu7', '001-645');





INSERT INTO Events (title, description, location, event_date, event_time, total_seats, available_seats, price) VALUES
('Innovative systemic frame', 'Half financial order until wife data democratic. South create ask statement guess local.', 'Jaipur', '2025-05-13', '08:39:50', 155, 155, 506.74),
('Re-engineered homogeneous hub', 'Quickly enter TV. Protect learn floor rate within close skill. Control our feeling write quality.', 'Hyderabad', '2025-05-04', '18:32:34', 72, 72, 536.45),
('Team-oriented responsive forecast', 'Partner left board respond. Oil run subject quite sort item.', 'Delhi', '2025-05-11', '20:41:11', 92, 92, 775.11),
('Cross-platform heuristic firmware', 'Upon over forward very tend run according.', 'Mumbai', '2025-04-28', '16:14:06', 153, 153, 986.37),
('Multi-channeled fault-tolerant middleware', 'Model provide single develop civil already minute.', 'Pune', '2025-05-14', '08:17:57', 126, 126, 752.65),
('Decentralized zero administration success', 'Myself feel response morning.', 'Chennai', '2025-04-25', '17:10:49', 151, 151, 802.48),
('Managed logistical encryption', 'Already local involve notice. Support receive away feel down.', 'Ahmedabad', '2025-04-21', '13:30:17', 167, 167, 234.19),
('Enhanced system-worthy methodology', 'Term voice though performance.', 'Bangalore', '2025-05-06', '14:11:00', 143, 143, 255.73),
('Persistent executive synergy', 'Responsibility create store training myself.', 'Chandigarh', '2025-05-03', '10:41:37', 133, 133, 572.90),
('Devolved incremental attitude', 'Performance financial receive serious big arrive.', 'Hyderabad', '2025-05-09', '12:49:16', 199, 199, 289.67),
('Distributed methodical portal', 'Protect perform message find.', 'Jaipur', '2025-04-30', '11:37:45', 87, 87, 310.40),
('User-friendly tangible project', 'Beautiful big theory technology eight.', 'Kolkata', '2025-05-02', '08:44:29', 198, 198, 684.59),
('Enterprise-wide zero-defect capacity', 'Structure book animal prevent.', 'Bangalore', '2025-04-27', '14:30:01', 56, 56, 171.44),
('Total bottom-line matrix', 'Religious seat significant very.', 'Delhi', '2025-04-26', '19:01:00', 189, 189, 435.88),
('Centralized well-modulated info-mediaries', 'Half surface interview population.', 'Chennai', '2025-04-22', '17:33:49', 64, 64, 936.15);


INSERT INTO Bookings (user_id, event_id, number_of_tickets, total_amount) VALUES
(11, 12, 5, 4899.25),
(1, 15, 5, 588.60),
(3, 1, 2, 1335.62),
(4, 4, 3, 2875.68),
(5, 5, 1, 214.33),
(6, 7, 4, 3214.68),
(7, 2, 2, 1138.64),
(8, 3, 3, 1208.25),
(9, 6, 1, 326.84),
(10, 9, 5, 3645.60),
(12, 10, 1, 300.50),
(13, 11, 2, 822.20),
(14, 13, 2, 1107.30),
(15, 8, 4, 2501.96),
(2, 14, 3, 2066.70);



INSERT INTO Payments (booking_id, payment_method, payment_status) VALUES
(1, 'UPI', 'Completed'),
(2, 'Net Banking', 'Failed'),
(3, 'Credit Card', 'Completed'),
(4, 'PayPal', 'Pending'),
(5, 'UPI', 'Completed'),
(6, 'Debit Card', 'Completed'),
(7, 'UPI', 'Pending'),
(8, 'Net Banking', 'Completed'),
(9, 'Credit Card', 'Failed'),
(10, 'Debit Card', 'Completed'),
(11, 'UPI', 'Completed'),
(12, 'PayPal', 'Completed'),
(13, 'Net Banking', 'Pending'),
(14, 'Credit Card', 'Completed'),
(15, 'Debit Card', 'Failed');


select * from Users;
select * from Events;
select * from Bookings;
select * from Payments;


-- joining queries  all bookings with user and events 


SELECT 
    B.booking_id,
    U.full_name,
    E.title AS event_title,
    B.number_of_tickets,
    B.total_amount,
    B.booking_time
FROM Bookings B
JOIN Users U ON B.user_id = U.user_id
JOIN Events E ON B.event_id = E.event_id;




  -- joining Get all payment info with user and events
  
  
SELECT 
    P.payment_id,
    U.full_name,
    E.title AS event_title,
    P.payment_method,
    P.payment_status
FROM Payments P
JOIN Bookings B ON P.booking_id = B.booking_id
JOIN Users U ON B.user_id = U.user_id
JOIN Events E ON B.event_id = E.event_id;


-- insertions

INSERT INTO Users (full_name, email, password, phone)
VALUES ('Anita Sharma', 'anita@example.com', 'secure123', '9876');
select * from Users;

-- add new event
INSERT INTO Events (title, description, location, event_date, event_time, total_seats, available_seats, price)
VALUES ('Startup Expo 2025', 'Tech & startup showcase', 'Delhi', '2025-06-01', '10:00:00', 200, 200, 499.00);

select * from Events;

-- deletions

DELETE FROM Users WHERE user_id = 15;
select * from Users;


-- updation

UPDATE Events
SET available_seats = available_seats - 2
WHERE event_id = 1;

select * from Events;


UPDATE Payments
SET payment_status = 'Completed'
WHERE payment_id = 3;

select * from Payments;


UPDATE Users
SET phone = '90011'
WHERE user_id = 2;
  
  select * from Users;
  
  
  -- Aggregations 
  
  
--   Total Users Registered
  SELECT COUNT(*) AS total_users FROM Users;


-- Total Bookings
SELECT COUNT(*) AS total_bookings FROM Bookings;


 -- Average Ticket Price Across Events
SELECT AVG(price) AS avg_ticket_price FROM Events;

-- Event with Maximum Ticket Price
SELECT title, price FROM Events ORDER BY price DESC LIMIT 1;


SELECT payment_status, COUNT(*) AS total
FROM Payments
GROUP BY payment_status;


-- Selections 

--  Events in Delhi
SELECT * FROM Events WHERE location = 'Delhi';


-- Bookings with more than 3 tickets
SELECT * FROM Bookings WHERE number_of_tickets > 3;


-- Upcoming Events (sorted by date)
SELECT * FROM Events ORDER BY event_date ASC;










