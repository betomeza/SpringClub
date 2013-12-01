package app.controller.adm.asociado;

import app.dao.PersonaDAO;
import app.dao.SocioDAO;
import app.dao.UsuarioDAO;
import app.dao.UsuarioRolDAO;
import app.model.Persona;
import app.model.Socio;
import app.model.Usuario;
import app.model.UsuarioRol;
import app.zelper.EstadoEnum;
import app.zelper.RolesEnum;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Service
public class AsociadoServiceImp implements AsociadoService {

    @Autowired
    PersonaDAO personaDAO;
    
    @Autowired
    SocioDAO socioDAO;

    @Autowired
    UsuarioDAO usuarioDAO;
    
    @Autowired
    UsuarioRolDAO usuarioRolDAO;


    public List<Persona> list() {
        return personaDAO.list();
    }

    @Override
    public Persona get(Persona t) {
        return personaDAO.get(t);
    }

    @Override
    public void save(Persona t) {
        personaDAO.save(t);
        
        Socio asoc = new Socio();
        asoc.setPersona(t);
        
        Usuario user = new Usuario();
        user.setPersona(t);
        user.setUsuario(t.getEmail());
        user.setPassword(DigestUtils.md5DigestAsHex(t.getEmail().getBytes()));
        user.setEstado(EstadoEnum.ACTIVO.getValue());
        usuarioDAO.save(user);

        
        UsuarioRol rol = new UsuarioRol();
        rol.setUsuario(user);
        rol.setAuthority(RolesEnum.SOCIO.getValue());
        usuarioRolDAO.save(rol);
    }

    @Override
    public void update(Persona t) {
        personaDAO.update(t);
        
        Socio asoc =  socioDAO.getByPersona(t);
        asoc.setPersona(t);
        
        Usuario usuario = usuarioDAO.getByPersona(t);
        usuario.setUsuario(t.getEmail());
        usuarioDAO.update(usuario);
    }

    @Override
    public void delete(Persona t) {
        
        personaDAO.delete(t);
    }
}
