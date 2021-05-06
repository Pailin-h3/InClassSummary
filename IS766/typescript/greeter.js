// compile to js type this in cmd => tsc {filename}.ts
// tsc is used to check type of variable that thrown everywhere
function aleart(cat) {
    return cat;
}
// console.log(aleart("Hight"));
////////////////////////////////////////////////////////////////////////////////////////////
var Student = /** @class */ (function () {
    function Student(firstname, middleInitial, lastname) {
        this.firstname = firstname;
        this.middleInitial = middleInitial;
        this.lastname = lastname;
        this.fullname = firstname + " " + middleInitial + " " + lastname;
    }
    return Student;
}());
function greeter(person) {
    return "Hello, " + person.firstname + " " + person.lastname;
}
var user = { firstname: "Pailin", lastname: "Lim" }; // define variable
var st = new Student("Pailin", "J", "Lim");
// console.log(greeter(st)); //common print
document.body.textContent = aleart("Hight") + " || " + greeter(st); // sent to brawser **can run on brawser only
