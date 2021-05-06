// compile to js type this in cmd => tsc {filename}.ts
// then can run .js file in html or any file
// tsc is used to check type of variable that thrown everywhere

type Category = "Hight" | "Medium" | "Low"; //as Enum in Dart
function aleart(cat: Category){
    return cat;
}
// console.log(aleart("Hight"));

////////////////////////////////////////////////////////////////////////////////////////////

class Student {
    fullname: string;
    constructor(
        public firstname: string,
        public middleInitial: string,
        public lastname: string
    ){
        this.fullname = firstname + " " + middleInitial + " " + lastname;
    }
}
interface Person{ // class
    firstname: string;
    lastname: string;
}

function greeter(person: Student){ // can set type of var where js just recieve all types
    return "Hello, " + person.firstname + " " + person.lastname;
}

let user: Person = {firstname: "Pailin", lastname: "Lim"};   // define variable
let st = new Student("Pailin", "J", "Lim");

// console.log(greeter(st)); //common print
document.body.textContent = aleart("Hight") + " || " + greeter(st); // sent to brawser **can run on brawser only