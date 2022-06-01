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
public class Entregable {
    
    private Long id_entregable = null;
    private String nombre;
    private String descripcion;
    private String tipo_entregable;
    private String activo_para_entregar;
    private Long id_reto;
    private Long id_equipo;
    private String retroalimentacion;
    private Fecha fecha_entrega;
    private String Nota="";

    public Entregable() {
    }

    
    
    public Entregable(String nombre, String descripcion, String tipo_entregable, String activo_para_entregar, Long id_reto, Long id_equipo, String retroalimentacion, Fecha fecha_entrega, String nota) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.tipo_entregable = tipo_entregable;
        this.activo_para_entregar = activo_para_entregar;
        this.id_reto = id_reto;
        this.id_equipo = id_equipo;
        this.retroalimentacion = retroalimentacion;
        this.fecha_entrega = fecha_entrega;
        this.Nota = nota;
    }

    public void setNota(String Nota) {
        this.Nota = Nota;
    }

    public String getNota() {
        return Nota;
    }
    

    public Long getId_entregable() {
        return id_entregable;
    }

    public void setId_entregable(Long id_entregable) {
        this.id_entregable = id_entregable;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipo_entregable() {
        return tipo_entregable;
    }

    public void setTipo_entregable(String tipo_entregable) {
        this.tipo_entregable = tipo_entregable;
    }

    public String getActivo_para_entregar() {
        return activo_para_entregar;
    }

    public void setActivo_para_entregar(String activo_para_entregar) {
        this.activo_para_entregar = activo_para_entregar;
    }

    public Long getId_reto() {
        return id_reto;
    }

    public void setId_reto(Long id_reto) {
        this.id_reto = id_reto;
    }

    public Long getId_equipo() {
        return id_equipo;
    }

    public void setId_equipo(Long id_equipo) {
        this.id_equipo = id_equipo;
    }

    public String getRetroalimentacion() {
        return retroalimentacion;
    }

    public void setRetroalimentacion(String retroalimentacion) {
        this.retroalimentacion = retroalimentacion;
    }

    public Fecha getFecha_entrega() {
        return fecha_entrega;
    }

    public void setFecha_entrega(Fecha fecha_entrega) {
        this.fecha_entrega = fecha_entrega;
    }
    
    
}
