package app.controller.adm.local;

import app.model.Local;
import app.zelper.GenericCrud;


public interface LocalService extends GenericCrud<Local>{
    
    public void activar(long id);

}
