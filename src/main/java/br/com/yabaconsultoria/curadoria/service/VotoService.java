package br.com.yabaconsultoria.curadoria.service;

import br.com.yabaconsultoria.curadoria.model.Categoria;
import br.com.yabaconsultoria.curadoria.model.Projeto;
import br.com.yabaconsultoria.curadoria.model.Usuario;
import br.com.yabaconsultoria.curadoria.model.Voto;
import br.com.yabaconsultoria.curadoria.repository.VotoRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Classe de serviço de votos
 *
 * @author Lucas Copque
 * @version 1.0
 * @since 09/09/2020
 */
@Service
@Slf4j
public class VotoService {

    private VotoRepository votoRepository;

    @Autowired
    public VotoService(VotoRepository votoRepository) {
        this.votoRepository = votoRepository;
    }

    /**
     * Persiste um voto
     *
     * @param categoria Categoria que o voto esta relacionado
     * @param projeto   Projeto que o voto esta relacionado
     * @param usuario   Usuário que está realizando o voto
     * @return Retorna o voto persitido
     */
    public Voto save(Categoria categoria, Projeto projeto, Usuario usuario) {
        Voto voto = new Voto();
        voto.setCategoria(categoria);
        voto.setProjeto(projeto);
        voto.setUsuario(usuario);
        this.votoRepository.save(voto);
        log.info("Voto #{} computado com sucesso", voto.getId());
        return voto;
    }

    /**
     * Método que seta os projetos que podem ser votados pelo usuário na categoria visualizada
     *
     * @param usuario   usuário logado
     * @param categoria Categoria visualizada
     */
    public void filterProjetosForUser(Usuario usuario, Categoria categoria) {
        for (Projeto projeto : categoria.getProjetos()) {
            projeto.setCanVote(this.isVoted(usuario, categoria, projeto));
        }
        log.info("Filtrando projetos elegíveis para receber voto ao usuário");
    }

    /**
     * Método que verifica se o projeto é elegível à voto
     *
     * @param usuario   Usuário logado
     * @param categoria Categoria visualizada
     * @param projeto   Projeto que será verificado
     * @return Retorna true caso projeto seja elegível ou false caso o projeto ja tenha recebido voto por este usuário na categoria visualizada
     */
    public Boolean isVoted(Usuario usuario, Categoria categoria, Projeto projeto) {
        return this.votoRepository.existsByUsuarioAndCategoriaAndProjeto(usuario, categoria, projeto);
    }

    /**
     * Deleta o voto de determinado projeto na categoria
     *
     * @param categoria Categoria visualizada
     * @param projeto   Projeto que terá seu voto removido
     */
    public void deleteByCategoriaAndProjeto(Categoria categoria, Projeto projeto) {
        this.votoRepository.deleteByCategoriaAndProjeto(categoria, projeto);
        log.info("Removendo voto do projeto {}, na categoria {} da campanha {}", projeto.getTitulo(), categoria.getTipo().getDescricao(), categoria.getCampanha().getNome());
    }

    /**
     * Deleta todos os votos da categori passada como parâmetro
     *
     * @param categoria Categoria que terá os votos removidos
     */
    public void deleteAllByCategoria(Categoria categoria) {
        this.votoRepository.deleteAllByCategoria(categoria);
        log.info("Deletando todos os votos da campanha #{}", categoria.getId());
    }

    /**
     * Deleta todos os votos de determinado usuário na categoria
     *
     * @param usuario   Usuário logado
     * @param categoria Categoria que terá os votos removidos
     */
    public void deleteAllByUsuarioAndCategoria(Usuario usuario, Categoria categoria) {
        this.votoRepository.deleteAllByUsuarioAndCategoria(usuario, categoria);
        log.info("Removendo todos os votos do usuario {} na categoria {} da campanha {}", usuario.getEmail(), categoria.getTipo().getDescricao(), categoria.getCampanha().getNome());
    }

    /**
     * Lista todos os usuários que possuem uma quantidade de votos %limit% em determinada categoria
     *
     * @param categoria Categoria que será utilizada como filtro
     * @param limit     Quantidade de votos que deseja utilizar como filtro
     * @return Retorna uma lista de usuário localizada
     */
    public List<Usuario> findUserWithParamVotosByCategoria(Categoria categoria, Long limit) {
        return this.votoRepository.findUserWithParamVotosByCategoria(categoria, limit);
    }

    /**
     * Lista todos os projetos por categoria
     *
     * @param categoria Categoria que será utilizada como filtro
     * @return Retorna uma lista de projetos
     */
    public List<Projeto> findAllProjectByCategoria(Categoria categoria) {
        return this.votoRepository.findAllProjectByCategoria(categoria);
    }

    /**
     * Gera o ranking de projetos de determinada categoria, setando a quantidade de votos recebidos em cada projeto
     *
     * @param categoria Categoria que será utilizada como filtro
     * @return Retorna a lista de projeto para o ranking
     */
    public List<Projeto> getRankingCategoria(Categoria categoria) {
        List<Projeto> projetos = this.findAllProjectByCategoria(categoria);
        for (Projeto projeto : projetos) {
            projeto.setTotalVotos(this.countByCategoriaAndProjeto(categoria, projeto));
        }
        return projetos;
    }

    /**
     * Contabiliza a quantidade de votos que uma categoria recebeu
     *
     * @param categoria Categoria utilizada como filtro
     * @return Retorna q quantidade de votos de determinada categoria
     */
    public Long countByCategoria(Categoria categoria) {
        return this.votoRepository.countByCategoria(categoria);
    }

    /**
     * Contabiliza a quantidade de votos realizadas por um usuário em determinada categoria
     *
     * @param usuario   Usuário utilizado como filtro
     * @param categoria Categoria utilizada como filtro
     * @return Retorna a quantidade de votos que determinado usuário realizou em uma categoria
     */
    public Long countByUsuarioAndCategoria(Usuario usuario, Categoria categoria) {
        return this.votoRepository.countByUsuarioAndCategoria(usuario, categoria);
    }

    /**
     * Contabiliza a quantidade de usuários que possuem votos em determinada categoria
     *
     * @param categoria Categoria utilizada como filtro
     * @return Retorna o número de usuário que votaram em determinada categoria
     */
    public Long countUsuariosWithVoto(Categoria categoria) {
        return this.votoRepository.countUsuariosWithVoto(categoria);
    }

    /**
     * Contabiliza a quantidade de votos por projeto e categoria
     *
     * @param categoria Categoria utilizada como filtro
     * @param projeto   Projeto utilizado como filtro
     * @return Retona a quantidade de votos que um projeto recebeu em determinada categoria
     */
    private Long countByCategoriaAndProjeto(Categoria categoria, Projeto projeto) {
        return this.votoRepository.countByCategoriaAndProjeto(categoria, projeto);
    }

}
