import express from 'express'
import {
  getListLike,
  getListDislike,
  getListLikeByResID,
  getListLikeByUserID,
} from '../controllers/resLikeControllers.js'

const resLikeRoutes = express.Router()

resLikeRoutes.get('/getListLike', getListLike)
resLikeRoutes.get('/getListDislike', getListDislike)
resLikeRoutes.get('/getListLikeByResID/:resID', getListLikeByResID)
resLikeRoutes.get('/getListLikeByUserID/:userID', getListLikeByUserID)

export default resLikeRoutes
