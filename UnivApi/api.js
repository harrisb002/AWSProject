const koa = require('koa');
const bodyparser = require('koa-bodyparser');
const koajson = require('koa-json');
const defaultRouter = require('./routes/default');
const koaServer = new koa();
const API_PORT = '8049';

koaServer.use(async (ctx, next) => {
    await next();
    const rs = ctx.response.get('X-Response-Time');
    console.log(`Type: ${ctx.method} Path: ${ctx.url} Time: ${rs}`);
});

koaServer.use(async (ctx, next) => {
    const start = Date.now();
    await next();
    const ms = Date.now() - start;
    ctx.set('X-Response-Time', `${ms} ms`);

    console.log('4');
});

koaServer.use(async (ctx, next) => {
    try {
        await next()
    } catch(err) {
        console.log(`There was an error in the request response stream!`);
    }
});

koaServer.use(bodyparser());
koaServer.use(koajson());

defaultRouter(koaServer);

koaServer.listen(API_PORT, () => {
    console.log(`Listening on: ${API_PORT}`);
});