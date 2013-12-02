package app.controller.adm.local;

import app.controller.adm.local.*;
import app.dao.LocalDAO;
import app.model.Local;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocalServiceImp implements LocalService {

    @Autowired
    LocalDAO localDAO;

    @Override
    public List<Local> list() {
        return localDAO.list();
    }

    @Override
    public Local get(Local t) {
        return localDAO.get(t);
    }

    @Override
    public void save(Local t) {
        localDAO.save(t);
    }

    @Override
    public void update(Local t) {
        localDAO.update(t);
    }

    @Override
    public void delete(Local t) {
        localDAO.delete(t);
    }

    @Override
    public void activar(long id) {
        Local local = localDAO.get(new Local(id));
        
        int estado = (local.getEstado()==1) ? 0 : 1;
        
        local.setEstado(estado);
        
        localDAO.update(local);
    }
    
    
}
