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
public class Evento {
    private Long id_evento = null;
    private String periodo;
    private String descripcion;
    private Integer year;
    private String tipo_evento;
    private String estado_evento;
    private Fecha fecha_apertura;
    private Fecha fecha_inicio_clases;
    private Fecha fecha_fin_clases;
    private String fecha_ini_entregables;
    private String fecha_fin_entregables;

    public Evento() {
    }

    public Evento(String periodo, String descripcion, Integer year, String tipo_evento, String estado_evento, Fecha fecha_apertura, Fecha fecha_inicio_clases, Fecha fecha_fin_clases, String fecha_ini_entregables, String fecha_fin_entregables) {
        this.periodo = periodo;
        this.descripcion = descripcion;
        this.year = year;
        this.tipo_evento = tipo_evento;
        this.estado_evento = estado_evento;
        this.fecha_apertura = fecha_apertura;
        this.fecha_inicio_clases = fecha_inicio_clases;
        this.fecha_fin_clases = fecha_fin_clases;
        this.fecha_ini_entregables=fecha_ini_entregables;
        this.fecha_fin_entregables=fecha_fin_entregables;
    }

    public String getFecha_ini_entregables() {
        return fecha_ini_entregables;
    }

    public String getFecha_fin_entregables() {
        return fecha_fin_entregables;
    }

    public void setFecha_ini_entregables(String fecha_ini_entregables) {
        this.fecha_ini_entregables = fecha_ini_entregables;
    }

    public void setFecha_fin_entregables(String fecha_fin_entregables) {
        this.fecha_fin_entregables = fecha_fin_entregables;
    }

    
    
    public Long getId_evento() {
        return id_evento;
    }

    public void setId_evento(Long id_evento) {
        this.id_evento = id_evento;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getTipo_evento() {
        return tipo_evento;
    }

    public void setTipo_evento(String tipo_evento) {
        this.tipo_evento = tipo_evento;
    }

    public String getEstado_evento() {
        return estado_evento;
    }

    public void setEstado_evento(String estado_evento) {
        this.estado_evento = estado_evento;
    }

    public Fecha getFecha_apertura() {
        return fecha_apertura;
    }

    public void setFecha_apertura(Fecha fecha_apertura) {
        this.fecha_apertura = fecha_apertura;
    }

    public Fecha getFecha_inicio_clases() {
        return fecha_inicio_clases;
    }

    public void setFecha_inicio_clases(Fecha fecha_inicio_clases) {
        this.fecha_inicio_clases = fecha_inicio_clases;
    }

    public Fecha getFecha_fin_clases() {
        return fecha_fin_clases;
    }

    public void setFecha_fin_clases(Fecha fecha_fin_clases) {
        this.fecha_fin_clases = fecha_fin_clases;
    }
    
    
}
