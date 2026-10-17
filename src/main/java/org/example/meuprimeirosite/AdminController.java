package org.example.meuprimeirosite;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private LivroRepository livroRepository;

    // Tela principal do painel do administrador com a lista de livros
    @GetMapping("/livros")
    public String listarLivrosAdmin(Model model) {
        model.addAttribute("livros", livroRepository.findAll());
        return "admin/livros";
    }

    // Formulario para cadastrar um novo livro
    @GetMapping("/livros/novo")
    public String formularioNovoLivro(Model model) {
        model.addAttribute("livro", new Livro());
        return "admin/form-livro";
    }

    // Salvar ou atualizar livro
    @PostMapping("/livros/salvar")
    public String salvarLivro(@ModelAttribute Livro livro) {
        livroRepository.save(livro);
        return "redirect:/admin/livros";
    }

    // Carregar dados de um livro para edicao
    @GetMapping("/livros/editar/{id}")
    public String formularioEditarLivro(@PathVariable Long id, Model model) {
        Livro livro = livroRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Livro inválido: " + id));
        model.addAttribute("livro", livro);
        return "admin/form-livro";
    }

    // Excluir livro
    @GetMapping("/livros/excluir/{id}")
    public String excluirLivro(@PathVariable Long id) {
        livroRepository.deleteById(id);
        return "redirect:/admin/livros";
    }
}
