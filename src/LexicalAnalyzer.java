//import com.sun.org.apache.xerces.internal.util.SymbolTable;
import JLexer.JLexer;
import TabelaDeSimbolos.Simbolo;
import TabelaDeSimbolos.TabelaDeSimbolos;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.dfa.DFASerializer;
import org.antlr.v4.runtime.dfa.LexerDFASerializer;
import org.antlr.v4.runtime.misc.IntervalSet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class LexicalAnalyzer {

    public static void main(String[] args) throws IOException {
        String fileName = "C:\\Users\\Maurício Vieira\\IdeaProjects\\LexicalAnalyzer/teste.java";

        File file = new File(fileName);

        FileInputStream fis = null;

        fis = new FileInputStream(file);

        JLexer scanner = new JLexer(CharStreams.fromStream(fis));

        CommonTokenStream allTokensGenerated = new CommonTokenStream(scanner);

        allTokensGenerated.fill();

        List<Token> allTokens = allTokensGenerated.getTokens();


        TabelaDeSimbolos tabela = new TabelaDeSimbolos();

        // Imprimindo todos os Lexemas
        //https://pt.stackoverflow.com/questions/71517/concatenar-strings-em-java-loops-stringbuilder-ou
        // %[i$][flags][tam][.prec]conversão
        System.out.format("%-18s %-7s %-7s %-7s\n", "Lexema", "Tipo", "Linha", "Coluna");


        for (Token t: allTokens) {
            if (t.getType() != 1 && t.getType()!= 2 && t.getType()!=3) {
                //token normal
                System.out.format("%-18s %-7d %-7d %-7d\n", t.getText(), t.getType(), t.getLine(), t.getCharPositionInLine());
            }
            else {
                System.out.println("Token '" + t.getText() +"' não reconhecido na linha " + t.getLine() + ":" + t.getCharPositionInLine());
            }

            if ((t.getType() == 77) || (t.getType() == 78) || (t.getType() == 79) || (t.getType() == 80) || (t.getType() == 81)
                    || (t.getType() == 82) || (t.getType() == 83)|| (t.getType() == 84) ) {
                Simbolo s = new Simbolo(t.getText(), t.getType(), t.getTokenIndex());
                tabela.adicionarSimbolo(s);

            }
        }
        System.out.println("\n\n-------------------- Tabela de Simbolos --------------------");
        System.out.println(tabela);


        //AFD afd = new AFD(allTokens, "pdf");
        //afd.escreverArquivo();
    }
}
