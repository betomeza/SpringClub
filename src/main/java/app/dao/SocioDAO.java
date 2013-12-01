
package app.dao;

import app.model.Persona;
import app.model.Socio;
import app.zelper.GenericCrud;
import java.util.List;


public interface SocioDAO extends GenericCrud<Socio>{

    Socio getByPersona(Persona persona);
    
    List<Socio> list();
        
}