package app.controller.adm.servicio;

import app.dao.ServicioDAO;
import app.model.Servicio;
import app.zelper.TareasAutomaticas;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicioServiceImp implements ServicioService {

    @Autowired
    ServicioDAO servicioDAO;

    @Override
    public List<Servicio> list() {
        return servicioDAO.list();
    }

    @Override
    public Servicio get(Servicio t) {
        return servicioDAO.get(t);
    }

    @Override
    public void save(Servicio t) {
        servicioDAO.save(t);
        TareasAutomaticas.enviarMensaje();
    }

    @Override
    public void update(Servicio t) {
        servicioDAO.update(t);
    }

    @Override
    public void delete(Servicio t) {
        servicioDAO.delete(t);
    }
}
