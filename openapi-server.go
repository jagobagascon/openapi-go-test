package main

import (
	"log"
	"net/http"

	openapi "test.com/out/openapi-go-server/go"
)

// Service implements PetApiServicer
type Service struct {
}

func main() {
	log.Printf("Server started")

	PetApiService := openapi.NewDefaultApiService()
	PetApiController := openapi.NewPetApiController(PetApiService)

	router := openapi.NewRouter(PetApiController)

	log.Fatal(http.ListenAndServe(":8080", router))

}
