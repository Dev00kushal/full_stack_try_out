const express = require("express");
const router = express.Router();
const jokesController = require("../controllers/jokesController");

router.post("/add_jokes", jokesController.addJokes);

module.exports = router;
