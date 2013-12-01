package app.dao.hibernate;

import app.dao.BaseHibernateDAO;
import app.dao.SocioDAO;
import app.model.Persona;
import app.model.Socio;
import app.model.Usuario;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("socioDAO")
public class SocioDAOH extends BaseHibernateDAO implements SocioDAO {

    
    @Override
    public List<Socio> list() {
        Criteria criteria = this.getSession().createCriteria(Socio.class);
        return criteria.list();
    }

    public Socio get(Socio t) {
        Criteria criteria = this.getSession().createCriteria(Socio.class);
        criteria.add(Restrictions.eq("id", t.getId()));
        return (Socio) criteria.uniqueResult();
    }

    @Override
    public Socio getByPersona(Persona persona) {
        Criteria criteria = this.getSession().createCriteria(Socio.class);
        criteria.add(Restrictions.eq("persona", persona));
        return (Socio) criteria.uniqueResult();
    }
    
    @Transactional
    public void save(Socio t) {
        this.getSession().save(t);
    }

    @Transactional
    public void update(Socio t) {
        this.getSession().merge(t);
    }

    @Transactional
    public void delete(Socio t) {
        this.getSession().delete(t);
    }
    
    
}
