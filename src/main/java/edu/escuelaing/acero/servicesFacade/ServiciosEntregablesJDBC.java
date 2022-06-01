/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.daoAPI.Dao;
import edu.escuelaing.acero.daoAPI.EntregableDao;
import edu.escuelaing.acero.domainClasses.Entregable;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class ServiciosEntregablesJDBC implements ServiciosEntregables{
    
    
    Dao<Entregable> daoEntregables = new EntregableDao();
    
    @Override
    public List<Entregable> consultarEntregables() throws Exception {
        return daoEntregables.obtenerTodos();
    }

    @Override
    public Entregable consultarEntregableId(Long id) throws Exception {
        return daoEntregables.obtenerPorId(id);
    }

    @Override
    public Long registroEntregable(Entregable t) throws Exception {
        return daoEntregables.guardar(t);
    }
    
}
