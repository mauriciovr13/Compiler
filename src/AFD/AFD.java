package AFD;

import TabelaDeSimbolos.Simbolo;
import TabelaDeSimbolos.TabelaDeSimbolos;
import jdk.nashorn.internal.parser.Token;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class AFD {
    private String formatoSaida;
    private List<Token> allTokens;

    public AFD(List<Token> allTokens, String formatoSaida) {
        this.formatoSaida = formatoSaida;
        this.allTokens = allTokens;
    }

    public void escreverArquivo() {
        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(new FileWriter("teste.dot"));

            bw.write("digraph G { \n ");

            for (Token t : allTokens) {
            }


        } catch (IOException e) {
            System.out.println("Erro de escrita no arquivo!");
        } finally {
            if (bw != null) {
                try {
                    bw.close();
                } catch (IOException ioex) {
                    System.out.println("Erro de escrita no arquivo");
                }
            }
        }
    }
}
