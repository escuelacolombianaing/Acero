/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.daoAPI;

import edu.escuelaing.acero.domainClasses.Usuario;
import edu.escuelaing.acero.persistence.Persistencia;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author andres.rojas
 */
public class UsuarioDao implements Dao<Usuario>{
    
    Persistencia bd = new Persistencia();
    
    @Override
    public Usuario obtenerPorId(Long id) throws Exception {
        Usuario ans = new Usuario();
        HashMap datos=new HashMap();
        try {
                datos=bd.getRegistro("select id_usuario, id_nacional, nombre, apellido, correo_electronico, password_retos, tipo_usuario, id_equipo, tipo_id, telefono, estado_usuario from EMEC_RETOS.dbo.Usuario where id_nacional='"+id+"'");

            if(!datos.isEmpty()){
                ans.setId_usuario(Long.parseLong((String) datos.get("id_usuario")));
                ans.setId_nacional((String) datos.get("id_nacional"));
                ans.setNombre((String) datos.get("nombre"));
                ans.setApellido((String) datos.get("apellido"));
                ans.setCorreo_electronico((String) datos.get("correo_electronico"));
                ans.setPassword((String) datos.get("password_retos"));
                ans.setTipo_usuario((String) datos.get("tipo_usuario"));
                ans.setId_equipo(Long.parseLong((String) datos.get("id_equipo")));
                ans.setTipo_id((String) datos.get("tipo_id"));
                ans.setTelefono((String) datos.get("telefono"));
                ans.setEstado_usuario((String) datos.get("estado_usuario"));
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar usuario por id", ex);
        }
        return ans;
    }

    @Override
    public List<Usuario> obtenerTodos() throws Exception {
        List<Usuario> ans = new ArrayList<>();
        HashMap[] datos = new HashMap[0];
        try {
                datos=bd.getRegistros("select id_usuario, id_nacional, nombre, apellido, correo_electronico, password_retos, tipo_usuario, id_equipo, tipo_id, telefono, estado_usuario from EMEC_RETOS.dbo.Usuario");

            
            if(!(datos.length==0)){
                for (HashMap usu : datos) {
                    Usuario usuario= new Usuario();
                    usuario.setId_usuario(Long.parseLong((String) usu.get("id_usuario")));
                    usuario.setId_nacional((String) usu.get("id_nacional"));
                    usuario.setNombre((String) usu.get("nombre"));
                    usuario.setApellido((String) usu.get("apellido"));
                    usuario.setCorreo_electronico((String) usu.get("correo_electronico"));
                    usuario.setPassword((String) usu.get("password_retos"));
                    usuario.setTipo_usuario((String) usu.get("tipo_usuario"));
                    usuario.setId_equipo(Long.parseLong((String) usu.get("id_equipo")));
                    usuario.setTipo_id((String) usu.get("tipo_id"));
                    usuario.setTelefono((String) usu.get("telefono"));
                    usuario.setEstado_usuario((String) usu.get("estado_usuario"));
                    ans.add(usuario);
                }   
            }
        } catch (Exception ex) {
            throw new Exception("Error al consultar usuarios", ex);
        }
        return ans;
    }

    @Override
    public Long guardar(Usuario t) throws Exception {
        Usuario cons=this.obtenerPorId(Long.parseLong(t.getId_nacional()));
        Long ans = new Long(0);
        if(t.getId_equipo()==null){
            t.setId_equipo(new Long(-1));
        }
        if(cons.getId_nacional()!=null){
            ans=Long.parseLong(cons.getId_nacional());
            this.actualizar(t);
        }else{
            try {
                    ans=bd.actualizar("insert into EMEC_RETOS.dbo.Usuario (id_nacional, nombre, apellido, correo_electronico, password_retos, tipo_usuario, id_equipo, tipo_id, telefono, estado_usuario) "
                            + "values ("+t.getId_nacional()+", '"+t.getNombre()+"', '"+t.getApellido()+"', '"+t.getCorreo_electronico()+"', '"+t.getPassword()+"', '"+t.getTipo_usuario()+"', "+t.getId_equipo()+", '"+t.getTipo_id()+"', '"+t.getTelefono()+"', '"+t.getEstado_usuario()+"')");

            } catch (Exception ex) {
                throw new Exception("Error al guardar usuario", ex);
            }
        }
        return ans;
    }

    @Override
    public void actualizar(Usuario t) throws Exception {
        try {
                bd.actualizar("update EMEC_RETOS.dbo.Usuario set nombre='"+t.getNombre()+"', apellido='"+t.getApellido()+"', correo_electronico='"+t.getCorreo_electronico()+"', password_retos='"+t.getPassword()+"', tipo_usuario='"+t.getTipo_usuario()+"', id_equipo="+t.getId_equipo()+", telefono='"+t.getTelefono()+"', estado_usuario='"+t.getEstado_usuario()+"' where id_nacional='"+t.getId_nacional()+"'");

        } catch (Exception ex) {
            throw new Exception("Error al actualizar usuario", ex);
        }
    }

    @Override
    public void borrar(Usuario t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    
}
