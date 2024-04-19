/** 
 Esko ko ta naam nai kati simple cha rosu hera ta yo vaneko cheii routes ho simple
 timile afno vaye bharko app ko routes haru  yeta .post() function ma managae garchau ani controller haru lai rakhchau tyo function ko vitra
 */


// yo cheii aba optmial tarika hola maile cheii bolako bolai chu 
const express = require("express");

// intilizing router 
const router = express.Router();

// joke ko controller lai bolayo 
const jokesController = require("../controllers/jokesController");

// yeslai yo route /add_jokes vanne ma post garyo 
router.post("/add_jokes", jokesController.addJokes);
router.get("/get_jokes", jokesController.getJokes);
router.put("/update/:id", jokesController.putJokes);

// router lai export garyo aru thau ma ni chaina router tesaile
module.exports = router;
