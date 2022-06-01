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
public class Empresa {
    
    private Long id_empresa = null;
    private String id_nacional;
    private String razon_social;
    private String direccion_empresa;
    private String pagina_web;
    private String telefono;
    private String descripcion;
    private Long id_representante;

    public Empresa() {
    }

    public Long getId_representante() {
        return id_representante;
    }

    public void setId_representante(Long id_representante) {
        this.id_representante = id_representante;
    }
    
    

    public Long getId_empresa() {
        return id_empresa;
    }

    public void setId_empresa(Long id_empresa) {
        this.id_empresa = id_empresa;
    }

    public String getId_nacional() {
        return id_nacional;
    }

    public void setId_nacional(String id_nacional) {
        this.id_nacional = id_nacional;
    }

    public String getRazon_social() {
        return razon_social;
    }

    public void setRazon_social(String razon_social) {
        this.razon_social = razon_social;
    }

    public String getDireccion_empresa() {
        return direccion_empresa;
    }

    public void setDireccion_empresa(String direccion_empresa) {
        this.direccion_empresa = direccion_empresa;
    }

    public String getPagina_web() {
        return pagina_web;
    }

    public void setPagina_web(String pagina_web) {
        this.pagina_web = pagina_web;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Empresa(Long id_empresa, String id_nacional, String razon_social, String direccion_empresa, String pagina_web, String telefono, String descripcion, Long id_representante) {
        this.id_empresa = id_empresa;
        this.id_nacional = id_nacional;
        this.razon_social = razon_social;
        this.direccion_empresa = direccion_empresa;
        this.pagina_web = pagina_web;
        this.telefono = telefono;
        this.descripcion = descripcion;
        this.id_representante = id_representante;
    }
    
}
