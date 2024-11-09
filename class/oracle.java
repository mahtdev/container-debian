// Importar las clases necesarias
import java.sql.*;

// Conectar a la base de datos (modifica con tus credenciales y detalles de la BD)
String url = "jdbc:oracle:thin:@//172.20.35.31:1521/PRIMEDB"; // Cambia el URL según tu base de datos
String username = "TCTDBS";  // Cambia con tu usuario de Oracle
String password = "TCTDBS"; // Cambia con tu contraseña

// Crear la conexión
Connection conn = DriverManager.getConnection(url, username, password);

// Crear un Statement para ejecutar la consulta
Statement stmt = conn.createStatement();

// Ejecutar una consulta SELECT
ResultSet rs = stmt.executeQuery("SELECT caccounts.serno, COMPRASMENS_AGROUP.COMPRAS FROM COMPRASMENS_AGROUP LEFT OUTER JOIN caccounts ON TRIM(caccounts.numberx) = COMPRASMENS_AGROUP.Cuenta");

// Iterar sobre los resultados
while (rs.next()) {
    System.out.println(rs.getString(1)); // Imprimir la primera columna de cada fila
}

// Cerrar los recursos
rs.close();
stmt.close();
conn.close();
