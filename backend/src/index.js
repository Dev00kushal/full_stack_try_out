const express = require("express");
const app = express();
const jokesRoutes = require("./src/routes/jokesRoutes");

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.use("/api", jokesRoutes);

const PORT = process.env.PORT || 2000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
