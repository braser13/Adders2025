Imports System
Imports System.Formats
Imports System.Security.Cryptography.X509Certificates

Module Program
    Sub Main(args As String())
        Dim sum
        Dim time As New Stopwatch()
        Dim TiempoEjecucion As Long

        time.Start()

        sum = 254 + 225

        time.Stop()

        Dim TiempoEjecucionObj As TimeSpan = time.Elapsed
        TiempoEjecucion = TiempoEjecucionObj.Nanoseconds

        Console.WriteLine($"La suma es: {sum}")
        Console.WriteLine($"El tiempo de ejecución es: {TiempoEjecucion} nanosegundos")
    End Sub
End Module
