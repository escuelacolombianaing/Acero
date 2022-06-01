/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.daoAPI.Dao;
import edu.escuelaing.acero.daoAPI.ParametroDao;
import edu.escuelaing.acero.domainClasses.Parametro;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class ServiciosParametrosJDBC implements ServiciosParametros{
    
    Dao dao_parametros=new ParametroDao();
    ParametroDao metParametro=new ParametroDao();
    @Override
    public List<Parametro> getParametrosTipo(String tipo_parametro) throws Exception {
        List<Parametro> ans = new ArrayList<>();
        List<Parametro> todos = dao_parametros.obtenerTodos();
        for (Parametro param : todos) {
            if(param.getTipo_parametro().equals(tipo_parametro)){
                ans.add(param);
            }
        }
        return ans;
    }

    @Override
    public int CrearParametro(Parametro parametro) throws Exception {
        try {
            return metParametro.guardarP(parametro); 
        } catch (Exception e) {
            return 3;
        }
             
    }

    @Override
    public int EliminarParametro(Parametro parametro) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
