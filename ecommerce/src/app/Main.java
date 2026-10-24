package app;

import config.ConexaoBancoDados;
import config.InicializadorBancoDados;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        try {
            InicializadorBancoDados.executar();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        try (Connection conexao = ConexaoBancoDados.obterConexao()) {
            System.out.println("Conexão com o PostgreSQL estabelecida.");
        } catch (SQLException e) {
            System.err.println("Não foi possível conectar ao PostgreSQL: " + e.getMessage());
        }
    }
}
