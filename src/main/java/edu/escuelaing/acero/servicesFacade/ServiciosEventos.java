/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.domainClasses.Evento;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public interface ServiciosEventos {
    public List<Evento> consultarEventos() throws Exception;
    public Evento consultaEventoId(Long id) throws Exception;
    public Long registroEvento(Evento evento) throws Exception;
}
