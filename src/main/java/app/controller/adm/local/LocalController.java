package app.controller.adm.local;

import app.model.Local;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.ManagedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("adm/local")
public class LocalController {

    @Autowired
    LocalService service;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("locales", service.list());

        return "adm/local/local";
    }

    @RequestMapping("new")
    public String nuevo(Model model) {

        model.addAttribute("local", new Local());

        return "adm/local/localForm";
    }

    @RequestMapping("update/{id}")
    public String update(@PathVariable long id, Model model) {

        Local local = service.get(new Local(id));

        if (local == null) {
            return "redirect:/adm/local";
        }

        model.addAttribute("local", local);

        return "adm/local/localForm";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@ModelAttribute Local local) {

        if (local.getId() == null) {
            local.setEstado(1);
            service.save(local);
        } else {
            service.update(local);
        }

        return "redirect:/adm/local";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable long id) {

        service.delete(new Local(id));

        return "redirect:/adm/local";
    }
    
    
    @ResponseBody
    @RequestMapping("activar")
    public Map<String, Object> activar(@RequestParam long id) {
            
        service.activar(id);
        
        Map<String, Object> respuesta = new ManagedMap<String, Object>();
        respuesta.put("success", true);

        return respuesta;
    }    
}
