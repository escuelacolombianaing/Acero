/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.daoAPI;

import edu.escuelaing.acero.domainClasses.EntregableAsociados;
import edu.escuelaing.acero.domainClasses.Equipo;
import edu.escuelaing.acero.domainClasses.Reto;
import edu.escuelaing.acero.persistence.Persistencia;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author javier.tambo
 */
public class EntregableAsociadosDao implements Dao<EntregableAsociados> {

    Persistencia bd = new Persistencia();

    public List<EntregableAsociados> obtenerPorIdEvento(Long id_evento) throws Exception {
        List<EntregableAsociados> entregableasociado = new ArrayList<EntregableAsociados>();
        HashMap[] datos = new HashMap[0];
        try {
            datos = bd.getRegistros("select P.id_parametro as id_parametro_P,P.desc_valor_parametro,\n"
                    + "(case when ISNULL(EA.id,0)=0 then 0 else 1 end)as Estado,ISNULL(EA.id,0)as id\n"
                    + ",ISNULL(EA.id_parametro,0)as id_parametro,ISNULL(EA.id_evento,0)as id_evento,ISNULL(EA.porcentaje,0)as porcentaje from EMEC_RETOS.dbo.[EntregableAsociados] EA\n"
                    + "right join EMEC_RETOS.dbo.Parametros P ON P.id_parametro=EA.id_parametro and EA.id_evento='" + id_evento + "'\n"
                    + "where P.tipo_parametro='ENTR' order by 2");
            if (!(datos.length == 0)) {
                for (HashMap eq : datos) {
                    EntregableAsociados entregable = new EntregableAsociados();
                    entregable.setId(Long.parseLong((String) eq.get("id")));
                    entregable.setId_parametro(Long.parseLong((String) eq.get("id_parametro_P")));
                    entregable.setId_evento(Long.parseLong((String) eq.get("id_evento")));
                    entregable.setPorcentaje(Integer.parseInt((String) eq.get("porcentaje")));
                    entregable.setEstado(Integer.parseInt((String) eq.get("Estado")));
                    entregableasociado.add(entregable);
                }
            }
        } catch (Exception e) {
            throw new Exception("Error al consultar EntregableAsociados", e);
        }
        return entregableasociado;
    }

    @Override
    public EntregableAsociados obtenerPorId(Long id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<EntregableAsociados> obtenerTodos() throws Exception {
        List<EntregableAsociados> entregableasociado = new ArrayList<EntregableAsociados>();
        HashMap[] datos = new HashMap[0];
        try {
            datos = bd.getRegistros("select P.id_parametro as id_parametro_P,P.desc_valor_parametro,\n"
                    + "(case when ISNULL(EA.id,0)=0 then 0 else 1 end)as Estado,EA.* from EMEC_RETOS.dbo.[EntregableAsociados] EA\n"
                    + "right join EMEC_RETOS.dbo.Parametros P ON P.id_parametro=EA.id_parametro \n"
                    + "where P.tipo_parametro='ENTR' order by 2");
            if (!(datos.length == 0)) {
                for (HashMap eq : datos) {
                    EntregableAsociados entregable = new EntregableAsociados();
                    entregable.setId(Long.parseLong((String) eq.get("id")));
                    entregable.setId_parametro(Long.parseLong((String) eq.get("id_parametro_P")));
                    entregable.setId_evento(Long.parseLong((String) eq.get("id_evento")));
                    entregable.setPorcentaje(Integer.parseInt((String) eq.get("porcentaje")));
                    entregable.setEstado(Integer.parseInt((String) eq.get("Estado")));
                    entregableasociado.add(entregable);
                }
            }
        } catch (Exception e) {
            throw new Exception("Error al consultar EntregableAsociadosTodos", e);
        }
        return entregableasociado;
    }

    @Override
    public Long guardar(EntregableAsociados t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int guardarE(EntregableAsociados t) throws Exception {
        int respuesta = 2;
        try {
            bd.actualizar("insert into EMEC_RETOS.dbo.EntregableAsociados values(" + t.getId_parametro() + "," + t.getId_evento() + ",'" + t.getPorcentaje() + "')");

        } catch (Exception ex) {
            return 2;
        } finally {
            bd.isDesconectar();
        }
        return 1;
    }

    @Override
    public void actualizar(EntregableAsociados t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int actualizarE(EntregableAsociados t) throws Exception {
        int respuesta = 2;
        try {
            bd.actualizar("update EMEC_RETOS.dbo.EntregableAsociados set porcentaje='" + t.getPorcentaje() + "' where id_evento='" + t.getId_evento()+ "' and id_parametro='"+t.getId_parametro()+"'");

        } catch (Exception ex) {
            return 2;
        } finally {
            bd.isDesconectar();
        }
        return 1;
    }

    @Override
    public void borrar(EntregableAsociados t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int borrarE(EntregableAsociados t) throws Exception {
        int respuesta = 2;
        try {
            bd.actualizar("delete EMEC_RETOS.dbo.EntregableAsociados where id_parametro='" + t.getId_parametro() + "' and id_evento="+t.getId_evento());

        } catch (Exception ex) {
            return 2;
        } finally {
            bd.isDesconectar();
        }
        return 1;
    }

}
