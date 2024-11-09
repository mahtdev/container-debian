// Importar las clases necesarias
import java.sql.*;

// Definir los detalles de conexión (modifica con tus credenciales y detalles de la BD)
String url = "jdbc:sqlserver://172.19.31.127:1433;databaseName=Kmcard_des"; // Cambia por tu base de datos
String username = "card_credito_des";  // Cambia con tu usuario de SQL Server
String password = "Banjercito2024**"; // Cambia con tu contraseña

// Crear la conexión
Connection conn = DriverManager.getConnection(url, username, password);

// Crear un Statement para ejecutar la consulta
Statement stmt = conn.createStatement();

// Ejecutar una consulta SELECT
ResultSet rs = stmt.executeQuery("SELECT * FROM nombre_de_tu_tabla");

// Iterar sobre los resultados
while (rs.next()) {
    System.out.println(rs.getString(1)); // Imprimir la primera columna de cada fila
}

// Cerrar los recursos
rs.close();
stmt.close();
conn.close();
