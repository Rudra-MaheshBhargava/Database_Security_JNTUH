create database university;

USE university;

CREATE TABLE department (
    dept_name VARCHAR(50) PRIMARY KEY,
    building VARCHAR(50),
    budget DECIMAL(12,2)
);

CREATE TABLE classroom (
    building VARCHAR(50),
    room_no VARCHAR(10),
    capacity INT,
    PRIMARY KEY (building, room_no)
);

CREATE TABLE time_slot (
    time_slot_id VARCHAR(10),
    day VARCHAR(10),
    start_time TIME,
    end_time TIME,
    PRIMARY KEY (time_slot_id, day, start_time)
);

CREATE TABLE student (
    ID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_name VARCHAR(50),
    tot_cred INT DEFAULT 0,
    FOREIGN KEY (dept_name)
        REFERENCES department(dept_name)
);

CREATE TABLE instructor (
    ID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_name VARCHAR(50),
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_name)
        REFERENCES department(dept_name)
);

CREATE TABLE course (
    course_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    dept_name VARCHAR(50),
    credits INT,
    FOREIGN KEY (dept_name)
        REFERENCES department(dept_name)
);

CREATE TABLE section (
    course_id VARCHAR(10),
    sec_id VARCHAR(8),
    semester VARCHAR(10),
    year INT,
    building VARCHAR(50),
    room_no VARCHAR(10),
    time_slot_id VARCHAR(10),
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id)
        REFERENCES course(course_id),
    FOREIGN KEY (building, room_no)
        REFERENCES classroom(building, room_no)
);

CREATE TABLE prereq (
    course_id VARCHAR(10),
    prereq_id VARCHAR(10),
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id)
        REFERENCES course(course_id),
    FOREIGN KEY (prereq_id)
        REFERENCES course(course_id)
);

CREATE TABLE teaches (
    ID VARCHAR(10),
    course_id VARCHAR(10),
    sec_id VARCHAR(8),
    semester VARCHAR(10),
    year INT,
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID)
        REFERENCES instructor(ID),
    FOREIGN KEY (course_id, sec_id, semester, year)
        REFERENCES section(course_id, sec_id, semester, year)
);

CREATE TABLE takes (
    ID VARCHAR(10),
    course_id VARCHAR(10),
    sec_id VARCHAR(8),
    semester VARCHAR(10),
    year INT,
    grade VARCHAR(2),
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID)
        REFERENCES student(ID),
    FOREIGN KEY (course_id, sec_id, semester, year)
        REFERENCES section(course_id, sec_id, semester, year)
);

CREATE TABLE advisor (
    s_id VARCHAR(10) PRIMARY KEY,
    i_id VARCHAR(10),
    FOREIGN KEY (s_id)
        REFERENCES student(ID),
    FOREIGN KEY (i_id)
        REFERENCES instructor(ID)
);
