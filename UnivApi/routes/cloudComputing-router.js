const CloudComputingController = require('../controller/cloudComputing-controller');
const CloudComputingRouter = require('koa-router')({
    prefix: '/cloudComputing'
});

CloudComputingRouter.get('/', CloudComputingController.all);
CloudComputingRouter.get('/:id', CloudComputingController.byId);
CloudComputingRouter.put('/:id', CloudComputingController.update);
CloudComputingRouter.post('/', CloudComputingController.add)
CloudComputingRouter.delete('/:id', CloudComputingController.delete);

module.exports = CloudComputingRouter;