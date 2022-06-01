/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.daoAPI.Dao;
import edu.escuelaing.acero.daoAPI.RetoDao;
import edu.escuelaing.acero.domainClasses.Empresa;
import edu.escuelaing.acero.domainClasses.Reto;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class ServiciosRetosJDBC implements ServiciosRetos{
    
    Dao<Reto> daoRetos = new RetoDao();
    
    @Override
    public List<Reto> consultarRetos() throws Exception {
        return daoRetos.obtenerTodos();
    }

    @Override
    public Reto consultaRetoId(Long id_reto) throws Exception {
        return daoRetos.obtenerPorId(id_reto);
    }

    @Override
    public Long registroReto(Reto reto) throws Exception {
        return daoRetos.guardar(reto);
    }

    @Override
    public List<Reto> consultarRetosEmpresa(Empresa empresa) throws Exception {
        List<Reto> todosRetos = daoRetos.obtenerTodos();
        List<Reto> ans = new ArrayList<>();
        for (Reto todosReto : todosRetos) {
            if(empresa.getId_empresa().equals(todosReto.getId_empresa())){
                ans.add(todosReto);
            }
        }
        return ans;
    }
    
}
