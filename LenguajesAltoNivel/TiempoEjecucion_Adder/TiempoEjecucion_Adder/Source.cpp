#include <iostream>
#include <chrono>

int main() {
	int Sum;
	
	auto inicio = std::chrono::high_resolution_clock::now();
	Sum = 254 + 225;
	auto fin = std::chrono::high_resolution_clock::now();
	auto tiempoTotal = std::chrono::duration_cast<std::chrono::nanoseconds>(fin - inicio).count();

	std::cout << "El resultado es : "; std::cout << Sum; std::cout << "\n";
	std::cout << "El tiempo de ejecución es : "; std::cout << tiempoTotal; 
	std::cout << " nanosegundos"; std::cout << "\n\n\n\n\n\n\n";


	return 0;
}