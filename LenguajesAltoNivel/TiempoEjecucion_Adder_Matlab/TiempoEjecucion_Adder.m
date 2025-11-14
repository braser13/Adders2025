%Script de tiempo de ejecución
inicio=tic;
Resultado=254+225;
TiempoEjecucion=toc(inicio);

fprintf('El resultado de la operación es: %d\n',Resultado);
fprintf('El tiempo de ejecución: %.f nanosegundos:\n',TiempoEjecucion*10^9);