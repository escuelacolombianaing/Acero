/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.persistence;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author Juan Pablo Garcia
 */
public class Persistencia {

    private static final String dbName = "jdbc/registro";
    private Connection conexion;
    protected int numRegs;
    private boolean conectado;
    protected String dbUrl;
    private String driver = "net.sourceforge.jtds.jdbc.Driver";
    /**
     * En este atributo de clase se almacenan todos los mensajes
     * cuando se ejecutan acciones sobre la base de datos. Es importante
     * tener en cuenta que s�lo el �ltimo mensaje est� disponible,
     * porque con cada nueva acci�n, el mensaje es actualizado.
     */
    protected String mensaje;

    /** Crea una instancia del objeto base de datos para ser usada por otros
     * objetos. Coloca el numero de registros en -1 y no hay conexion aun :
     * conectado = false
     */
    public Persistencia() {
        numRegs = -1;
        conectado = false;
    }

    public boolean isConexion() throws SQLException, Exception {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbName);
            conexion = ds.getConnection();
            conectado = true;
        } catch (Exception e) {
            throw e;
        }
        return conectado;

    }

    public boolean isDesconectar() throws SQLException, Exception {
        try {
            conexion.close();
            conectado = false;
            return true;
        } catch (Exception e) {
            throw e;
        }
    }

    public HashMap[] getRegistros(String consulta) throws
            ClassNotFoundException, SQLException, Exception {
        ResultSet resCons_ = null;
        HashMap[] resultado_ = null;
        PreparedStatement sentenciaConsulta_ = null;
        try {
            this.conectado = isConexion();
            sentenciaConsulta_ = this.conexion.prepareStatement(consulta);
            resCons_ = sentenciaConsulta_.executeQuery();
            ArrayList listado = new ArrayList();
            ResultSetMetaData rsm = resCons_.getMetaData();
            //Almacenamos la tabla con las propiedades obtenidas y su resultado
            while (resCons_.next()) {
                HashMap ht = new HashMap();
                for (int i = 1; i <= rsm.getColumnCount(); i++) {
                    ht.put(rsm.getColumnName(i), resCons_.getString(i));
                }
                listado.add(ht);
            }
            //Preparamos el resultado
            resultado_ = new HashMap[listado.size()];
            resultado_ = (HashMap[]) listado.toArray(resultado_);
            return resultado_;
        } catch (ClassNotFoundException e) {
            throw new Exception("No se encontro el Driver de la Conexion.", e);
        } catch (SQLException e) {
            throw new Exception("Error en la Consulta.", e);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                sentenciaConsulta_.close();
                if (conectado) {
                    isDesconectar();
                }
            } catch (Exception e) {
                throw new Exception("Error cerrando la conexion a la Base de Datos.", e);
            }
        }
    }

    public HashMap getRegistro(String consulta) throws Exception {
        ResultSet resCons_ = null;
        HashMap resultado_ = new HashMap();
        PreparedStatement sentenciaConsulta_ = null;
        try {
            this.conectado = isConexion();
            sentenciaConsulta_ = this.conexion.prepareStatement(consulta);
            resCons_ = sentenciaConsulta_.executeQuery();

            ResultSetMetaData rsm = resCons_.getMetaData();
            //Almacenamos la tabla con las propiedades obtenidas y su resultado
            while (resCons_.next()) {
                for (int i = 1; i <= rsm.getColumnCount(); i++) {
                    resultado_.put(rsm.getColumnName(i), resCons_.getString(i));
                }
            }
            return resultado_;
        } catch (ClassNotFoundException e) {
            throw new Exception("No se encontro el Driver de la Conexion.", e);
        } catch (SQLException e) {
            throw new Exception("Error en la consulta: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new Exception("Error no Definido. " + e.getMessage(), e);
        } finally {
            try {
                sentenciaConsulta_.close();
                if (conectado) {
                    isDesconectar();
                }
            } catch (Exception e) {
                throw new Exception("Error cerrando la conexion a la Base de Datos.", e);
            }
        }
    }

    public Long actualizar(String consulta) throws Exception {
        PreparedStatement sentenciaConsulta = null;
        try {
            this.conectado = isConexion();
            Long resCons;
            consulta = consulta.replaceAll("<mas>", "+");
            sentenciaConsulta = this.conexion.prepareStatement(consulta , Statement.RETURN_GENERATED_KEYS);
            resCons = Long.valueOf(sentenciaConsulta.executeUpdate());
            ResultSet keys = null;
            if((consulta.toLowerCase()).contains("insert") && resCons>0){
                keys=sentenciaConsulta.getGeneratedKeys();
                if(keys.next()){
                    resCons=keys.getLong(1);
                }
            }
            
            return resCons;
        } catch (ClassNotFoundException e) {
            throw new Exception("No se encontro el Driver de la Conexion. " + e.getMessage(), e);
        } catch (SQLException e) {
            throw new Exception("Error en la Actualizacion. " + e.getMessage(), e);
        } catch (Exception e) {
            throw new Exception("Error no Definido. " + e.getMessage(), e);
        } finally {
            try {
                sentenciaConsulta.close();
                if (conectado) {
                    isDesconectar();
                }
            } catch (Exception e) {
                throw new Exception("Error cerrando la conexion a la Base de Datos.", e);
            }
        }
    }

    public String getMensaje() {
        return this.mensaje;
    }
}
