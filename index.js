/*const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello World2!');
});

app.get("/health", (_req, res) => {
  res.send("Everything's good!");
});


const server = app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

module.exports = server;
*/

const express = require('express');
const app = express();
const port = 3000;

// Default route
app.get('/', (req, res) => {
  res.send('Hello World2!');
});

// Health check route
app.get("/health", (_req, res) => {
  res.send("Everything's good!");
});

// New route for the custom message
app.get('/devops', (_req, res) => {
  res.send("This is DevOps Project done as a group by\nBhavani\nShravya\nVakula\nDeepak");
});

// Start the server
const server = app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

module.exports = server;
