
package app.dao;

import app.model.Persona;
import app.zelper.GenericCrud;
import java.util.List;


public interface PersonaDAO extends GenericCrud<Persona> {
 
    List<Persona> listAdministrador();
    
    List<Persona> listSocio();    
}
