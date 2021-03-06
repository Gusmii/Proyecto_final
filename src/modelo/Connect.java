package modelo;

import java.sql.*;

//--- To connect to a database Download the https://dev.mysql.com/downloads/connector/j/5.1.html library
//and copy the jar archive in  web-inf/lib folder

public class Connect {

	// ---- variables ----- //
	protected String driver = "com.mysql.jdbc.Driver";
	protected String url = "jdbc:mysql://localhost:3306/proyecto_final";
	protected String userBbdd = "root";
	protected String passBbdd = "";
	protected Connection con;

	public Connect() {
      	super();
      	this.con= null;
	}
	//edit
	public Connection CreateConection()
	{
    	try {
          	// ----- connecting procedure ----//
          	Class.forName(driver);
          	con = DriverManager.getConnection(url, userBbdd, passBbdd);

    	} catch (Exception ex) {
          	con = null;
    	}
    	return this.con;
	}
	
	

	public Connection getConnection()
	/*
	 * this function return the connection itself
	 */
	{
      	return this.con;
	}

	// ---------------------------------------------
	public void disconnect() {
      	this.con = null;
	}
}