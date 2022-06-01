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
public class Reto {
    private Long id_reto = null;
    private String nombre;
    private String descripcion;
    private String estado;
    private Long id_evento;
    private Long id_empresa;
    private String fecha;
    private String nombre_contacto;
    private String correo_contacto;
    private String nombre_aprobador;
    private String correo_aprobador;
    private String telefono_contacto;
    private String horario_disponible;
    private String problema_especifico;
    private String atributos_solucion;
    private String modo_evaluacion;
    private String posible_solucion;

    public Reto() {
    }

    public Reto(Long id_reto, String nombre, String descripcion, String estado, Long id_evento, Long id_empresa, String fecha, String nombre_contacto, String correo_contacto, String nombre_aprobador, String correo_aprobador, String telefono_contacto, String horario_disponible, String problema_especifico, String atributos_solucion, String modo_evaluacion, String posible_solucion) {
        this.id_reto = id_reto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.estado = estado;
        this.id_evento = id_evento;
        this.id_empresa = id_empresa;
        this.fecha = fecha;
        this.nombre_contacto = nombre_contacto;
        this.correo_contacto = correo_contacto;
        this.nombre_aprobador = nombre_aprobador;
        this.correo_aprobador = correo_aprobador;
        this.telefono_contacto = telefono_contacto;
        this.horario_disponible = horario_disponible;
        this.problema_especifico = problema_especifico;
        this.atributos_solucion = atributos_solucion;
        this.modo_evaluacion = modo_evaluacion;
        this.posible_solucion = posible_solucion;
    }



    
    public Long getId_reto() {
        return id_reto;
    }

    public void setId_reto(Long id_reto) {
        this.id_reto = id_reto;
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

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Long getId_evento() {
        return id_evento;
    }

    public void setId_evento(Long id_evento) {
        this.id_evento = id_evento;
    }

    public Long getId_empresa() {
        return id_empresa;
    }

    public void setId_empresa(Long id_empresa) {
        this.id_empresa = id_empresa;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombre_contacto() {
        return nombre_contacto;
    }

    public void setNombre_contacto(String nombre_contacto) {
        this.nombre_contacto = nombre_contacto;
    }

    public String getCorreo_contacto() {
        return correo_contacto;
    }

    public void setCorreo_contacto(String correo_contacto) {
        this.correo_contacto = correo_contacto;
    }

    public String getNombre_aprobador() {
        return nombre_aprobador;
    }

    public void setNombre_aprobador(String nombre_aprobador) {
        this.nombre_aprobador = nombre_aprobador;
    }

    public String getCorreo_aprobador() {
        return correo_aprobador;
    }

    public void setCorreo_aprobador(String correo_aprobador) {
        this.correo_aprobador = correo_aprobador;
    }

    public String getTelefono_contacto() {
        return telefono_contacto;
    }

    public void setTelefono_contacto(String telefono_contacto) {
        this.telefono_contacto = telefono_contacto;
    }

    public String getHorario_disponible() {
        return horario_disponible;
    }

    public void setHorario_disponible(String horario_disponible) {
        this.horario_disponible = horario_disponible;
    }

    public String getProblema_especifico() {
        return problema_especifico;
    }

    public void setProblema_especifico(String problema_especifico) {
        this.problema_especifico = problema_especifico;
    }

    public String getAtributos_solucion() {
        return atributos_solucion;
    }

    public void setAtributos_solucion(String atributos_solucion) {
        this.atributos_solucion = atributos_solucion;
    }

    public String getModo_evaluacion() {
        return modo_evaluacion;
    }

    public void setModo_evaluacion(String modo_evaluacion) {
        this.modo_evaluacion = modo_evaluacion;
    }

    public String getPosible_solucion() {
        return posible_solucion;
    }

    public void setPosible_solucion(String posible_solucion) {
        this.posible_solucion = posible_solucion;
    }
    
    
}
