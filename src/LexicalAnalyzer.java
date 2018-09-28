//import com.sun.org.apache.xerces.internal.util.SymbolTable;
import AFD.AFD;
import JLexer.JLexer;
import TabelaDeSimbolos.Simbolo;
import TabelaDeSimbolos.TabelaDeSimbolos;
import org.antlr.v4.runtime.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

public class LexicalAnalyzer {

    public static void main(String[] args) throws IOException {
        String fileName = "/home/mauricio/Documents/Compiladores/teste.java";

        File file = new File(fileName);

        FileInputStream fis = null;

        fis = new FileInputStream(file);

        JLexer scanner = new JLexer(CharStreams.fromStream(fis));

        CommonTokenStream allTokensGenerated = new CommonTokenStream(scanner);

        allTokensGenerated.fill();

        List<Token> allTokens = allTokensGenerated.getTokens();

        TabelaDeSimbolos tabela = new TabelaDeSimbolos();

        //ArrayList<Simbolo> tabelaSimbolos = new ArrayList<Simbolo>();

        // Imprimindo todos os Lexemas
        //https://pt.stackoverflow.com/questions/71517/concatenar-strings-em-java-loops-stringbuilder-ou
        // %[i$][flags][tam][.prec]conversão
        System.out.format("%-18s %-7s %-7s %-7s\n", "Lexema", "Tipo", "Linha", "Coluna");


        for (Token t: allTokens) {
            System.out.format("%-18s %-7d %-7d %-7d\n", t.getText(), t.getType(), t.getLine(), t.getCharPositionInLine());
            //System.out.println(t);
            if ((t.getType() == 68) || (t.getType() == 4) || (t.getType() == 5)) {
                Simbolo s = new Simbolo(t.getText(), t.getType(), t.getTokenIndex());
                tabela.adicionarSimbolo(s);

            }
        }
        System.out.println("--------------------------------------------------");
        System.out.println(tabela);

        //AFD afd = new AFD(allTokens, "pdf");
        //afd.escreverArquivo();
    }
}
