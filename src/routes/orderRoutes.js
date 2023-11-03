import express from 'express'
import { setOrder, getListOrder } from '../controllers/orderController.js'

const OrderRoutes = express.Router()

OrderRoutes.post('/setOrder', setOrder)
OrderRoutes.get('/getListOrder', getListOrder)

export default OrderRoutes
