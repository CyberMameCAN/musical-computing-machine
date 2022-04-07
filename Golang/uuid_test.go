/*
[Refer]
https://github.com/satori/go.uuid

[Manual]
https://pkg.go.dev/github.com/google/uuid
*/

package main

import (
	"fmt"

	uuid "github.com/satori/go.uuid"
	//"github.com/google/uuid"
)

func main() {
	// Creating UUID Version 4
	// panic on error
	var err error
	u1 := uuid.Must(uuid.NewV4(), err) /* case go.uuid */
	//u1 := uuid.Must(uuid.NewV4(), err)   /* case google/uuid */
	fmt.Printf("UUIDv4: %s\n", u1)

	// or error handling
	u2 := uuid.NewV4() /* case go.uuid */
	//u2 := uuid.NewV4()   /* case google/uuid */
	if err != nil {
		fmt.Printf("Something went wrong: %s", err)
		return
	}
	fmt.Printf("UUIDv4: %s\n", u2)

	// Parsing UUID from string input    /* case go.uuid */
	u2, err = uuid.FromString("6ba7b810-9dad-11d1-80b4-00c04fd430c8")
	if err != nil {
		fmt.Printf("Something went wrong: %s", err)
		return
	}
	fmt.Printf("Successfully parsed: %s", u2)
}

