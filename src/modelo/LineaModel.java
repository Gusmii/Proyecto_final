package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class LineaModel extends LineaClass {
	ArrayList<LineaModel> list = new ArrayList<LineaModel>();



	/**
	 * 
	 */
	public LineaModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param id_linea
	 * @param id_factura
	 * @param id_producto
	 * @param precio
	 * @param cantidad
	 */
	public LineaModel(int id_linea, int id_factura, int id_producto, double precio, int cantidad) {
		super(id_linea, id_factura, id_producto, precio, cantidad);
		// TODO Auto-generated constructor stub
	}
	
	

	/**
	 * @param list
	 */
	public LineaModel(ArrayList<LineaModel> list) {
		super();
		this.list = list;
	}
	
	/**
	 * @return the list
	 */
	public ArrayList<LineaModel> getList() {
		return list;
	}

	/**
	 * @param list the list to set
	 */
	public void setList(ArrayList<LineaModel> list) {
		this.list = list;
	}

	public void LoadData() throws SQLException {

		this.CreateConection();

		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("CALL LoadData_Lineas");

		while (rs.next()) { // reads the table line by line

			LineaModel myLinea = new LineaModel();
			myLinea.setId_linea(Integer.parseInt(rs.getString("id_linea")));
			myLinea.setId_factura(Integer.parseInt(rs.getString("id_factura")));
			myLinea.setId_producto(Integer.parseInt(rs.getString("id_producto")));
			myLinea.setPrecio(Double.parseDouble(rs.getString("precio")));
			myLinea.setCantidad(Integer.parseInt(rs.getString("cantidad")));

			this.list.add(myLinea);
		}
		this.disconnect();
	}
	
	public void insertData() throws SQLException {

		this.CreateConection();

		Statement st = this.con.createStatement();
		String sql="CALL insertDatos_Lineas("+this.getId_producto()+","+this.getCantidad()+","+this.getPrecio()+","+this.getId_factura()+")";
		ResultSet rs = st.executeQuery(sql);
		

		//java.sql.PreparedStatement pst;
//		int idLinea=0;
//		
//		pst = this.con.prepareStatement("call InsertDatos_Lineas(?,?,?,?)");
////		
//		pst.setInt(1, this.id_factura);
//		pst.setInt(2, this.id_producto);
//		pst.setDouble(3, this.precio);
//		pst.setInt(4, this.cantidad);
//		pst.execute();
//		ResultSet rs = pst.executeQuery();
//		if(rs.next()) {
//			idLinea=rs.getInt("id_linea");
//		}
//		
		this.disconnect();
	}
	// prueba

}
