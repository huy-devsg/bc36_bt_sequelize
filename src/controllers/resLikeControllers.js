import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

const getListLike = async (req, res) => {
  try {
    const data = await prisma.like_restaurant.findMany()
    res.send(data)
  } catch (error) {
    res.status(500).send('Lỗi khi lấy danh sách like: ' + error.message)
  }
}
const getListDislike = async (req, res) => {
  try {
    const data = await prisma.like_restaurant.findMany({
      where: {
        dis_like: true,
      },
    })
    res.send(data)
  } catch (error) {
    res.status(500).send('Lỗi khi lấy danh sách dislike: ' + error.message)
  }
}
const getListLikeByResID = async (req, res) => {
  const { resID } = req.params
  try {
    const data = await prisma.like_restaurant.findMany({
      where: {
        res_id: parseInt(resID),
      },
    })
    res.send(data)
  } catch (error) {
    res
      .status(500)
      .send('Lỗi khi lấy danh sách like theo nhà hàng: ' + error.message)
  }
}
const getListLikeByUserID = async (req, res) => {
  const { userID } = req.params
  try {
    const data = await prisma.like_restaurant.findMany({
      where: {
        user_id: parseInt(userID),
      },
    })
    res.send(data)
  } catch (error) {
    res
      .status(500)
      .send('Lỗi khi lấy danh sách like theo nhà hàng: ' + error.message)
  }
}
export { getListLike, getListDislike, getListLikeByResID, getListLikeByUserID }
