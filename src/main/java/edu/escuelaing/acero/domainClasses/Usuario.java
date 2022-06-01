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
public class Usuario {
    private Long id_usuario = null;
    private String id_nacional;
    private String nombre;
    private String apellido;
    private String correo_electronico;
    private String password;
    private String tipo_usuario;
    private Long id_equipo;
    private String tipo_id;
    private String telefono;
    private String estado_usuario;

    public String getEstado_usuario() {
        return estado_usuario;
    }

    public void setEstado_usuario(String estado_usuario) {
        this.estado_usuario = estado_usuario;
    }

    
    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTipo_id() {
        return tipo_id;
    }

    public void setTipo_id(String tipo_id) {
        this.tipo_id = tipo_id;
    }

    public Usuario() {
    }

    public Usuario(Long id_usuario, String id_nacional, String nombre, String apellido, String correo_electronico, String password, String tipo_usuario, Long id_equipo, String tipo_id, String telefono, String estado_usuario) {
        this.id_usuario = id_usuario;
        this.id_nacional = id_nacional;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo_electronico = correo_electronico;
        this.password = password;
        this.tipo_usuario = tipo_usuario;
        this.id_equipo = id_equipo;
        this.tipo_id= tipo_id;
        this.telefono = telefono;
        this.estado_usuario = estado_usuario;
    }
    
    

    public Long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Long id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getId_nacional() {
        return id_nacional;
    }

    public void setId_nacional(String id_nacional) {
        this.id_nacional = id_nacional;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public Long getId_equipo() {
        return id_equipo;
    }

    public void setId_equipo(Long id_equipo) {
        this.id_equipo = id_equipo;
    }
    
    
}
