package app.controller.adm.campo;

import app.controller.adm.campo.*;
import app.model.Campo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("adm/campo")
public class CampoController {

    @Autowired
    CampoService service;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("campos", service.list());

        return "adm/campo/campo";
    }

    @RequestMapping("new")
    public String nuevo(Model model) {

        model.addAttribute("campo", new Campo());

        return "adm/campo/campoForm";
    }

    @RequestMapping("update/{id}")
    public String update(@PathVariable long id, Model model) {

        Campo campo = service.get(new Campo(id));

        if (campo == null) {
            return "redirect:/adm/campo";
        }

        model.addAttribute("campo", campo);

        return "adm/campo/campoForm";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@ModelAttribute Campo campo) {

        if (campo.getId() == null) {
            campo.setEstado(1);
            service.save(campo);
        } else {
            service.update(campo);
        }

        return "redirect:/adm/campo";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable long id) {

        service.delete(new Campo(id));

        return "redirect:/adm/campo";
    }
}
