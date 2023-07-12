const clientController = require('../controller/client-controller');
const clientRouter = require('koa-router')({
    prefix: '/client'
});
/*
    The Follwoing route paths can be reached at:
        http://localhost:<your port>/api/v1/instructor
        http://localhost:<your port>/api/v1/instructor/<some id>
*/ 

clientRouter.get('/', clientController.all);
clientRouter.get('/:id', clientController.byId);

module.exports = clientRouter;