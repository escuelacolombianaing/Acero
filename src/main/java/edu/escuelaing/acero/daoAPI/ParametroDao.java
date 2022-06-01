/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.daoAPI;

import edu.escuelaing.acero.domainClasses.Fecha;
import edu.escuelaing.acero.domainClasses.Parametro;
import edu.escuelaing.acero.persistence.Persistencia;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class ParametroDao implements Dao<Parametro> {

    Persistencia bd = new Persistencia();

    @Override
    public Parametro obtenerPorId(Long id) throws Exception {
        Parametro ans = new Parametro();
        HashMap datos = new HashMap();
        HashMap datos_fec_con = new HashMap();
        try {
            datos = bd.getRegistro("select id_parametro, tipo_parametro, desc_tipo_parametro, valor_parametro, desc_valor_parametro, activo, fecha_control from EMEC_RETOS.dbo.Parametros where id_parametro='" + id.toString() + "'");
            datos_fec_con = bd.getRegistro("select id_fecha, numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha from EMEC_RETOS.dbo.Fecha where id_fecha = " + ((String) datos.get("fecha_control")) + " ");
            if (!datos.isEmpty()) {
                ans.setId_parametro(Long.parseLong((String) datos.get("id_parametro")));
                ans.setTipo_parametro((String) datos.get("tipo_parametro"));
                ans.setDesc_tipo_parametro((String) datos.get("desc_tipo_parametro"));
                ans.setValor_parametro((String) datos.get("valor_parametro"));
                ans.setDes_valor_parametro((String) datos.get("desc_valor_parametro"));
                ans.setActivo((String) datos.get("activo"));
                if (datos_fec_con.isEmpty()) {
                    ans.setFecha_control(new Fecha(Long.parseLong((String) datos_fec_con.get("id_fecha")), Integer.parseInt((String) datos_fec_con.get("numero_semana_inicio")), Integer.parseInt((String) datos_fec_con.get("numero_semana_fin")), (String) datos_fec_con.get("fecha_inicio"), (String) datos_fec_con.get("fecha_fin"), (String) datos_fec_con.get("estado_fecha")));
                } else {
                    ans.setFecha_control(null);
                }
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar el parametro por ID", ex);
        }
        return ans;
    }

    @Override
    public List<Parametro> obtenerTodos() throws Exception {
        ArrayList ans = new ArrayList();
        HashMap[] datos = new HashMap[0];
        HashMap datos_fec_con = new HashMap();
        try {
            datos = bd.getRegistros("select id_parametro, tipo_parametro, desc_tipo_parametro, valor_parametro, desc_valor_parametro, activo \n"
                    + "from EMEC_RETOS.dbo.Parametros where activo='1'\n"
                    + "UNION\n"
                    + "select cod_emp ,'TUT','Tutor de universidad','TUT',\n"
                    + "(rtrim(ltrim(nom_emp))+' '+rtrim(ltrim(ap1_emp))+' '+rtrim(ltrim(ap2_emp)))COLLATE Latin1_general_CI_AI,'1'\n"
                    + " from Novasoft.dbo.rhh_emplea \n"
                    + " where cod_cl1 in ('1213005001','1213005002','1213005003','1213010000') order by 5");
            for (HashMap dato : datos) {
                datos_fec_con = bd.getRegistro("select id_fecha, numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_fin, estado_fecha from EMEC_RETOS.dbo.Fecha ");
                Parametro param = new Parametro();
                param.setId_parametro(Long.parseLong((String) dato.get("id_parametro")));
                param.setTipo_parametro((String) dato.get("tipo_parametro"));
                param.setDesc_tipo_parametro((String) dato.get("desc_tipo_parametro"));
                param.setValor_parametro((String) dato.get("valor_parametro"));
                param.setDes_valor_parametro((String) dato.get("desc_valor_parametro"));
                param.setActivo((String) dato.get("activo"));
                if (((String) dato.get("fecha_control")) != null) {
                    param.setFecha_control(new Fecha(Long.parseLong((String) datos_fec_con.get("id_fecha")), Integer.parseInt((String) datos_fec_con.get("numero_semana_inicio")), Integer.parseInt((String) datos_fec_con.get("numero_semana_fin")), (String) datos_fec_con.get("fecha_inicio"), (String) datos_fec_con.get("fecha_fin"), (String) datos_fec_con.get("estado_fecha")));
                } else {
                    param.setFecha_control(null);
                }
                ans.add(param);
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar el parametros", ex);
        }
        return ans;
    }

    @Override
    public Long guardar(Parametro t) throws Exception {
        return null;
    }
    
     public int guardarP(Parametro t) throws Exception {
         try {
             bd.actualizar("insert into EMEC_RETOS.dbo.Parametros values('"+t.getTipo_parametro()+"','"+t.getDesc_tipo_parametro()+"','"+t.getValor_parametro()+"','"+t.getDes_valor_parametro()+"',1)");
             return 1;
         } catch (Exception e) {
             return 2;
         }
    }

    @Override
    public void actualizar(Parametro t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void borrar(Parametro t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
