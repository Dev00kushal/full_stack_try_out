/**
 Controller vaneko yesto khalko file ho ni jasma cheii hamile logic lekne garxam 
 write code to handle the data or let me say the incoming requests and responses for the client.


 ya euta example cha :
    jokes add garna ko lagi euta function banako cha yesle uta bata(frontend) ayeko request lincha ani teslai cheii save gardincha backend ma 
    ani save huna ko lagi networking ko through huncha haina ani tesma aba status code cheii 200 cha vane matrai procedd garxa natra save hunna
    Ahile ko data base kehii chaina so yo ta array ma save vaircha ani print garira chu poxi mongodb ma halchu!!!!!!! 
 */


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

const getJokes = (_,res) => {
  if(jokesData.length >0){
    res.status(200).send({
      'status_code' : 200,
      'allJokes' : jokesData, 
    })
  }else{
    res.status(200).send({
      'status_code' : 200,
      'allJokes' : [], 
    })
  }


}
module.exports = {
  addJokes,
  getJokes
};
