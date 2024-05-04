const yargs = require("yargs")
const nuevo = require("./add");

let command = yargs.argv._[0];

let item = yargs.argv.item;
let price = yargs.argv.price;


if(command === "add"){
    console.log(`Ingresado: ${command} 👍`);
    if(item && price){
        nuevo.add(item, price);
    }

}else if(command === "remove"){
    console.log(`Ingresado: ${command} 👍`);
}

// npm run dev  add --item=tomate --price=3.5
// https://www.youtube.com/watch?v=QPlwWuM3UIs