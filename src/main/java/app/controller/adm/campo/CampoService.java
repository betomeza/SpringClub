package app.controller.adm.campo;

import app.model.Campo;
import app.model.Local;
import app.zelper.GenericCrud;
import java.util.List;


public interface CampoService extends GenericCrud<Campo>{

    List<Local> listLocal();
    
}
