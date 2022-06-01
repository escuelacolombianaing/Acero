/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.daoAPI;

import edu.escuelaing.acero.domainClasses.Reto;
import edu.escuelaing.acero.persistence.Persistencia;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class RetoDao implements Dao<Reto>{
    
    Persistencia bd = new Persistencia();

    @Override
    public Reto obtenerPorId(Long id) throws Exception {
        Reto ans = new Reto();
        HashMap datos=new HashMap();
        try {
                datos=bd.getRegistro("select id_reto, nombre, descripcion, estado, id_evento, id_empresa, fecha, nombre_contacto, correo_contacto, nombre_aprobador, correo_aprobador, "
                        + "telefono_contacto, horario_disponible, problema_especifico, atributos_solucion, modo_evaluacion, posible_solucion from EMEC_RETOS.dbo.Reto where id_reto="+id+"");

            if(!datos.isEmpty()){
                ans.setId_reto(Long.parseLong((String) datos.get("id_reto")));
                ans.setNombre((String) datos.get("nombre"));
                ans.setDescripcion((String) datos.get("descripcion"));
                ans.setEstado((String) datos.get("estado"));
                ans.setId_evento(Long.parseLong((String) datos.get("id_evento")));
                ans.setId_empresa(Long.parseLong((String) datos.get("id_empresa")));
                ans.setFecha((String) datos.get("fecha"));
                ans.setNombre_contacto((String) datos.get("nombre_contacto"));
                ans.setCorreo_contacto((String) datos.get("correo_contacto"));
                ans.setNombre_aprobador((String) datos.get("nombre_aprobador"));
                ans.setCorreo_aprobador((String) datos.get("correo_aprobador"));
                ans.setTelefono_contacto((String) datos.get("telefono_contacto"));
                ans.setHorario_disponible((String) datos.get("horario_disponible"));
                ans.setProblema_especifico((String) datos.get("problema_especifico"));
                ans.setAtributos_solucion((String) datos.get("atributos_solucion"));
                ans.setModo_evaluacion((String) datos.get("modo_evaluacion"));
                ans.setPosible_solucion((String) datos.get("posible_solucion"));
                
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar usuario por id", ex);
        }
        return ans;
    }

    @Override
    public List<Reto> obtenerTodos() throws Exception {
        List<Reto> ans = new ArrayList<>();
        HashMap[] datos = new HashMap[0];
        try {
                datos=bd.getRegistros("select id_reto, nombre, descripcion, estado, id_evento, id_empresa, fecha, nombre_contacto, correo_contacto, nombre_aprobador, correo_aprobador, telefono_contacto, horario_disponible, problema_especifico, atributos_solucion, modo_evaluacion, posible_solucion from EMEC_RETOS.dbo.Reto");

            if(!(datos.length==0)){
                for (HashMap ret : datos) {
                    Reto reto= new Reto();
                    reto.setId_reto(Long.parseLong((String) ret.get("id_reto")));
                    reto.setNombre((String) ret.get("nombre"));
                    reto.setDescripcion((String) ret.get("descripcion"));
                    reto.setEstado((String) ret.get("estado"));
                    reto.setId_evento(Long.parseLong((String) ret.get("id_evento")));
                    reto.setId_empresa(Long.parseLong((String) ret.get("id_empresa")));
                    reto.setFecha((String) ret.get("fecha"));
                    reto.setNombre_contacto((String) ret.get("nombre_contacto"));
                    reto.setCorreo_contacto((String) ret.get("correo_contacto"));
                    reto.setNombre_aprobador((String) ret.get("nombre_aprobador"));
                    reto.setCorreo_aprobador((String) ret.get("correo_aprobador"));
                    reto.setTelefono_contacto((String) ret.get("telefono_contacto"));
                    reto.setHorario_disponible((String) ret.get("horario_disponible"));
                    reto.setProblema_especifico((String) ret.get("problema_especifico"));
                    reto.setAtributos_solucion((String) ret.get("atributos_solucion"));
                    reto.setModo_evaluacion((String) ret.get("modo_evaluacion"));
                    reto.setPosible_solucion((String) ret.get("posible_solucion"));
                    ans.add(reto);
                }   
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar retos", ex);
        }
        return ans;
    }

    @Override
    public Long guardar(Reto t) throws Exception {
        Reto cons=this.obtenerPorId(t.getId_reto());
        Long ans = new Long(0);
        if(cons.getId_reto()!=null){
            ans=cons.getId_reto();
            this.actualizar(t);
        }else{
            try {
                    ans=bd.actualizar("insert into EMEC_RETOS.dbo.Reto (nombre, descripcion, estado, id_evento, id_empresa, fecha, nombre_contacto, correo_contacto, nombre_aprobador, correo_aprobador, telefono_contacto, horario_disponible, problema_especifico, atributos_solucion, modo_evaluacion, posible_solucion) " +
                    " values ('"+t.getNombre()+"', '"+t.getDescripcion()+"', '"+t.getEstado()+"', "+t.getId_evento()+" , "+t.getId_empresa()+" , '"+t.getFecha()+"', '"+t.getNombre_contacto()+"', '"+t.getCorreo_contacto()+"', '"+t.getNombre_aprobador()+"', '"+t.getCorreo_aprobador()+"', '"+t.getTelefono_contacto()+"', '"+t.getHorario_disponible()+"', '"+t.getProblema_especifico()+"', '"+t.getAtributos_solucion()+"', '"+t.getModo_evaluacion()+"', '"+t.getPosible_solucion()+"')");

            } catch (Exception ex) {
                throw new Exception("Error al guardar reto", ex);
            }
        }
        return ans;
    }

    @Override
    public void actualizar(Reto t) throws Exception {
        try {
                bd.actualizar("update EMEC_RETOS.dbo.Reto set nombre = '"+t.getNombre()+"', descripcion = '"+t.getDescripcion()+"', estado = '"+t.getEstado()+"', id_evento = "+t.getId_evento()+" , id_empresa = "+t.getId_empresa()+" , fecha = '"+t.getFecha()+"', nombre_contacto = '"+t.getNombre_contacto()+"', correo_contacto = '"+t.getCorreo_contacto()+"', nombre_aprobador = '"+t.getNombre_aprobador()+"', correo_aprobador = '"+t.getCorreo_aprobador()+"', telefono_contacto = '"+t.getTelefono_contacto()+"', horario_disponible = '"+t.getHorario_disponible()+"', problema_especifico = '"+t.getProblema_especifico()+"', atributos_solucion = '"+t.getAtributos_solucion()+"', modo_evaluacion = '"+t.getModo_evaluacion()+"', posible_solucion = '"+t.getPosible_solucion()+"' where id_reto= "+t.getId_reto()+" ");

        } catch (Exception ex) {
            throw new Exception("Error al actualizar reto", ex);
        }
    }

    @Override
    public void borrar(Reto t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
