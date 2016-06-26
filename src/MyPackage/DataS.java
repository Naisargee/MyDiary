package MyPackage;
import java.sql.Connection;
import java.sql.DriverManager;

public class DataS {
	
	Connection connection;
	
	DataS(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/learningsevlet1","root","");
			System.out.println("Successfully connected to the datastore");
	//   	 Statement statement=connection.createStatement();
	//		eclipse-javadoc:%E2%98%82=Niya_Book/%5C/home%5C/naisargee%5C/Niya%5C/eclipse%5C/mysql-connector-java-5.1.18-bin.jar%3CcomSystem.out.println("Worked!!");
		}catch(Exception e){
			System.out.println("Error : "+e);
		}
	}

}
