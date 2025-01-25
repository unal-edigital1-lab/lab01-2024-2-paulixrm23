module sum1bcc_primitive (A, B, Ci, Cout, S); 
    // Entradas: A, B, Ci (bits de entrada).
    // Salidas: Cout (acarreo) y S (suma).
    
    input A;       // Bit de entrada A.
    input B;       // Bit de entrada B.
    input Ci;      // Bit de entrada del acarreo de entrada.
    output Cout;   // Salida del acarreo.
    output S;      // Salida de la suma.
    
    // Cables internos para las conexiones lógicas.
    wire a_ab;     // Resultado de A AND B.
    wire x_ab;     // Resultado de A XOR B.
    wire cout_t;   // Resultado parcial para el acarreo.

    // Operaciones lógicas necesarias para implementar un sumador completo.
    and(a_ab, A, B);        // Genera el acarreo entre A y B.
    xor(x_ab, A, B);        // Genera la suma parcial entre A y B.
    
    xor(S, x_ab, Ci);       // Calcula la suma final (A XOR B XOR Ci).
    and(cout_t, x_ab, Ci);  // Genera un acarreo parcial entre (A XOR B) y Ci.
    or (Cout, cout_t, a_ab); // Calcula el acarreo final combinando las señales.

endmodule