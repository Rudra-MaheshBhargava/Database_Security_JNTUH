INSERT INTO time_slot
(time_slot_id, day, start_time, end_time)
VALUES
('T1', 'Monday', '09:00:00', '10:00:00'),
('T2', 'Tuesday', '10:00:00', '11:00:00'),
('T3', 'Wednesday', '11:00:00', '12:00:00'),
('T4', 'Thursday', '12:00:00', '13:00:00');

SELECT * FROM university.time_slot;