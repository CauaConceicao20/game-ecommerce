package app;

import config.InicializadorBancoDados;
import menu.Operacoes;

import java.sql.SQLException;
import java.util.Scanner;

public class Main {

    private static final Scanner scanner = new Scanner(System.in);
    private static final Operacoes OPERACOES = new Operacoes(scanner);

    public static void main(String[] args) {
        try {
            InicializadorBancoDados.executar();
        } catch (SQLException e) {
            System.err.println("Falha ao inicializar o banco de dados: " + e.getMessage());
            System.exit(1);
        } catch (Exception e) {
            System.err.println("Falha ao carregar o script do banco: " + e.getMessage());
            System.exit(1);
        }

        int opcao;
        do {
            System.out.println("\n=== E-commerce de Jogos ===");
            System.out.println("1. Cadastrar jogo");
            System.out.println("0. Sair");
            System.out.print("Opção: ");
            opcao = Integer.parseInt(scanner.nextLine());

            switch (opcao) {
                case 1 -> OPERACOES.cadastrarJogo();
                case 0 -> System.out.println("Saindo...");
                default -> System.out.println("Opção inválida.");
            }
        } while (opcao != 0);
    }
}
