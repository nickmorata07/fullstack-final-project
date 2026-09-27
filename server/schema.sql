-- GradePulse Database Schema

-- Drop tables if they exist to allow clean resets
DROP TABLE IF EXISTS assessment_scores CASCADE;
DROP TABLE IF EXISTS category_weights CASCADE;
DROP TABLE IF EXISTS courses CASCADE;

-- 1. Courses Table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    target_grade NUMERIC(5, 2) DEFAULT 90.00,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. Category Weights Table (e.g., Exams 40%, Quizzes 30%, Projects 30%)
CREATE TABLE category_weights (
    id SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses(id) ON DELETE CASCADE,
    category_name VARCHAR(50) NOT NULL,
    weight_percentage NUMERIC(5, 2) NOT NULL
);

-- 3. Assessment Scores Table
CREATE TABLE assessment_scores (
    id SERIAL PRIMARY KEY,
    category_id INT REFERENCES category_weights(id) ON DELETE CASCADE,
    item_name VARCHAR(100) NOT NULL,
    score NUMERIC(5, 2) NOT NULL,
    max_score NUMERIC(5, 2) NOT NULL DEFAULT 100.00
);

-- Sample Seed Data for Testing
INSERT INTO courses (course_code, course_name, target_grade)
VALUES ('CS-401', 'Application and Systems Integration', 92.00);

INSERT INTO category_weights (course_id, category_name, weight_percentage)
VALUES 
(1, 'Exams', 40.00),
(1, 'Quizzes', 30.00),
(1, 'Projects', 30.00);

INSERT INTO assessment_scores (category_id, item_name, score, max_score)
VALUES 
(1, 'Midterm Exam', 88.00, 100.00),
(2, 'Quiz 1', 95.00, 100.00),
(3, 'M8A1 Project Report', 100.00, 100.00);