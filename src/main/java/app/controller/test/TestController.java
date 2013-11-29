package app.controller.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/socio")
public class TestController {
    
    @Autowired
    TestService service;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("servicios",service.allServicio());
        model.addAttribute("mensaje", "METODO INDEX");
        return "test";
    }

    @RequestMapping("ejemplo")
    public String ejemplo(Model model) {

        model.addAttribute("mensaje", "METODO EJEMPLO");
        return "test";
    }

    @RequestMapping(value = "ejemplopost", method = RequestMethod.POST)
    public String ejemploPost(Model model) {

        model.addAttribute("mensaje", "METODO POST");
        return "test";
    }

    @RequestMapping(value = {"actualizar/{id}", "actualizar"})
    public String parametroUrl(Model model, @PathVariable("id") String id) {

        model.addAttribute("mensaje", "PARAMETRO EN URL " + id);
        return "test";
    }

    @RequestMapping("guardar")
    public String guardarParamether(Model model,
            @RequestParam String nombres, @RequestParam String apellidos) {

        model.addAttribute("mensaje", nombres + " " + apellidos);
        return "test";
    }

    @RequestMapping("guardarDos")
    public String guardarAttribute(@ModelAttribute PersonaTest persona, Model model) {

        model.addAttribute("mensaje", persona.getNombres() + " " + persona.getApellidos());
        return "test";
    }
}
