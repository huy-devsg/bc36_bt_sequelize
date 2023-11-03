import express from 'express'
import {
  getListRate,
  getListRateByResID,
  getListRateByUserID,
  setRate,
} from '../controllers/resRateController.js'

const resRateRoutes = express.Router()

resRateRoutes.get('/getListRate', getListRate)
resRateRoutes.get('/getListRateByResID/:resID', getListRateByResID)
resRateRoutes.get('/getListRateByUserID/:userID', getListRateByUserID)
resRateRoutes.post('/setRate', setRate)

export default resRateRoutes
