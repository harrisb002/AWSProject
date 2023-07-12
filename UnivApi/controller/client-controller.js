const db = require('../database/AWS-db');

class ClientController {
    static async all(ctx) {
        try {
            return new Promise((resolve, reject)=>{
                const query = 'SELECT * FROM Client;'
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
            console.log(`Error in Client Controller: ${error} `);
        }
    }


    static async byId(ctx) {
        try {
            return new Promise((resolve, reject)=>{
                db.query({
                    sql: 'SELECT * FROM Client WHERE ClientID = ?;',
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
            console.log(`Error in Client Controller: ${error}`);
        }
    }
}

module.exports = ClientController;