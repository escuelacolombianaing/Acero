/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.domainClasses.Entregable;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public interface ServiciosEntregables {
    public List<Entregable> consultarEntregables() throws Exception;
    public Entregable consultarEntregableId(Long id) throws Exception;
    public Long registroEntregable(Entregable t) throws Exception;
}
