/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.daoAPI.Dao;
import edu.escuelaing.acero.daoAPI.EquipoDao;
import edu.escuelaing.acero.domainClasses.Equipo;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class ServiciosEquiposJDBC implements ServiciosEquipos{
    
    Dao<Equipo> daoEquipos = new EquipoDao();
    @Override
    public List<Equipo> consultarEquipos() throws Exception {
        return daoEquipos.obtenerTodos();
    }

    @Override
    public Equipo consultarEquipoId(Long id) throws Exception {
        return daoEquipos.obtenerPorId(id);
    }

    @Override
    public Long registroEquipo(Equipo t) throws Exception {
        return daoEquipos.guardar(t);
    }

    @Override
    public Long ActualizarEquipo(Equipo t) throws Exception {
        Long ret =new Long(0);
        try {
           daoEquipos.actualizar(t);
            return ret;
        } catch (Exception e) {
            return ret;
        }
        
    }
    
    public boolean AsignarTutor(Equipo t)throws Exception {
        EquipoDao infEquipo=new EquipoDao();
        return infEquipo.AsignarTutor(t);
    }
}
