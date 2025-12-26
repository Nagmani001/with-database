import express, { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const app = express();
const prisma = new PrismaClient();

app.use(express.json());


app.post("/todo", async (req: Request, res: Response) => {
  const { title, description } = req.body;

  await prisma.todo.create({
    data: {
      title,
      description
    }
  })

  res.json({
    msg: "todo pused successfully"
  });
});



app.get("/todos", async (req: Request, res: Response) => {
  const todos = await prisma.todo.findMany();
  res.json({
    todos
  });
});

app.listen(3000, () => {
  console.log("server is running on port 3000");
})
