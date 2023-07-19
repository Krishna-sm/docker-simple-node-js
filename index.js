const express = require("express");
const app = express();

app.get("/",(req,res)=>{
    res.send("<h1>i am Awasome</h1>");
})

app.listen(3000,()=>{
    console.log(`the app is listen at http://localhost:3000`)
})