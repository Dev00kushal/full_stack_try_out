const jokesData = [];

const addJokes = (req, res) => {
  const { title, description } = req.body;
  const newJoke = {
    id: jokesData.length + 1,
    title,
    description,
  };
  jokesData.push(newJoke);
  console.log("Data:", newJoke);
  res.status(200).json({
    status_code: 200,
    message: "Joke added successfully",
    joke: newJoke,
  });
};

module.exports = {
  addJokes,
};
