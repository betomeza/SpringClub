package app.controller.adm.asociado;

import app.controller.adm.administrador.*;
import app.model.Persona;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/adm/asociado")
public class AsociadoController {

    @Autowired
    AsociadoService service;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("asocs", service.list());

        return "adm/asoc/socio";
    }

    @RequestMapping("new")
    public String nuevo(Model model) {

       
        
        
        model.addAttribute("asoc", new Persona());

        return "adm/asoc/socioForm";
    }

    @RequestMapping("update/{id}")
    public String update(@PathVariable long id, Model model) {

        Persona  persona = service.get(new Persona(id));

        if (persona == null) {
            return "redirect:/adm/asoc";
        }

        model.addAttribute("asoc", persona);

        return "adm/asoc/socioForm";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@ModelAttribute Persona persona) {

        if (persona.getId() == null) {
            service.save(persona);
        } else {
            service.update(persona);
        }

        return "redirect:/adm/asociado";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable long id) {


        
        service.delete(new Persona(id));

        return "redirect:/adm/asoc";
    }
}
