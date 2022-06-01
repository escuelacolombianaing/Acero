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


public class Parametro {
    private Long id_parametro = null;
    private String tipo_parametro;
    private String desc_tipo_parametro;
    private String valor_parametro;
    private String des_valor_parametro;
    private String activo;
    private Fecha fecha_control = null;

    public Parametro() {
    }

    public Fecha getFecha_control() {
        return fecha_control;
    }

    public void setFecha_control(Fecha fecha_control) {
        this.fecha_control = fecha_control;
    }

    
    
    public Long getId_parametro() {
        return id_parametro;
    }

    public void setId_parametro(Long id_parametro) {
        this.id_parametro = id_parametro;
    }

    public String getTipo_parametro() {
        return tipo_parametro;
    }

    public void setTipo_parametro(String tipo_parametro) {
        this.tipo_parametro = tipo_parametro;
    }

    public String getDesc_tipo_parametro() {
        return desc_tipo_parametro;
    }

    public void setDesc_tipo_parametro(String desc_tipo_parametro) {
        this.desc_tipo_parametro = desc_tipo_parametro;
    }

    public String getValor_parametro() {
        return valor_parametro;
    }

    public void setValor_parametro(String valor_parametro) {
        this.valor_parametro = valor_parametro;
    }

    public String getDes_valor_parametro() {
        return des_valor_parametro;
    }

    public void setDes_valor_parametro(String des_valor_parametro) {
        this.des_valor_parametro = des_valor_parametro;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public Parametro(Long id_parametro, String tipo_parametro, String desc_tipo_parametro, String valor_parametro, String des_valor_parametro, String activo, Fecha fecha_control) {
        this.id_parametro = id_parametro;
        this.tipo_parametro = tipo_parametro;
        this.desc_tipo_parametro = desc_tipo_parametro;
        this.valor_parametro = valor_parametro;
        this.des_valor_parametro = des_valor_parametro;
        this.activo = activo;
        this.fecha_control = fecha_control;
    }
    
    
}
