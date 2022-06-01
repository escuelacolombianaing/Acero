/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.daoAPI;

import edu.escuelaing.acero.domainClasses.Evento;
import edu.escuelaing.acero.domainClasses.Fecha;
import edu.escuelaing.acero.persistence.Persistencia;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class EventoDao implements Dao<Evento>{

    Persistencia bd = new Persistencia();
    
    @Override
    public Evento obtenerPorId(Long id) throws Exception {
        Evento ans = new Evento();
        HashMap datos=new HashMap();
        HashMap datos_fec_ap= new HashMap();
        HashMap datos_fec_in= new HashMap();
        HashMap datos_fec_fi= new HashMap();
        Fecha fec_ap = new Fecha();
        Fecha fec_in = new Fecha();
        Fecha fec_fi = new Fecha();
        try {
                datos=bd.getRegistro("select id_evento, periodo, descripcion, [year], tipo_evento, estado_evento, fecha_apertura, fecha_inicio_clases, fecha_fin_clases,fecha_ini_entregables,fecha_fin_entregables from EMEC_RETOS.dbo.Evento where id_evento= "+id+" ");
                datos_fec_ap=bd.getRegistro("select id_fecha, numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha from EMEC_RETOS.dbo.Fecha where id_fecha = "+((String) datos.get("fecha_apertura"))+" ");
                datos_fec_in=bd.getRegistro("select id_fecha, numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha from EMEC_RETOS.dbo.Fecha where id_fecha = "+((String) datos.get("fecha_inicio_clases"))+" ");
                datos_fec_fi=bd.getRegistro("select id_fecha, numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha from EMEC_RETOS.dbo.Fecha where id_fecha = "+((String) datos.get("fecha_fin_clases"))+" ");

            if(!datos.isEmpty()){
                ans.setId_evento(Long.parseLong((String) datos.get("id_evento")));
                ans.setPeriodo((String) datos.get("periodo"));
                ans.setDescripcion((String) datos.get("descripcion"));
                ans.setYear(Integer.parseInt((String) datos.get("year")));
                ans.setTipo_evento((String) datos.get("tipo_evento"));
                ans.setEstado_evento((String) datos.get("estado_evento"));
                fec_ap= new Fecha(Long.parseLong((String) datos_fec_ap.get("id_fecha")), Integer.parseInt((String) datos_fec_ap.get("numero_semana_inicio")), Integer.parseInt((String) datos_fec_ap.get("numero_semana_fin")), (String) datos_fec_ap.get("fecha_inicio"), (String) datos_fec_ap.get("fecha_fin"), (String) datos_fec_ap.get("estado_fecha"));
                fec_in= new Fecha(Long.parseLong((String) datos_fec_in.get("id_fecha")), Integer.parseInt((String) datos_fec_in.get("numero_semana_inicio")), Integer.parseInt((String) datos_fec_in.get("numero_semana_fin")), (String) datos_fec_in.get("fecha_inicio"), (String) datos_fec_in.get("fecha_fin"), (String) datos_fec_in.get("estado_fecha"));
                fec_fi= new Fecha(Long.parseLong((String) datos_fec_fi.get("id_fecha")), Integer.parseInt((String) datos_fec_fi.get("numero_semana_inicio")), Integer.parseInt((String) datos_fec_fi.get("numero_semana_fin")), (String) datos_fec_fi.get("fecha_inicio"), (String) datos_fec_fi.get("fecha_fin"), (String) datos_fec_fi.get("estado_fecha"));
                ans.setFecha_apertura(fec_ap);
                ans.setFecha_inicio_clases(fec_in);
                ans.setFecha_fin_clases(fec_fi);
                ans.setFecha_ini_entregables((String) datos.get("fecha_ini_entregables"));
                ans.setFecha_fin_entregables((String) datos.get("fecha_fin_entregables"));
                        }
        } catch (Exception ex) {
            throw new Exception("Error al consultar empresa por ID", ex);
        }
        return ans;
    }

    @Override
    public List<Evento> obtenerTodos() throws Exception {
        List<Evento> ans = new ArrayList<>();
        HashMap[] datos = new HashMap[0];
        try {
                datos=bd.getRegistros("select id_evento, periodo, descripcion, [year], tipo_evento, estado_evento, fecha_apertura, fecha_inicio_clases, fecha_fin_clases, fecha_ini_entregables,fecha_fin_entregables from EMEC_RETOS.dbo.Evento");

            if(!(datos.length==0)){
                for (HashMap eve : datos) {
                    Evento evento = new Evento();
                    HashMap datos_fec_ap=bd.getRegistro("select id_fecha, numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha from EMEC_RETOS.dbo.Fecha where id_fecha = "+((String) eve.get("fecha_apertura"))+" ");
                    HashMap datos_fec_in=bd.getRegistro("select id_fecha, numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha from EMEC_RETOS.dbo.Fecha where id_fecha = "+((String) eve.get("fecha_inicio_clases"))+" ");
                    HashMap datos_fec_fi=bd.getRegistro("select id_fecha, numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha from EMEC_RETOS.dbo.Fecha where id_fecha = "+((String) eve.get("fecha_fin_clases"))+" ");
                    evento.setId_evento(Long.parseLong((String) eve.get("id_evento")));
                    evento.setPeriodo((String) eve.get("periodo"));
                    evento.setDescripcion((String) eve.get("descripcion"));
                    evento.setYear(Integer.parseInt((String) eve.get("year")));
                    evento.setTipo_evento((String) eve.get("tipo_evento"));
                    evento.setEstado_evento((String) eve.get("estado_evento"));
                    Fecha fec_ap= new Fecha(Long.parseLong((String) datos_fec_ap.get("id_fecha")), Integer.parseInt((String) datos_fec_ap.get("numero_semana_inicio")) , Integer.parseInt((String) datos_fec_ap.get("numero_semana_fin")), (String) datos_fec_ap.get("fecha_inicio"), (String) datos_fec_ap.get("fecha_fin"), (String) datos_fec_ap.get("estado_fecha"));
                    Fecha fec_in= new Fecha(Long.parseLong((String) datos_fec_in.get("id_fecha")), Integer.parseInt((String) datos_fec_in.get("numero_semana_inicio")), Integer.parseInt((String) datos_fec_in.get("numero_semana_fin")), (String) datos_fec_in.get("fecha_inicio"), (String) datos_fec_in.get("fecha_fin"), (String) datos_fec_in.get("estado_fecha"));
                    Fecha fec_fi= new Fecha(Long.parseLong((String) datos_fec_fi.get("id_fecha")), Integer.parseInt((String) datos_fec_fi.get("numero_semana_inicio")), Integer.parseInt((String) datos_fec_fi.get("numero_semana_fin")), (String) datos_fec_fi.get("fecha_inicio"), (String) datos_fec_fi.get("fecha_fin"), (String) datos_fec_fi.get("estado_fecha"));
                    evento.setFecha_apertura(fec_ap);
                    evento.setFecha_inicio_clases(fec_in);
                    evento.setFecha_fin_clases(fec_fi);
                    evento.setFecha_ini_entregables((String) eve.get("fecha_ini_entregables"));
                    evento.setFecha_fin_entregables((String) eve.get("fecha_fin_entregables"));
                    ans.add(evento);
                }   
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar empresas", ex);
        }
        return ans;
    }

    @Override
    public Long guardar(Evento t) throws Exception {
        Evento cons=this.obtenerPorId(t.getId_evento());
        Long ans = new Long(0);
        Long fecha_apertura = new Long(0);
        Fecha fecha_ap = t.getFecha_apertura();
        Long fecha_inicio_clases = new Long(0);
        Fecha fecha_in = t.getFecha_inicio_clases();
        Long fecha_fin_clases = new Long(0);
        Fecha fecha_fi = t.getFecha_fin_clases();
        if(cons.getId_evento()!=null){
            ans=cons.getId_evento();
            t.getFecha_apertura().setId_fecha(cons.getFecha_apertura().getId_fecha());
            t.getFecha_inicio_clases().setId_fecha(cons.getFecha_inicio_clases().getId_fecha());
            t.getFecha_fin_clases().setId_fecha(cons.getFecha_fin_clases().getId_fecha());
            this.actualizar(t);
        }else{
            try {
                    //Insertar Fecha Apertura
                    fecha_apertura = bd.actualizar("insert into EMEC_RETOS.dbo.Fecha (numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha) "
                            + " values ( "+fecha_ap.getNumero_semana_inicio()+" , "+fecha_ap.getNumero_semana_fin()+" , '"+fecha_ap.getFecha_inicio()+"', '"+fecha_ap.getFecha_fin()+"', '"+fecha_ap.getEstado_fecha()+"')");
                    //Insertar Fecha Inicio Clases
                    fecha_inicio_clases = bd.actualizar("insert into EMEC_RETOS.dbo.Fecha (numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha) "
                            + " values ( "+fecha_in.getNumero_semana_inicio()+" , "+fecha_in.getNumero_semana_fin()+" , '"+fecha_in.getFecha_inicio()+"', '"+fecha_in.getFecha_fin()+"', '"+fecha_in.getEstado_fecha()+"')");
                    //Inserta fecha Fin Calses
                    fecha_fin_clases = bd.actualizar("insert into EMEC_RETOS.dbo.Fecha (numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha) "
                            + " values ( "+fecha_fi.getNumero_semana_inicio()+" , "+fecha_fi.getNumero_semana_fin()+" , '"+fecha_fi.getFecha_inicio()+"', '"+fecha_fi.getFecha_fin()+"', '"+fecha_fi.getEstado_fecha()+"')");
                    
                    ans=bd.actualizar("insert into EMEC_RETOS.dbo.Evento (periodo, descripcion, [year], tipo_evento, estado_evento, fecha_apertura, fecha_inicio_clases, fecha_fin_clases,fecha_ini_entregables,fecha_fin_entregables) " +
                            "values ('"+t.getPeriodo()+"', '"+t.getDescripcion()+"', "+t.getYear()+" , '"+t.getTipo_evento()+"', '"+t.getEstado_evento()+"', "+fecha_apertura+" , "+fecha_inicio_clases+" , "+fecha_fin_clases+",'"+t.getFecha_ini_entregables()+"','"+t.getFecha_fin_entregables()+"')");

            } catch (Exception ex) {
                throw new Exception("Error al guardar usuario", ex);
            }
        }
        return ans;
    }

    @Override
    public void actualizar(Evento t) throws Exception {
        try {
                bd.actualizar("update EMEC_RETOS.dbo.Evento set periodo='"+t.getPeriodo()+"', descripcion='"+t.getDescripcion()+"', [year] = "+t.getYear()+" , tipo_evento= '"+t.getTipo_evento()+"', estado_evento= '"+t.getEstado_evento()+"', fecha_ini_entregables='"+t.getFecha_ini_entregables()+"',fecha_fin_entregables='"+t.getFecha_fin_entregables()+"' where id_evento= "+t.getId_evento()+" ");
                //Actualizar fecha apertura
                bd.actualizar("UPDATE EMEC_RETOS.dbo.Fecha set fecha_inicio= '"+t.getFecha_apertura().getFecha_inicio()+"', fecha_fin = '"+t.getFecha_apertura().getFecha_fin()+"' where id_fecha = "+t.getFecha_apertura().getId_fecha()+" ");
                //Actualizar fecha inicio clases
                bd.actualizar("UPDATE EMEC_RETOS.dbo.Fecha set fecha_inicio= '"+t.getFecha_inicio_clases().getFecha_inicio()+"', fecha_fin = '"+t.getFecha_inicio_clases().getFecha_fin()+"' where id_fecha = "+t.getFecha_inicio_clases().getId_fecha()+" ");
                //Actualizar fecha fin clases
                bd.actualizar("UPDATE EMEC_RETOS.dbo.Fecha set fecha_inicio= '"+t.getFecha_fin_clases().getFecha_inicio()+"', fecha_fin = '"+t.getFecha_fin_clases().getFecha_fin()+"' where id_fecha = "+t.getFecha_fin_clases().getId_fecha()+" ");

        } catch (Exception ex) {
            throw new Exception("Error al actualizar empresa", ex);
        }
    }

    @Override
    public void borrar(Evento t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
