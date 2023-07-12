const db = require('../database/AWS-db')

class CloudComputingController {
    static async all(ctx) {
        try {
            return new Promise((resolve, reject)=>{
                const query = 'SELECT * FROM CloudComputing;'
                db.query(query, (err, res)=>{
                    if(err){
                        reject(err);
                    }

                    ctx.body = res;
                    ctx.status = 200;
                    resolve();
                });
            });
        } catch(error) {
            console.log('Error in CloudComputing Controller.');
        }
    }

    static async byId(ctx) {
        try {
            return new Promise((resolve, reject)=>{

                db.query({
                    sql: 'SELECT * FROM CloudComputing WHERE ServiceID = ?;',
                    values: [ctx.params.id]
                }, (err, res)=>{
                    if(err){
                        ctx.body = err;
                        ctx.status = 500;
                        reject(err);
                    }

                    ctx.body = res;
                    ctx.status = 200;
                    resolve();
                });
            });
        } catch(error) {
            console.log(`Error in CloudComputing Controller: ${error}`);
        }
    }

    static async delete(ctx) {
        try {
            return new Promise((resolve, reject)=>{

                db.query({
                    sql: 'DELETE FROM CloudComputing WHERE ServiceID = ?;',
                    values: [ctx.params.id]
                }, (err, res)=>{
                    if(err){
                        ctx.body = err;
                        ctx.status = 500;
                        reject(err);
                    }

                    ctx.body = `Service with ID [${ctx.params.id}] deleted.`;
                    ctx.status = 200;
                    resolve();
                });
            });
        } catch(error) {
            console.log(`Error in CloudComputing Controller: ${error}`);
        }
    }


    static async add(ctx) {
        try {
            return new Promise((resolve, reject)=>{
                const computing = ctx.request.body;
                const query = `
                    INSERT INTO CloudComputing VALUES
                    (?, ?, ?, ?);
                `

                db.query({
                    sql: query,
                    values: [computing.id, computing.id2, computing.services, computing.cost]
                }, (err, res)=>{
                    if(err){
                        ctx.body = err;
                        ctx.status = 500;
                        reject(err);
                    }

                    ctx.body = computing;
                    ctx.status = 200;
                    resolve();
                });
            });
        } catch(error) {
            console.log(`Error in CloudComputing Controller: ${error}`);
        }
    }

    static async update(ctx) {
        try {
            return new Promise((resolve, reject)=>{
                const computing = ctx.request.body;
                const query = `
                    UPDATE BK_Student
                    SET ComputingID = ?,
                        services = ?,
                        cost = ?
                    WHERE ServiceID = ?;
                `

                db.query({
                    sql: query,
                    values: [computing.id, computing.servies, computing.cost, ctx.params.id]
                }, (err, res)=>{
                    if(err){
                        ctx.body = err;
                        ctx.status = 500;
                        reject(err);
                    }

                    ctx.body = computing;
                    ctx.status = 200;
                    resolve();
                });
            });
        } catch(error) {
            console.log(`Error in CloudComputing Controller: ${error}`);
        }
    }
}

module.exports = CloudComputingController;