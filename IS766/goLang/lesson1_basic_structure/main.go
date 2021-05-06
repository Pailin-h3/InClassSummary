// to compile and run type in terminal => go run <filename.go>
// to compile(convert) to .exe type in terminal => go build <filename.go>
// Next Step: try Gin Framework
package main

import "fmt"

func main() {
	////////////////////////////////////////////
	// if len(os.Args) != 2 {  // work as scanf that must put when run program => main.go <variable>
	// 	os.Exit(1)
	// }
	// fmt.Println("it's over", os.Args[1])

	////////////////////////////////////////////
	// var power int = 9000 //cannot use same varieable name
	// p := 8000 // can also define var like this (short version)
	// fmt.Printf("%d\n", power)
	// fmt.Printf("%d\n", p)

	//////////////////////////////////////////////
	// power := 1000
	// name, power := "Goku", 9000 // can override like this (if atleast one is new)
	// fmt.Printf("%s's power is over %d !\n", name, power)

	/////////////// using function ////////////////////
	// value, exist := power("goku") //cannot declair var but not use if no plan to use => _ as var name
	// if exist {
	// 	fmt.Println(value)
	// }

	//////////// using structure /////////////////////
	goku := Saiyan{
		Name:  "Goku",
		Power: 9000,
	}
	// vegeta := Saiyan{"Vegeta", 7000}
	var gohan Saiyan // or gohan := new(Saiyan)
	gohan.Name = "Gohan"
	gohan.Power = 2800
	gohan.Father = &goku
	fmt.Println(gohan.Father.Name)
	// fmt.Println(goku.Name)
	// fmt.Println(vegeta.Name)
	// fmt.Println(gohan.Name)

	/////////////  making variable change  ////////////////
	// Super(goku)
	// fmt.Println(goku.Power) // goku power not change cause function not recieve it just copy it
	// goten := &Saiyan{"goten", 3000}  // & => to define var as address
	// Supers(goten)
	// fmt.Println(goten.Power) // goten power now changed

	////////////  using function in structure  //////////////
	goku.Super()
	fmt.Println(goku.Power)
	goten := NewSaiyan("Goten", 9000)
	fmt.Println(goten.Name)
}

//////// define function ////////
// func log(message string){
// 	return
// }
// func add(a int, b int) int{
// 	return a+b
// }
// func power(name string) (int, bool) {
// 	fmt.Println(name)
// 	return 9000, true
// }

// func Super(s Saiyan) {  // to recieve parameter as copy
// 	s.Power += 10000
// }
// func Supers(s *Saiyan) {  // to recieve parameter as address
// 	s.Power += 10000
// }

//////////  structure(or class?)  /////////////
type Saiyan struct {
	Name   string
	Power  int
	Father *Saiyan // this is other Saiyan as address
}

type Person struct {
	*Saiyan // Person is inherite Saiyan
}

////////////  function on structure  ////////////////
func (s *Saiyan) Super() { // this function is used by Saiyan
	s.Power += 10000
}
func NewSaiyan(name string, power int) *Saiyan { // work as factory
	return &Saiyan{
		Name:  name,
		Power: power,
	}
}
