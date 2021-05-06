package main

import "fmt"

func main() {
	////////////  Array  ////////////////
	// scores := [4]int{9001, 9333, 212, 33}  // must fixed size
	// for index, value := range scores {
	// 	fmt.Printf("%d - %d\n", index, value)
	// }

	////////////  Slice => non fixed lengh Array  //////////////
	// scores := []int{9001, 9333, 212, 33}
	// for index, value := range scores {
	// 	fmt.Printf("%d - %d\n", index, value)
	// }

	///////////  Make => faster way to create Array  //////////////////
	// scores := make([]int, 10) // จอง 10 ช่อง
	// for index, value := range scores {
	// 	fmt.Printf("%d - %d\n", index, value)
	// }

	///////////  Make Slice  /////////
	// scores := make([]int, 0, 10) // ขอ 10 ช่อง แต่ยังไม่จอง ถ้าข้อมูลเกิน 10 จะขอเพิ่มอีก 10 มาต่อท้าย
	// fmt.Println(len(scores))     // len(scores) = 0
	// scores = append(scores, 5)   // ลงค่าไป 1 ตัว
	// fmt.Println(len(scores))     // len(scores) = 5

	//////////  How Slice Grown  /////////////
	// scores := make([]int, 0, 5)
	// c := cap(scores)
	// fmt.Println(c)

	// for i := 0; i < 25; i++ {
	// 	scores = append(scores, i)
	// 	if cap(scores) != c {
	// 		c = cap(scores)
	// 		fmt.Println(c)
	// 	}
	// }

	/////////  Get Part of Slice  /////////
	scores := []int{1, 2, 3, 4, 5}
	slice := scores[2:4]
	slice[0] = 999
	fmt.Println(scores)
}
