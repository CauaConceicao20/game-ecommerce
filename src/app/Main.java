package app;

import config.DatabaseConnection;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            System.out.println("Conexão com o PostgreSQL estabelecida.");
        } catch (SQLException e) {
            System.err.println("Não foi possível conectar ao PostgreSQL: " + e.getMessage());
        }
    }
}
