const CloudComputingRouter = require('./cloudComputing-router');
const ClientRouter = require('./client-router');
const defaultRouter = require('koa-router')({
    prefix: '/api/v1'
});

defaultRouter.get('/', (ctx)=> {
    ctx.body = 'Default route hit!';
});

defaultRouter.use(
    ClientRouter.routes(),
    CloudComputingRouter.routes() 
)


module.exports = (koaServer) => {
    koaServer.use(defaultRouter.routes())
};