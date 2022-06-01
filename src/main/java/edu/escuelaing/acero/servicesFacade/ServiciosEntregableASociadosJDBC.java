/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servicesFacade;

import edu.escuelaing.acero.daoAPI.EntregableAsociadosDao;
import edu.escuelaing.acero.domainClasses.EntregableAsociados;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author javier.tambo
 */
public class ServiciosEntregableASociadosJDBC implements ServiciosEntregableAsociados{

    @Override
    public List<EntregableAsociados> ConsultarEntregablesASociados(long id_evento) throws Exception {
        List<EntregableAsociados> entregableasociado=new ArrayList<EntregableAsociados>();
            EntregableAsociadosDao todos=new EntregableAsociadosDao();
        entregableasociado=todos.obtenerPorIdEvento(id_evento);
        return entregableasociado;
    }

    @Override
    public List<EntregableAsociados> ConsultarTodosEntregablesASociados() throws Exception {
       List<EntregableAsociados> entregableasociado=new ArrayList<EntregableAsociados>();
            EntregableAsociadosDao todos=new EntregableAsociadosDao();
        entregableasociado=todos.obtenerTodos();
        return entregableasociado;
    }

    @Override
    public int RegistrarEntregablesASociados(EntregableAsociados entregable) throws Exception {
       EntregableAsociadosDao guardar=new EntregableAsociadosDao();
       return guardar.guardarE(entregable);
    }

    @Override
    public int EliminarEntregableAsociados(long id_parametro, long id_evento) throws Exception {
         EntregableAsociados eliminarEnt= new EntregableAsociados();
         eliminarEnt.setId_parametro(id_parametro);
         eliminarEnt.setId_evento(id_evento);
       EntregableAsociadosDao eliminar=new EntregableAsociadosDao();
       return eliminar.borrarE(eliminarEnt);
    }
    
    
     public int ActualizarEntregableAsociados(EntregableAsociados id) throws Exception {
       EntregableAsociadosDao actualizar=new EntregableAsociadosDao();
       return actualizar.actualizarE(id);
    }
    
}
