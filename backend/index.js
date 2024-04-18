const express = require("express");
const app = express();

app.use(express.json()); 
app.use(express.urlencoded({ extended: true })); 

const jokesData = [];

app.listen(2000, () => {
  console.log("Connected to server");
});

// post api

app.post("/api/add_jokes", (request, response) => {

  const jData = {
    "id": jokesData.length + 1,
    "title": request.body.title,
    "description": request.body.description,
  };
  jokesData.push(jData);
  console.log("Data:", jData);

  response.status(200).send({
    status_code: 200,
    message: "jokes added sucessfully",
    jokes: jData,
  });
});
