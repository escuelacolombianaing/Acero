/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.daoAPI;

import edu.escuelaing.acero.domainClasses.ReporteCierre;
import edu.escuelaing.acero.persistence.Persistencia;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import static jdk.nashorn.internal.runtime.Debug.id;

/**
 *
 * @author javier.tambo
 */
public class ReporteCierreDao {

    Persistencia bd = new Persistencia();

    public List<ReporteCierre> ReporteIdEvento(int id_evento) throws Exception {
        List<ReporteCierre> Regreportes = new ArrayList<ReporteCierre>();
        HashMap[] datos = new HashMap[0];
        try {
            datos = bd.getRegistros("select b.id_evento,d.year,d.periodo,d.descripcion,c.id_equipo,c.nombre_equipo,f.razon_social,\n"
                    + "convert(decimal(4,2),SUM(a.nota*(convert(decimal(4,2),b.porcentaje)/100)))as nota,a.id_reto,e.nombre\n"
                    + "from EMEC_RETOS.dbo.EntregableAsociados b\n"
                    + "left join EMEC_RETOS.dbo.Entregable a on a.tipo_entregable=b.id_parametro\n"
                    + "left join EMEC_RETOS.dbo.Equipo c on c.id_equipo=a.id_equipo\n"
                    + "left join EMEC_RETOS.dbo.evento d on b.id_evento=d.id_evento\n"
                    + "left join EMEC_RETOS.dbo.reto e on e.id_reto=a.id_reto\n"
                    + "inner join EMEC_RETOS.dbo.empresa f on f.id_empresa=e.id_empresa\n"
                    + "where b.id_evento='" + id_evento + "'\n"
                    + "group by b.id_evento,d.year,d.periodo,d.descripcion,c.nombre_equipo,f.razon_social,\n"
                    + "c.id_equipo,a.id_reto,e.nombre");
            
            if (!(datos.length == 0)) {
                for (HashMap Report : datos) {
                       ReporteCierre reporte= new ReporteCierre();
                    reporte.setDescripcion(Report.get("descripcion").toString());
                    reporte.setEmpresa(Report.get("razon_social").toString());
                    reporte.setId_equipo(Integer.parseInt(Report.get("id_equipo").toString().trim()));
                    reporte.setId_evento(Integer.parseInt(Report.get("id_evento").toString().trim()));
                    reporte.setId_reto(Integer.parseInt(Report.get("id_reto").toString().trim()));
                    reporte.setNombre_equipo(Report.get("nombre_equipo").toString());
                    reporte.setNombre_reto(Report.get("nombre").toString());
                    reporte.setNota(Report.get("nota").toString());
                    reporte.setPeriodo(Integer.parseInt(Report.get("periodo").toString().trim()));
                    reporte.setYear(Integer.parseInt(Report.get("year").toString().trim()));
                    Regreportes.add(reporte);
                }
                
            }
        } catch (Exception ex) {
            throw new Exception("Error al generar reporte", ex);
        }
       return Regreportes;

    }
}
