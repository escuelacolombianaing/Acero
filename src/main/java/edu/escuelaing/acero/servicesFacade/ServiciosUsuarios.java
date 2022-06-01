/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.domainClasses.Equipo;
import edu.escuelaing.acero.domainClasses.Usuario;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public interface ServiciosUsuarios {
    public List<Usuario> consultarUsuarios() throws Exception;
    public Usuario consultaUsuarioId(String id) throws Exception;
    public Long registroUsuario(Usuario usuario) throws Exception;
    public Boolean agregarAEquipo(Usuario usuario, Equipo equipo) throws Exception;
}
