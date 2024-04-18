const express = require("express");
const app = express();
const jokesRoutes = require("../src/routes/jokesRoute");

// yp cheii basically used for decoding ani encoding aru ta cheii chaina esma 
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.use("/api", jokesRoutes);

// yedi env ma port cha vane server bata nai port auxa ahile test ho tesaile baal vayena 2000 rakeko 
const PORT = process.env.PORT || 2000;

// yo cheii aba .listen ho yesma cheii hamile like afno port ma server open garna milxa 
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});