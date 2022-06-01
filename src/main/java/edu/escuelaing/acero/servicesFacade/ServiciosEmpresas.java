/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.domainClasses.Empresa;
import edu.escuelaing.acero.domainClasses.Usuario;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public interface ServiciosEmpresas {
    public List<Empresa> consultarEmpresas() throws Exception;
    public Empresa consultaEmpresaId(String nit) throws Exception;
    public Long registroEmpresa(Empresa empresa) throws Exception;
    public Empresa consultaEmpresaRepresentante(Usuario usuario) throws  Exception;
}
