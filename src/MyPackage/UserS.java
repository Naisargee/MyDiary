package MyPackage;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class UserS{
	UserS(){
		System.out.println("New USerS being created");
	}

	int addUserToDataBase(User user) throws SQLException {
		PreparedStatement pstatement=DataStore.getDataStore().connection.prepareStatement("INSERT INTO users(name,password,description) VALUES(?,?,?)");
		pstatement.setString(1,user.getName());
		pstatement.setString(2,user.getPassword());
		pstatement.setString(3,user.getDescription());
		if(!userExists(user)){
			pstatement.executeUpdate();
			pstatement.close();
			return 0;
		}
		else{
			pstatement.close();
			return 1;
		}		
	}

	private boolean userExists(User user) throws SQLException {
		Statement statement=DataStore.getDataStore().connection.createStatement();
		int q=0;
		ResultSet r=statement.executeQuery("SELECT name FROM users");
		while(r.next()){
			String ne=r.getString("name");
			if(ne.equalsIgnoreCase(user.getName())) { q=1;break;}
		}
		if(q==1){
			return true;
		}
		return false;
	}

	
	public int verifyUser(String n,String p) throws SQLException {
		Statement statement=DataStore.getDataStore().connection.createStatement();
		int q=0;
		ResultSet r=statement.executeQuery("SELECT * FROM users");
		while(r.next()){
			String ne=r.getString("name");
			if(ne.equalsIgnoreCase(n)) { q=1;break;}
		}
		if(q==1){
			if(r.getString("password").equals(p)) {
				return r.getInt("id");
			}
		}
		return 0;
	}
	
	public String getNameById(int i) throws SQLException{
		Statement statement=DataStore.getDataStore().connection.createStatement();
		int q=0;
		ResultSet r=statement.executeQuery("SELECT * FROM users");
		while(r.next()){
			int n=r.getInt("id");
			if(n==i) { q=1;break;}
		}
		if(q==1){
				return r.getString("name");
		}
		return "Not Found";
	}
	
	public int getIdByName(String i) throws SQLException{
		Statement statement=DataStore.getDataStore().connection.createStatement();
		int q=0;
		ResultSet r=statement.executeQuery("SELECT * FROM users");
		while(r.next()){
			String n=r.getString("name");
			if(n.equalsIgnoreCase(i)) { q=1;break;}
		}
		if(q==1){
				return r.getInt("id");
		}
		return 0;
	}
	
	public int getIdByUser(User u) throws SQLException {
		Statement statement=DataStore.getDataStore().connection.createStatement();
		int q=0;
		ResultSet r=statement.executeQuery("SELECT * FROM users");
		while(r.next()){
			if(r.getString("name")==u.getName())
			q=r.getInt("id");
		}
		
		return q;
	}
	

}