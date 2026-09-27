const express = require('express');
const cors = require('cors');
require('dotenv').config();
const db = require('./db');

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// 1. Health check endpoint
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', service: 'GradePulse API', timestamp: new Date() });
});

// 2. Fetch all courses
app.get('/api/courses', async (req, res) => {
  try {
    const { rows } = await db.query('SELECT * FROM courses ORDER BY created_at DESC');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to fetch courses' });
  }
});

// 3. Create a new course
app.post('/api/courses', async (req, res) => {
  const { course_code, course_name, target_grade } = req.body;
  try {
    const { rows } = await db.query(
      'INSERT INTO courses (course_code, course_name, target_grade) VALUES ($1, $2, $3) RETURNING *',
      [course_code, course_name, target_grade || 90.0]
    );
    res.status(201).json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create course' });
  }
});

// 4. Fetch specific course details with categories and scores
app.get('/api/courses/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const courseRes = await db.query('SELECT * FROM courses WHERE id = $1', [id]);
    if (courseRes.rows.length === 0) {
      return res.status(404).json({ error: 'Course not found' });
    }

    const categoriesRes = await db.query('SELECT * FROM category_weights WHERE course_id = $1', [id]);
    
    res.json({
      course: courseRes.rows[0],
      categories: categoriesRes.rows
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to fetch course details' });
  }
});

app.listen(PORT, () => {
  console.log(`GradePulse server running on port ${PORT}`);
});