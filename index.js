const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/healthy', (req, res) => res.status(200).send("OK-Success"))
app.get('/unhealthy', (req, res) => res.status(500).send("failed"))
app.get('/', (req, res) => res.send('Hello world del api con express'))

app.listen(PORT, () => console.log(`App corriendo en el puerto ${PORT}`));