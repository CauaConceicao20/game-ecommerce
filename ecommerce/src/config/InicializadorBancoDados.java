package config;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.stream.Collectors;

public class InicializadorBancoDados {

    public static void executar() throws Exception {
        InputStream entrada = InicializadorBancoDados.class.getClassLoader()
                .getResourceAsStream("resources/inicializar.sql");

        if (entrada == null) {
            throw new RuntimeException("inicializar.sql não encontrado.");
        }

        String sql = new BufferedReader(new InputStreamReader(entrada))
                .lines().collect(Collectors.joining("\n")).trim();

        if (sql.isEmpty() || sql.startsWith("--")) {
            return;
        }

        try (Connection conexao = ConexaoBancoDados.obterConexao();
             Statement instrucao = conexao.createStatement()) {
            instrucao.execute(sql);
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao executar inicializar.sql: " + e.getMessage(), e);
        }
    }
}
