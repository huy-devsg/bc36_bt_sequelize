import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

const getListRate = async (req, res) => {
  try {
    const data = await prisma.rate_restaurant.findMany()
    res.send(data)
  } catch (error) {
    res.status(500).send('Lỗi khi lấy danh sách đánh giá: ' + error.message)
  }
}
const getListRateByResID = async (req, res) => {
  const { resID } = req.params
  try {
    const data = await prisma.rate_restaurant.findMany({
      where: {
        res_id: parseInt(resID),
      },
    })
    res.send(data)
  } catch (error) {
    res
      .status(500)
      .send('Lỗi khi lấy danh sách đánh giá theo nhà hàng: ' + error.message)
  }
}
const getListRateByUserID = async (req, res) => {
  const { userID } = req.params
  try {
    const data = await prisma.rate_restaurant.findMany({
      where: {
        user_id: parseInt(userID),
      },
    })
    res.send(data)
  } catch (error) {
    res
      .status(500)
      .send('Lỗi khi lấy danh sách đánh giá theo users: ' + error.message)
  }
}
const setRate = async (req, res) => {
  let { rate_comment, user_id, res_id } = req.body
  try {
    const newData = { rate_comment, user_id, res_id }
    let result = await prisma.rate_restaurant.create({ data: newData })
    res.status(201).send(result)
  } catch (error) {
    res.status(500).send('Lỗi khi thêm đánh giá: ' + error.message)
  }
}
export { getListRate, getListRateByResID, getListRateByUserID, setRate }
