const express = require('express');
const app = express();
const PORT = process.env.PORT || 5000;

app.use(express.json());

app.get('/', (req, res) => {
    res.send('Land management system is operational!');
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});