package main

import (
	"fmt"
	"time"
)

func main() {
	inicio := time.Now()

	Sum := 254 + 225

	fin := time.Since(inicio)

	fmt.Println("La suma es: ", Sum)
	fmt.Println("Tiempo de Ejecucion es: ", fin.Nanoseconds())
}
