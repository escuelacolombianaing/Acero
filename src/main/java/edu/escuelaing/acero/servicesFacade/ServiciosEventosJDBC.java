/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.daoAPI.Dao;
import edu.escuelaing.acero.daoAPI.EventoDao;
import edu.escuelaing.acero.domainClasses.Evento;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class ServiciosEventosJDBC implements ServiciosEventos{
    
    Dao<Evento> daoEventos = new EventoDao();
    
    @Override
    public List<Evento> consultarEventos() throws Exception {
        return daoEventos.obtenerTodos();
    }

    @Override
    public Evento consultaEventoId(Long id) throws Exception {
        return daoEventos.obtenerPorId(id);
    }

    @Override
    public Long registroEvento(Evento evento) throws Exception {
        return daoEventos.guardar(evento);
    }
    
}
