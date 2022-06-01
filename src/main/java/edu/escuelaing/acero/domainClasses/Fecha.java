/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.domainClasses;

/**
 *
 * @author andres.rojas
 */
public class Fecha {
    private Long id_fecha = null;
    private Integer numero_semana_inicio;
    private Integer numero_semana_fin;
    private String fecha_inicio;
    private String fecha_fin;
    private String estado_fecha;

    public Fecha() {
    }

    public Fecha(Long id_fecha, Integer numero_semana_inicio, Integer numero_semana_fin, String fecha_inicio, String fecha_fin, String estado_fecha) {
        this.id_fecha = id_fecha;
        this.numero_semana_inicio = numero_semana_inicio;
        this.numero_semana_fin = numero_semana_fin;
        this.fecha_inicio = fecha_inicio;
        this.fecha_fin = fecha_fin;
        this.estado_fecha = estado_fecha;
    }

    public Long getId_fecha() {
        return id_fecha;
    }

    public void setId_fecha(Long id_fecha) {
        this.id_fecha = id_fecha;
    }


    public Integer getNumero_semana_inicio() {
        return numero_semana_inicio;
    }

    public void setNumero_semana_inicio(Integer numero_semana_inicio) {
        this.numero_semana_inicio = numero_semana_inicio;
    }

    public Integer getNumero_semana_fin() {
        return numero_semana_fin;
    }

    public void setNumero_semana_fin(Integer numero_semana_fin) {
        this.numero_semana_fin = numero_semana_fin;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(String fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public String getEstado_fecha() {
        return estado_fecha;
    }

    public void setEstado_fecha(String estado_fecha) {
        this.estado_fecha = estado_fecha;
    }
    
    
}
