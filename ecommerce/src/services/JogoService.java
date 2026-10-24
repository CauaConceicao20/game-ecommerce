package services;

import dao.JogoDao;
import model.jogo.Jogo;

public class JogoService {

    private JogoDao jogoDao = new JogoDao();

    public Jogo salvar(Jogo jogo) {
        return jogoDao.inserir(jogo);
    }
}
