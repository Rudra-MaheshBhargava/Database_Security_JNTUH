USE University;

INSERT INTO department (dept_name, building, budget) VALUES
('Comp. Sci.', 'Taylor', 100000),
('Physics', 'Watson', 90000),
('Mathematics', 'Chandler', 80000),
('Biology', 'Painter', 70000);

USE University;

UPDATE department
SET dept_name = 'CSE',
    building = 'Block A',
    budget = 100000
WHERE dept_name = 'Comp. Sci.';

UPDATE department
SET dept_name = 'IT',
    building = 'Block B',
    budget = 90000
WHERE dept_name = 'Physics';

UPDATE department
SET dept_name = 'MECH',
    building = 'Block C',
    budget = 80000
WHERE dept_name = 'Mathematics';

UPDATE department
SET dept_name = 'ECE',
    building = 'Block A',
    budget = 95000
WHERE dept_name = 'Biology';

-- SELECT * FROM university.department;

INSERT INTO department (dept_name, building, budget)
VALUES ('CIVIL', 'Block B', 85000);

SELECT * FROM university.department;