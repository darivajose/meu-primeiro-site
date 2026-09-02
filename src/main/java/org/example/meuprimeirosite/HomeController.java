package org.example.meuprimeirosite;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @GetMapping("/")
    public String paginaInicial(Model model) {
        model.addAttribute("mensagem", "Parabéns! Seu site em Java com Spring Boot está funcionando!");
        return "index";
    }

    // Nova rota que escuta o botão do formulário
    @PostMapping("/saudar")
    public String saudarUsuario(@RequestParam("nomeUsuario") String nome, Model model) {
        // O Java processa a String que veio do navegador e altera a mensagem
        model.addAttribute("mensagem", "Muito prazer, " + nome + "! O Java recebeu seu nome com sucesso! 🎉");
        return "index";
    }
}



