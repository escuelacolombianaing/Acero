/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.daoAPI;

import edu.escuelaing.acero.domainClasses.Entregable;
import edu.escuelaing.acero.domainClasses.Fecha;
import edu.escuelaing.acero.persistence.Persistencia;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class EntregableDao implements Dao<Entregable> {

    Persistencia bd = new Persistencia();

    @Override
    public Entregable obtenerPorId(Long id) throws Exception {
        Entregable ans = new Entregable();
        HashMap datos = new HashMap();
        HashMap datos_fecha_entrega = new HashMap();

        try {
            datos = bd.getRegistro("select isnull(nota,'')as nota, id_entregable, nombre, descripcion, tipo_entregable, activo_para_entregar, id_reto, id_equipo, retroalimentacion, fecha_entrega from EMEC_RETOS.dbo.Entregable where id_entregable=" + id + "");
            if (!datos.isEmpty()) {
                ans.setId_entregable(Long.parseLong((String) datos.get("id_entregable")));
                ans.setNombre((String) datos.get("nombre"));
                ans.setDescripcion((String) datos.get("descripcion"));
                ans.setTipo_entregable((String) datos.get("tipo_entregable"));
                ans.setActivo_para_entregar((String) datos.get("activo_para_entregar"));
                ans.setId_reto(Long.parseLong((String) datos.get("id_reto")));
                ans.setId_equipo(Long.parseLong((String) datos.get("id_equipo")));
                ans.setRetroalimentacion((String) datos.get("retroalimentacion"));
                ans.setNota((String) datos.get("nota"));
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar el entregable por ID", ex);
        }
        return ans;
    }

    @Override
    public List<Entregable> obtenerTodos() throws Exception {
        List<Entregable> ans = new ArrayList<>();
        HashMap[] datos = new HashMap[0];
        try {
            datos = bd.getRegistros("select isnull(nota,'')as nota, id_entregable, nombre, descripcion, tipo_entregable, activo_para_entregar, id_reto, id_equipo, retroalimentacion, fecha_entrega from EMEC_RETOS.dbo.Entregable");

            if (!(datos.length == 0)) {
                for (HashMap entre : datos) {
                    Entregable entregable = new Entregable();
                    entregable.setId_entregable(Long.parseLong((String) entre.get("id_entregable")));
                    entregable.setNombre((String) entre.get("nombre"));
                    entregable.setDescripcion((String) entre.get("descripcion"));
                    entregable.setTipo_entregable((String) entre.get("tipo_entregable"));
                    entregable.setActivo_para_entregar((String) entre.get("activo_para_entregar"));
                    entregable.setId_reto(Long.parseLong((String) entre.get("id_reto")));
                    entregable.setId_equipo(Long.parseLong((String) entre.get("id_equipo")));
                    entregable.setRetroalimentacion((String) entre.get("retroalimentacion"));
                    entregable.setNota((String) entre.get("nota"));
                    HashMap datos_fecha_entrega = bd.getRegistro("select id_fecha, numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha from EMEC_RETOS.dbo.Fecha where id_fecha = " + ((String) entre.get("fecha_entrega")) + " ");
                    entregable.setFecha_entrega(new Fecha(Long.parseLong((String) datos_fecha_entrega.get("id_fecha")), Integer.parseInt((String) datos_fecha_entrega.get("numero_semana_inicio")), Integer.parseInt((String) datos_fecha_entrega.get("numero_semana_fin")), (String) datos_fecha_entrega.get("fecha_inicio"), (String) datos_fecha_entrega.get("fecha_fin"), (String) datos_fecha_entrega.get("estado_fecha")));
                    ans.add(entregable);
                }
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar entregables", ex);
        }
        return ans;
    }

    public List<Entregable> obtenerPorEquipo(int id_equipo, int id_reto) throws Exception {
        List<Entregable> ans = new ArrayList<>();
        HashMap[] datos = new HashMap[0];
        try {
            datos = bd.getRegistros("select isnull(nota,'')as nota, id_entregable, nombre, descripcion, tipo_entregable, activo_para_entregar, id_reto, id_equipo, retroalimentacion, fecha_entrega from EMEC_RETOS.dbo.Entregable where id_reto=" + id_reto + " and id_equipo=" + id_equipo);

            if (!(datos.length == 0)) {
                for (HashMap entre : datos) {
                    Entregable entregable = new Entregable();
                    entregable.setId_entregable(Long.parseLong((String) entre.get("id_entregable")));
                    entregable.setNombre((String) entre.get("nombre"));
                    entregable.setDescripcion((String) entre.get("descripcion"));
                    entregable.setTipo_entregable((String) entre.get("tipo_entregable"));
                    entregable.setActivo_para_entregar((String) entre.get("activo_para_entregar"));
                    entregable.setId_reto(Long.parseLong((String) entre.get("id_reto")));
                    entregable.setId_equipo(Long.parseLong((String) entre.get("id_equipo")));
                    entregable.setRetroalimentacion((String) entre.get("retroalimentacion"));
                    entregable.setNota((String) entre.get("nota"));
                    ans.add(entregable);
                }
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar entregables", ex);
        }
        return ans;
    }

    @Override
    public Long guardar(Entregable t) throws Exception {
        Long ans = new Long(0);
        try {

            ans = bd.actualizar("insert into EMEC_RETOS.dbo.Entregable "
                    + "values('" + t.getNombre() + "','" + t.getDescripcion() + "','" + t.getTipo_entregable() + "','ACTV'," + t.getId_reto() + "," + t.getId_equipo() + ",'',getdate(),'')");
        } catch (Exception e) {
        }
        return ans;
    }

    @Override
    public void actualizar(Entregable t) throws Exception {
        try {
            bd.actualizar("update EMEC_RETOS.dbo.Entregable set nombre='" + t.getNombre() + "', descripcion='" + t.getDescripcion() + "', tipo_entregable='" + t.getTipo_entregable() + "', activo_para_entregar='ACTV', id_reto= " + t.getId_reto() + " , id_equipo= " + t.getId_equipo() + ", nota='" + t.getNota() + "', retroalimentacion='" + t.getRetroalimentacion() + "' where id_entregable= " + t.getId_entregable());
        } catch (Exception ex) {
            throw new Exception("Error al actualizar entregable", ex);
        }
    }

    @Override
    public void borrar(Entregable t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
