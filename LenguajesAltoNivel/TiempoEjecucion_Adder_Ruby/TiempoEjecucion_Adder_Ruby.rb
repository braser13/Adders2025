inicio = Process.clock_gettime(Process::CLOCK_MONOTONIC)

sum = 254 + 225

fin= Process.clock_gettime(Process::CLOCK_MONOTONIC)

TiempoEjecucion = (fin-inicio) *1e9

puts "La suma es: #{sum}"
puts "El tiempo de ejecución es: #{TiempoEjecucion} nanoseconds"