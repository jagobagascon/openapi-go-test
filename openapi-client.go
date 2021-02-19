package main

import (
	"context"
	"fmt"
	"log"

	openapi "test.com/out/openapi-go"
)

func main() {
	log.Printf("Client started")

	client := openapi.NewAPIClient(openapi.NewConfiguration())

	pet, _, err := client.PetApi.BestPet(context.Background()).Execute()
	if err != nil {
		fmt.Print(err)
	}
	fmt.Print(pet)
}
