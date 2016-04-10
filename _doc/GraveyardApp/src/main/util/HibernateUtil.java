package main.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import main.model.Exhumation;
import main.model.Funeral;
import main.model.Management;
import main.model.Rent;
import main.model.people.Applicant;
import main.model.people.Deceased;
import main.model.people.Manager;
import main.model.people.Owner;
import main.model.places.Grave;
import main.model.places.Sector;

public class HibernateUtil {
	
    private static SessionFactory sessionFactory = buildSessionFactory();
    private static ServiceRegistry serviceRegistry;
    
	public void createObjectDB(Object object){
		SessionFactory sf = HibernateUtil.getSessionFactory();
		
		Session session = sf.openSession();
		Transaction t = session.beginTransaction();
		
		session.persist(object);
		
		t.commit();
		
		session.close();
	}

    private static SessionFactory buildSessionFactory() {
    	Configuration configuration = new Configuration();
        configuration.configure();
        serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
        sessionFactory = configuration.
        		addAnnotatedClass(Sector.class).
        		addAnnotatedClass(Owner.class).
        		addAnnotatedClass(Rent.class).
        		addAnnotatedClass(Grave.class).
        		addAnnotatedClass(Manager.class).
        		addAnnotatedClass(Management.class).
        		addAnnotatedClass(Deceased.class).
        		addAnnotatedClass(Funeral.class).
        		addAnnotatedClass(Applicant.class).
        		addAnnotatedClass(Exhumation.class).
        		buildSessionFactory(serviceRegistry);
        return sessionFactory;
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

}
