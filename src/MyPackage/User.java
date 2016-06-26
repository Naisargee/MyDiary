package MyPackage;
import java.sql.SQLException;

public class User {

	int id;
	String name;
	String password;
	String description;
	private static int count=2;
	public int validate;
	User(){}
	public User(String n,String p,String d){
		count++;
		validate=0;
		this.setId(count);
		this.setDescription(d);
		this.setName(n);
		this.setPassword(p);
		try {
			System.out.println("new User() reached");
			int k=UserStore.getUserStore().addUserToDataBase(this);
			if(k!=0){
				validate=1;
				System.out.println("User is not aded");
			}
		} catch (SQLException e) {
			System.out.println("SQl Exception Cought");
			e.printStackTrace();
		}
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	

}
