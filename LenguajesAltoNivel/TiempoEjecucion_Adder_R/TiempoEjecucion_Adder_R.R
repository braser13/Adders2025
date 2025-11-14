start.time <- Sys.time()

Sum = 254 + 225

end.time <- Sys.time()

TiempoEjecucion <- (end.time - start.time)*1e9

paste0("La suma es: ", Sum)
paste0("El tiempo de ejecución es: ", TiempoEjecucion, " nanosegundos")
