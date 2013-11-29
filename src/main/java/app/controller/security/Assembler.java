package app.controller.security;

import app.model.Usuario;
import app.model.UsuarioRol;
import app.zelper.EstadoEnum;
import java.util.ArrayList;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("assembler")
public class Assembler {

    @Transactional(readOnly = true)
    public User buildUserSpringSecurity(Usuario usuario) {

        String username = usuario.getUsuario();
        String password = usuario.getPassword();
        boolean enabled = (usuario.getEstado()== EstadoEnum.ACTIVO.getValue()) ? true : false;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;

        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (UsuarioRol rol : usuario.getUsuarioRol()) {
            authorities.add(new SimpleGrantedAuthority(rol.getAuthority()));
        }

        User user = new User(username, 
                password, 
                enabled, 
                accountNonExpired, 
                credentialsNonExpired,
                accountNonLocked,
                authorities);
        return user;
    }
}
