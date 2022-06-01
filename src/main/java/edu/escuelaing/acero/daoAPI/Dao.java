/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.daoAPI;

import java.util.List;
import java.util.Optional;

/**
 *
 * @author andres.rojas
 */
public interface Dao<T> {
    T obtenerPorId(Long id)  throws Exception;
    
    List<T> obtenerTodos()  throws Exception;
    
    Long guardar(T t) throws Exception;
    
    void actualizar(T t) throws Exception;
    
    void borrar(T t) throws Exception;
}
