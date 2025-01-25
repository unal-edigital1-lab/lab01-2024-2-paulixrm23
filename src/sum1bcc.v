module sum1bcc (A, B, Ci, Cout, S);
    // Entradas: A, B, Ci (bits de entrada).
    // Salidas: Cout (acarreo) y S (suma).

    input A;       // Bit de entrada A.
    input B;       // Bit de entrada B.
    input Ci;      // Bit de entrada del acarreo de entrada.
    output Cout;   // Salida del acarreo.
    output S;      // Salida de la suma.

    reg [1:0] st;  // Registro de 2 bits para almacenar temporalmente la suma y el acarreo.

    assign S = st[0];      // El bit menos significativo del registro es la suma.
    assign Cout = st[1];   // El bit más significativo del registro es el acarreo.

    always @(*) begin
        st <= A + B + Ci;  // Calcula la suma y el acarreo como una operación aritmética.
    end

endmodule