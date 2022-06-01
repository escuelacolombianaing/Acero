/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.domainClasses.EntregableAsociados;
import java.util.List;

/**
 *
 * @author javier.tambo
 */
public interface ServiciosEntregableAsociados {

    public List<EntregableAsociados> ConsultarEntregablesASociados(long id_reto) throws Exception;

    public List<EntregableAsociados> ConsultarTodosEntregablesASociados() throws Exception;

    public int RegistrarEntregablesASociados(EntregableAsociados entregable) throws Exception;

    public int EliminarEntregableAsociados(long id_parametro, long id_reto) throws Exception;
}
