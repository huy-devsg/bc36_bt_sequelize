import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

const getListOrder = async (req, res) => {
  try {
    const data = await prisma.orders.findMany()
    res.send(data)
  } catch (error) {
    res.status(500).send('Lỗi khi lấy danh sách đánh giá: ' + error.message)
  }
}
const setOrder = async (req, res) => {
  let { food_id, user_id } = req.body

  try {
    const newData = { food_id, user_id }
    let result = await prisma.orders.create({ data: newData })
    res.status(201).send(result)
  } catch (error) {
    res.status(500).send('Lỗi khi thêm đánh giá: ' + error.message)
  }
}
export { getListOrder, setOrder }
