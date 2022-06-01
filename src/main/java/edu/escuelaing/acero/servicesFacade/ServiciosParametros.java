/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.domainClasses.Parametro;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public interface ServiciosParametros {
    public List<Parametro> getParametrosTipo(String tipo_parametro) throws Exception;
    public int CrearParametro(Parametro parametro) throws Exception;
    public int EliminarParametro(Parametro parametro) throws Exception;
    
}
