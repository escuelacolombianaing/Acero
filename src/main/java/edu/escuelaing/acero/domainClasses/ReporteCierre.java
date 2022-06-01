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
public class ReporteCierre {

    private int id_evento;
    private int year;
    private int periodo;
    private String descripcion;
    private int id_equipo;
    private String nombre_equipo;
    private String empresa;
    private String nota;
    private int id_reto;
    private String nombre_reto;
    
    public ReporteCierre(){}
    
    public ReporteCierre(int id_evento, int year, int periodo, String descripcion, int id_equipo, String nombre_equipo, String empresa, String nota,int id_reto, String nombre_reto) {
        this.id_evento = id_evento;
        this.year = year;
        this.periodo = periodo;
        this.descripcion = descripcion;
        this.id_equipo = id_equipo;
        this.nombre_equipo = nombre_equipo;
        this.empresa = empresa;
        this.nota = nota;
        this.id_reto=id_reto;
        this.nombre_reto=nombre_reto;
    }

    
    public void setId_reto(int id_reto) {
        this.id_reto = id_reto;
    }

    public void setNombre_reto(String nombre_reto) {
        this.nombre_reto = nombre_reto;
    }

    public int getId_reto() {
        return id_reto;
    }

    public String getNombre_reto() {
        return nombre_reto;
    }

    public int getId_evento() {
        return id_evento;
    }

    public int getYear() {
        return year;
    }

    public int getPeriodo() {
        return periodo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public int getId_equipo() {
        return id_equipo;
    }

    public String getNombre_equipo() {
        return nombre_equipo;
    }

    public String getEmpresa() {
        return empresa;
    }

    public String getNota() {
        return nota;
    }

    public void setId_evento(int id_evento) {
        this.id_evento = id_evento;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setId_equipo(int id_equipo) {
        this.id_equipo = id_equipo;
    }

    public void setNombre_equipo(String nombre_equipo) {
        this.nombre_equipo = nombre_equipo;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public void setNota(String nota) {
        this.nota = nota;
    }
    
    
}
