/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.domainClasses.Empresa;
import edu.escuelaing.acero.domainClasses.Reto;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public interface ServiciosRetos {
    public List<Reto> consultarRetos() throws Exception;
    public Reto consultaRetoId(Long id_reto) throws Exception;
    public Long registroReto(Reto reto) throws Exception;
    public List<Reto> consultarRetosEmpresa(Empresa empresa) throws Exception;
}
