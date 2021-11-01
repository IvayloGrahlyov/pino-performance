const express = require('express');
const pino = require('pino');
const winston = require('winston');
var loggerWinston = winston.createLogger({
  level: 'info',
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json()
  ),
  transports: [
    new winston.transports.File({ filename: 'winston.log' })
  ]
});

// const loggerPino = pino({
//   transport: {
//       targets: [
//           {
//           level: 'info',
//           target: 'pino/file',
//           options: {
//               destination: './pino.log'
//           },
//         },
//       ]
//   }})

const stream = pino.destination({ dest: './pino.log', sync: false, minLength: 32768 })
const loggerPino = pino(stream)

const app = express();
app.use(express.json({limit: '500mb'}))
app.get('/', function(req, res) {
  res.send("Server online");
})

app.post('/test-winston', function(req, res, next) {
  const data = req.body;
  if (Array.isArray(data)) {
    data.forEach((d) => {
      loggerWinston.info(d);
    })
  } else {
    loggerWinston.info(data);
  }
  res.send('Complete\n');
});

app.post('/test-pino', function(req, res, next) {
  const data = req.body;
  if (Array.isArray(data)) {
    data.forEach((d) => {
      loggerPino.info(d);
    })
 } else {
    loggerPino.info(data);
  }
  res.send('Complete\n');
});

const port = process.env.port || 3000;

app.listen(port, () => console.log(`Listening on 127.0.0.1:${port}`));
