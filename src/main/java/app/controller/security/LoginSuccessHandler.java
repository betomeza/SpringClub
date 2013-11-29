package app.controller.auth;

import app.dao.UsuarioDAO;
import app.model.Usuario;
import app.model.UsuarioRol;
import app.zelper.Constantes;
import app.zelper.RolesEnum;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    @Autowired
    UsuarioDAO usuarioDAO;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        Usuario usuario = usuarioDAO.getByUserName(authentication.getName());

        if (usuario == null) {
            this.setDefaultTargetUrl("/login");
        }

        request.getSession().setAttribute(Constantes.SESSION_USUARIO, usuario.getPersona());

        List<UsuarioRol> roles = usuario.getUsuarioRol();

        for (UsuarioRol rol : roles) {
            if (rol.getAuthority().equals(RolesEnum.ADMIN.getValue())) {
                this.setDefaultTargetUrl("/adm");
                break;
                
            } else if (rol.getAuthority().equals(RolesEnum.SOCIO.getValue())) {
                this.setDefaultTargetUrl("/socio");
                break;
            }
        }
        
        super.onAuthenticationSuccess(request, response, authentication);
        
        
    }
}