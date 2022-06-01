/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.domainClasses;

import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class Equipo {
    private Long id_equipo = null;
    private String nombre_equipo;
    private Integer max_participantes;
    private String tutor;
    private List<Reto> retos_desarrolla;

    public List<Reto> getRetos_desarrolla() {
        return retos_desarrolla;
    }

    public void setRetos_desarrolla(List<Reto> retos_desarrolla) {
        this.retos_desarrolla = retos_desarrolla;
    }

    public Equipo() {
    }

    public Equipo(Long id_equipo, String nombre_equipo, Integer max_participantes, String tutor, List<Reto> retos_desarrolla) {
        this.id_equipo = id_equipo;
        this.nombre_equipo = nombre_equipo;
        this.max_participantes = max_participantes;
        this.tutor=tutor;
        this.retos_desarrolla = retos_desarrolla;
    }

    public String getTutor() {
        return tutor;
    }

    public void setTutor(String tutor) {
        this.tutor = tutor;
    }
    
    public Long getId_equipo() {
        return id_equipo;
    }

    public void setId_equipo(Long id_equipo) {
        this.id_equipo = id_equipo;
    }

    public String getNombre_equipo() {
        return nombre_equipo;
    }

    public void setNombre_equipo(String nombre_equipo) {
        this.nombre_equipo = nombre_equipo;
    }

    public Integer getMax_participantes() {
        return max_participantes;
    }

    public void setMax_participantes(Integer max_participantes) {
        this.max_participantes = max_participantes;
    }
    
    
}
