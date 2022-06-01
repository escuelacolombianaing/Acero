/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.domainClasses.Equipo;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public interface ServiciosEquipos {
    public List<Equipo> consultarEquipos() throws Exception;
    public Equipo consultarEquipoId(Long id) throws Exception;
    public Long registroEquipo(Equipo t) throws Exception;
    public Long ActualizarEquipo(Equipo t) throws Exception;
}
