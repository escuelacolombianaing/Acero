/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.daoAPI;

import edu.escuelaing.acero.domainClasses.Empresa;
import edu.escuelaing.acero.persistence.Persistencia;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class EmpresaDao implements Dao<Empresa>{
    
    Persistencia bd = new Persistencia();
    
    @Override
    public Empresa obtenerPorId(Long id)  throws Exception{
        Empresa ans = new Empresa();
        HashMap datos=new HashMap();
        try {
                datos=bd.getRegistro("select id_empresa, id_nacional, razon_social, direccion_empresa, pagina_web, telefono, descripcion, id_representante from EMEC_RETOS.dbo.Empresa where id_nacional='"+id.toString()+"'");

            if(!datos.isEmpty()){
                ans.setId_empresa(Long.parseLong((String) datos.get("id_empresa")) );
                ans.setId_nacional((String) datos.get("id_nacional"));
                ans.setRazon_social((String) datos.get("razon_social"));
                ans.setDireccion_empresa((String) datos.get("direccion_empresa"));
                ans.setPagina_web((String) datos.get("pagina_web"));
                ans.setTelefono((String) datos.get("telefono"));
                ans.setId_representante(Long.parseLong((String) datos.get("id_representante")));
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar empresa por ID", ex);
        }
        return ans;
    }

    @Override
    public List<Empresa> obtenerTodos()  throws Exception{
        List<Empresa> ans = new ArrayList<>();
        HashMap[] datos = new HashMap[0];
        try {
                datos=bd.getRegistros("select id_empresa, id_nacional, razon_social, direccion_empresa, pagina_web, telefono, descripcion, id_representante from EMEC_RETOS.dbo.Empresa");

            if(!(datos.length==0)){
                for (HashMap emp : datos) {
                    Empresa empre= new Empresa();
                    empre.setId_empresa(Long.parseLong((String) emp.get("id_empresa")) );
                    empre.setId_nacional((String) emp.get("id_nacional"));
                    empre.setRazon_social((String) emp.get("razon_social"));
                    empre.setDireccion_empresa((String) emp.get("direccion_empresa"));
                    empre.setPagina_web((String) emp.get("pagina_web"));
                    empre.setTelefono((String) emp.get("telefono"));
                    empre.setId_representante(Long.parseLong((String) emp.get("id_representante")));
                    ans.add(empre);
                }   
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar empresas", ex);
        }
        return ans;
    }

    @Override
    public Long guardar(Empresa t)  throws Exception{
        Long ans= new Long(0);
       try {
                    ans=bd.actualizar("insert into EMEC_RETOS.dbo.Empresa (id_nacional, razon_social, direccion_empresa, pagina_web, telefono, descripcion, id_representante)"
                            + " values ("+t.getId_nacional()+", '"+t.getRazon_social()+"', '"+t.getDireccion_empresa()+"', '"+t.getPagina_web()+"', '"+t.getTelefono()+"', '"+t.getDescripcion()+"', "+t.getId_representante()+")");
            } catch (Exception ex) {
                throw new Exception("Error al guardar empresa", ex);
            }finally{
                bd.isDesconectar();
            }
        return ans;
    }

    @Override
    public void actualizar(Empresa t)  throws Exception{
        
        try {
                bd.actualizar("update EMEC_RETOS.dbo.Empresa set razon_social='"+t.getRazon_social()+"', direccion_empresa='"+t.getDireccion_empresa()+"', pagina_web='"+t.getPagina_web()+"', telefono='"+t.getTelefono()+"', descripcion='"+t.getDescripcion()+"', id_representante='"+t.getId_representante()+"' where id_nacional='"+t.getId_nacional()+"'");

        } catch (Exception ex) {
            throw new Exception("Error al actualizar empresa", ex);
        }
    }

    @Override
    public void borrar(Empresa t)  throws Exception{
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
