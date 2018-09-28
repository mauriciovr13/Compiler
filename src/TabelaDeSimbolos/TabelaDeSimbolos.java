package TabelaDeSimbolos;

import java.util.ArrayList;

public class TabelaDeSimbolos {
    private ArrayList<Simbolo> tabela;

    public TabelaDeSimbolos() {
        this.tabela = new ArrayList<Simbolo>();
    }

    public void adicionarSimbolo(Simbolo s) {
        tabela.add(s);
    }

    @Override
    public String toString() {
        StringBuilder resultado = new StringBuilder("Tabela de Simbolos\n");
        resultado.append(String.format("%-10s %-10s %-10s\n", "Valor", "IdToken", "PosToken"));
        for (Simbolo s : tabela) {
            resultado.append(String.format("%-10s %-10d %-10d\n", s.getValor(), s.getIdToken(), s.getPosToken()));
        }
        return resultado.toString();
    }
}
