import express, { Request, Response } from "express"

const app = express()
const PORT = 3000

// Basic route
app.get('/', (req: Request, res: Response) => {
  res.send('Hello, Express!')
})

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`)
})
