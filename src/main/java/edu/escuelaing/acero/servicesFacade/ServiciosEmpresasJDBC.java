/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.daoAPI.Dao;
import edu.escuelaing.acero.daoAPI.EmpresaDao;
import edu.escuelaing.acero.domainClasses.Empresa;
import edu.escuelaing.acero.domainClasses.Usuario;
import edu.escuelaing.acero.servlets.RegistroEmpresa;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author andres.rojas
 */
public class ServiciosEmpresasJDBC implements ServiciosEmpresas{

    Dao<Empresa> daoEmpresa = new EmpresaDao();
    
    @Override
    public List<Empresa> consultarEmpresas() throws Exception {
        return daoEmpresa.obtenerTodos();
    }

    @Override
    public Empresa consultaEmpresaId(String nit) throws Exception {
        return daoEmpresa.obtenerPorId(Long.parseLong(nit));
    }

    @Override
    public Long registroEmpresa(Empresa empresa) throws Exception {
        Long flag= new Long (0);
        try{
            flag = daoEmpresa.guardar(empresa);
        }catch (Exception ex){
            Logger.getLogger(RegistroEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }

    @Override
    public Empresa consultaEmpresaRepresentante(Usuario usuario) throws Exception {
        Empresa ans = null;
        List<Empresa> todasEmpresas = daoEmpresa.obtenerTodos();
        for (Empresa todasEmpresa : todasEmpresas) {
            if(todasEmpresa.getId_representante().equals(usuario.getId_usuario())){
                ans=todasEmpresa;
            }
        }
        return ans;
    }
    
}
