/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.daoAPI;

import edu.escuelaing.acero.domainClasses.Equipo;
import edu.escuelaing.acero.domainClasses.Reto;
import edu.escuelaing.acero.persistence.Persistencia;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class EquipoDao implements Dao<Equipo> {

    Persistencia bd = new Persistencia();

    @Override
    public Equipo obtenerPorId(Long id) throws Exception {
        Equipo ans = new Equipo();
        HashMap datos = new HashMap();
        try {
            datos = bd.getRegistro("select Equi.id_equipo, Equi.nombre_equipo, Equi.max_participantes,isnull(Tut.id_nacional_tutor,'')as id_nacional_tutor,isnull(Tut.id_reto,0)as id_reto from EMEC_RETOS.dbo.Equipo Equi\n" +
"left JOIN EMEC_RETOS.[dbo].[equipo_desarrolla_reto] Tut On Tut.id_equipo=Equi.id_equipo where Equi.id_equipo= " + id + " ");
            if (!datos.isEmpty()) {
                ans.setId_equipo(Long.parseLong((String) datos.get("id_equipo")));
                ans.setNombre_equipo((String) datos.get("nombre_equipo"));
                ans.setMax_participantes(Integer.parseInt((String) datos.get("max_participantes")));
                ans.setTutor((String) datos.get("id_nacional_tutor"));
                ans.setRetos_desarrolla(this.consultaDesarrolla(ans, Long.parseLong((String) datos.get("id_reto"))));
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar equipo por ID", ex);
        }
        return ans;
    }

    @Override
    public List<Equipo> obtenerTodos() throws Exception {
        List<Equipo> ans = new ArrayList<>();
        HashMap[] datos = new HashMap[0];
        try {
            datos = bd.getRegistros("select Equi.id_equipo, Equi.nombre_equipo, Equi.max_participantes,isnull(Tut.id_nacional_tutor,'')as id_nacional_tutor,isnull(Tut.id_reto,0)as id_reto from EMEC_RETOS.dbo.Equipo Equi\n"
                    + "left JOIN EMEC_RETOS.[dbo].[equipo_desarrolla_reto] Tut On Tut.id_equipo=Equi.id_equipo");
            if (!(datos.length == 0)) {
                for (HashMap eq : datos) {
                    Equipo equipo = new Equipo();
                    equipo.setId_equipo(Long.parseLong((String) eq.get("id_equipo")));
                    equipo.setNombre_equipo((String) eq.get("nombre_equipo"));
                    equipo.setMax_participantes(Integer.parseInt((String) eq.get("max_participantes")));
                    equipo.setTutor((String) eq.get("id_nacional_tutor"));
                    if (eq.get("id_reto").equals(0)) {
                    } else {
                        equipo.setRetos_desarrolla(this.consultaDesarrolla(equipo, Long.parseLong((String) eq.get("id_reto"))));
                    }
                    ans.add(equipo);
                }
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar equipos" + ex.getMessage(), ex);
        }
        return ans;
    }

    @Override
    public Long guardar(Equipo t) throws Exception {
        Equipo cons = this.obtenerPorId(t.getId_equipo());
        Long ans = new Long(0);
        if (cons.getId_equipo() != null) {
            ans = cons.getId_equipo();
            this.actualizar(t);
        } else {
            try {
                ans = bd.actualizar("insert into EMEC_RETOS.dbo.Equipo (nombre_equipo, max_participantes) values ('" + t.getNombre_equipo() + "', " + t.getMax_participantes() + " )");
                bd.actualizar("delete from EMEC_RETOS.dbo.equipo_desarrolla_reto where id_equipo = " + t.getId_equipo() + " ");
                for (Reto reto : t.getRetos_desarrolla()) {
                    bd.actualizar("insert into EMEC_RETOS.dbo.equipo_desarrolla_reto (id_equipo, id_reto, id_nacional_tutor) values ( " + t.getId_equipo() + " , " + reto.getId_reto() + " , " + reto.getId_evento() + ",'')");
                }
            } catch (Exception ex) {
                throw new Exception("Error al guardar equipo", ex);
            } finally {
                bd.isDesconectar();
            }
        }
        return ans;
    }

    @Override
    public void actualizar(Equipo t) throws Exception {
        try {
            bd.actualizar("UPDATE EMEC_RETOS.dbo.Equipo set nombre_equipo='" + t.getNombre_equipo() + "', max_participantes= " + t.getMax_participantes() + " where id_equipo= " + t.getId_equipo() + " ");
           for (Reto reto : t.getRetos_desarrolla()) {
                bd.actualizar("if (select count(id_equipo) from EMEC_RETOS.dbo.equipo_desarrolla_reto equipo \n" +
"inner join EMEC_RETOS.dbo.Reto ret on ret.id_reto=equipo.id_reto\n" +
"inner join EMEC_RETOS.dbo.Evento even on even.id_evento=ret.id_evento and even.id_evento="+reto.getId_evento()+"\n" +
"where id_equipo="+t.getId_equipo()+" )=1 \n" +
"update EMEC_RETOS.dbo.equipo_desarrolla_reto set id_reto="+reto.getId_reto()+" from EMEC_RETOS.dbo.Reto ret\n" +
"inner join EMEC_RETOS.dbo.evento even on even.id_evento=ret.id_evento and even.id_evento=10\n" +
"where ret.id_reto=equipo_desarrolla_reto.id_reto \n" +
" else \n" +
"insert into EMEC_RETOS.dbo.equipo_desarrolla_reto (id_equipo, id_reto) values ("+t.getId_equipo()+","+reto.getId_reto()+")");
            }

        } catch (Exception ex) {
            throw new Exception("Error al actualizar equipo", ex);
        }
    }

    @Override
    public void borrar(Equipo t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private List<Reto> consultaDesarrolla(Equipo t, Long id_reto) throws Exception {
        Dao<Reto> daoRetos = new RetoDao();
        List<Reto> ans = new ArrayList<>();
        HashMap[] datos = null;
        try {
            datos = bd.getRegistros("select id_reto from EMEC_RETOS.dbo.equipo_desarrolla_reto where id_equipo = " + t.getId_equipo() + " and id_reto=" + id_reto);
            for (HashMap dato : datos) {
                ans.add(daoRetos.obtenerPorId(Long.parseLong((String) dato.get("id_reto"))));
            }
        } catch (Exception e) {
            throw new Exception("Error al consultar Retos que desarrolla el Equipo", e);
        }
        return ans;
    }

    public boolean AsignarTutor(Equipo t) throws Exception {
        try {
            for (Reto reto : t.getRetos_desarrolla()) {
                bd.actualizar("update EMEC_RETOS.[dbo].[equipo_desarrolla_reto] set id_nacional_tutor='" + t.getTutor() + "'\n"
                        + "where id_equipo='" + t.getId_equipo() + "'and id_reto='" + reto.getId_reto() + "'");
            }
            return true;
        } catch (Exception e) {
            return false;

        }

    }
}
