package TabelaDeSimbolos;

public class Simbolo {
    private String valor;
    private int idToken;
    private int posToken;

    public Simbolo(String value, int idToken, int posToken) {
        this.idToken = idToken;
        this.valor = value;
        this.posToken = posToken;
    }

    public String getValor() {
        return valor;
    }

    public int getIdToken() {
        return this.idToken;
    }

    public int getPosToken () {
        return posToken;
    }
    @Override
    public String toString(){
        return (this.valor + ' ' + this.idToken + " " + this.posToken);
    }
}
