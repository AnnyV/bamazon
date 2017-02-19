var mysql = require('mysql');
var inquirer = require('inquirer');
var mysql = require('mysql');
require('console.table');

var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'bamazon_db'
});




connection.connect();

function placeOrder(id, quantity) {
  var numAvailable;
  var idNum = parseInt(id);
  var quan = parseInt(quantity);

  connection.query('SELECT stock_quantity, product_name, price from products where id = ?', [id], function(error, results, fields) {
    if (error) throw error;
    numAvailable = parseInt(results[0].stock_quantity);
    if (quan > numAvailable) {
      console.log('Sorry insuficient stock, we just have ' + numAvailable + ' availble.')
    } else {
      console.log("Your oder for " + quan + " of " + results[0].product_name + " for $" + (quan * results[0].price) + " was placed.");
      connection.query('UPDATE products SET stock_quantity = stock_quantity - ? where id = ?', [quan, idNum], function(error, results, fields) {
        if (error) throw error;
      });
      connection.query('INSERT INTO sales(product_id, quantity_purchased) VALUES(?,?) ', [idNum, quan], function(error, results, fields) {
        if (error) throw error;
      });
    }
  });
}

//-------------program starts executing here------------------

connection.query('SELECT id, product_name, price from products', function(error, results, fields) {
  if (error) throw error;
  console.table(results);
});
setTimeout(function() {
  inquirer.prompt([{
      type: "input",
      name: "id",
      message: "insert product id that you want to purchase"
    },

    {
      type: "input",
      name: "quantity",
      message: "please insert how many units you want to purchase"
    }

  ]).then(function(data) {
    placeOrder(data.id, data.quantity);

    //connection.end();
  });
}, .5 * 1000);

// function selectTable(table){
//     connection.query('SELECT * from ' + table, function (error, results, fields) {
//       if (error) throw error;
//       console.log('The solution is: ', results);
//     });
// }
