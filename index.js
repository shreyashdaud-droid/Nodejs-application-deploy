import express from 'express';

const app = express();
const PORT = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.json({ status: 'success', message: 'CI/CD Pipeline Running! and deployed'});
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server started on port ${PORT}`);
});