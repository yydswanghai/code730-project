import Router from '@koa/router'
import { ParameterizedContext } from 'koa'
import { getBooks, getBookById, addBook } from '../../services/bookService'
import { getSuccess } from '../getSendResult'

const router = new Router({
    prefix: '/api/book'
})

router.get('/', async (ctx: ParameterizedContext) => {
    const page = Number(ctx.query.page) || 1;
    const pageSize = Number(ctx.query.pageSize) || 10;
    const result = await getBooks({ page, pageSize })
    ctx.body = getSuccess(result)
})

router.get('/:id', async (ctx: ParameterizedContext) => {
    const result = await getBookById(ctx.params.id)
    ctx.body = getSuccess(result)
})

router.post('/', async (ctx: ParameterizedContext) => {
    const result = await addBook(ctx.request.body)
    ctx.body = getSuccess(null)
})

export default router.routes()