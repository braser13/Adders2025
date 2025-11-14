public class TiempoEjecucion_Adder_J {
    public static void main(String[] args) {
        long inicio = System.nanoTime();

        int Sum = 254 + 225;

        long fin = System.nanoTime();

        long TiempoEjecucion = fin - inicio;

        System.out.println("La suma es: " + Sum);
        System.out.println("El tiempo de Ejecucion: " + TiempoEjecucion + "nanosegundos");
    }    
}
