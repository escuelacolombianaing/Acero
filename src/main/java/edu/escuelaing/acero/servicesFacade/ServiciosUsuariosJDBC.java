/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.daoAPI.Dao;
import edu.escuelaing.acero.daoAPI.UsuarioDao;
import edu.escuelaing.acero.domainClasses.Equipo;
import edu.escuelaing.acero.domainClasses.Usuario;
import edu.escuelaing.acero.servlets.RegistroEmpresa;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author andres.rojas
 */
public class ServiciosUsuariosJDBC implements ServiciosUsuarios{
    
    Dao<Usuario> daoUsuario = new UsuarioDao();
    
    @Override
    public List<Usuario> consultarUsuarios() throws Exception {
        return daoUsuario.obtenerTodos();
    }

    @Override
    public Usuario consultaUsuarioId(String id) throws Exception {
        return daoUsuario.obtenerPorId(Long.parseLong(id));
    }

    @Override
    public Long registroUsuario(Usuario usuario) throws Exception {
        Long id = new Long(0);
        
        try{
            id = daoUsuario.guardar(usuario);
        }catch(Exception ex){
            Logger.getLogger(RegistroEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    @Override
    public Boolean agregarAEquipo(Usuario usuario, Equipo equipo) throws Exception {
        usuario.setId_equipo(equipo.getId_equipo());
        Boolean ans = false;
        try {
            daoUsuario.guardar(usuario);
            ans=true;
        } catch (Exception e) {
            ans=false;
            Logger.getLogger(RegistroEmpresa.class.getName()).log(Level.SEVERE, null, e);
        }
        return ans;
    }
    
}
