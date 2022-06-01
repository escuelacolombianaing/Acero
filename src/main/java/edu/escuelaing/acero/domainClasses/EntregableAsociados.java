/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.domainClasses;

/**
 *
 * @author javier.tambo
 */
public class EntregableAsociados {
    private long id;
    private long id_parametro;
    private long id_evento;
    private int porcentaje;
    private int estado;

    public EntregableAsociados(long id, long id_parametro, long id_evento, int porcentaje, int estado) {
        this.id = id;
        this.id_parametro = id_parametro;
        this.id_evento = id_evento;
        this.porcentaje = porcentaje;
        this.estado = estado;
    }
    

    public EntregableAsociados() {
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getEstado() {
        return estado;
    }

    public long getId() {
        return id;
    }

    public long getId_parametro() {
        return id_parametro;
    }

    public long getId_evento() {
        return id_evento;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setId_parametro(long id_parametro) {
        this.id_parametro = id_parametro;
    }

    public void setId_evento(long id_evento) {
        this.id_evento = id_evento;
    }

    public void setPorcentaje(int porcentaje) {
        this.porcentaje = porcentaje;
    }
    
    
}

