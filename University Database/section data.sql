USE University;

INSERT INTO section
(course_id, sec_id, semester, year, building, room_no, time_slot_id)
VALUES
('CS101', 'A', '1', 2025, 'Block A', '101', 'T1'),
('CS101', 'B', '2', 2025, 'Block A', '101', 'T2'),
('CS102', 'A', '3', 2025, 'Block A', '102', 'T3'),
('CS102', 'B', '4', 2025, 'Block A', '102', 'T4'),
('IT101', 'A', '5', 2025, 'Block B', '201', 'T1'),
('ME101', 'A', '6', 2025, 'Block C', '301', 'T2'),
('EC101', 'A', '7', 2025, 'Block B', '202', 'T3'),
('CE101', 'A', '8', 2025, 'Block C', '302', 'T4');

SELECT * from university.section;