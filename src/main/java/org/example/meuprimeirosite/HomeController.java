package org.example.meuprimeirosite;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private LivroRepository livroRepository;

    @GetMapping("/")
    public String index(@RequestParam(value = "busca", required = false) String busca,
                        @RequestParam(value = "categoria", required = false) String categoria,
                        HttpSession session,
                        Model model) {

        List<Livro> carrinho = (List<Livro>) session.getAttribute("carrinho");
        if (carrinho == null) {
            carrinho = new ArrayList<>();
            session.setAttribute("carrinho", carrinho);
        }

        if (busca != null && !busca.isEmpty()) {
            model.addAttribute("livros", livroRepository.findByTituloContainingIgnoreCaseOrAutorContainingIgnoreCase(busca, busca));
        } else if (categoria != null && !categoria.isEmpty()) {
            model.addAttribute("livros", livroRepository.findByCategoriaIgnoreCase(categoria));
        } else {
            model.addAttribute("livros", livroRepository.findAll());
        }

        model.addAttribute("carrinhoQtd", carrinho.size());
        return "index";
    }

    @PostMapping("/carrinho/adicionar/{id}")
    public String adicionarAoCarrinho(@PathVariable Long id, HttpSession session) {
        List<Livro> carrinho = (List<Livro>) session.getAttribute("carrinho");
        if (carrinho == null) {
            carrinho = new ArrayList<>();
        }

        livroRepository.findById(id).ifPresent(carrinho::add);
        session.setAttribute("carrinho", carrinho);

        return "redirect:/";
    }

    @GetMapping("/carrinho")
    public String verCarrinho(HttpSession session, Model model) {
        List<Livro> carrinho = (List<Livro>) session.getAttribute("carrinho");
        if (carrinho == null) {
            carrinho = new ArrayList<>();
        }

        double total = carrinho.stream().mapToDouble(Livro::getPreco).sum();

        model.addAttribute("carrinho", carrinho);
        model.addAttribute("total", total);
        return "carrinho";
    }

    @GetMapping("/login")
    public String telaLogin() {
        return "login";
    }


// ADICIONE ESTE MÉTODO:
@PostMapping("/login")
public String processarLogin(@RequestParam String email, @RequestParam String senha) {
    return "redirect:/";
}
}