import express from 'express'

import resLikeRoutes from './resLikeRoutes.js'
import resRateRoutes from './resRateRoutes.js'
import OrderRoutes from './orderRoutes.js'

const rootRoutes = express.Router()
rootRoutes.use('/resLike', resLikeRoutes)
rootRoutes.use('/resRate', resRateRoutes)
rootRoutes.use('/orders', OrderRoutes)

export default rootRoutes
