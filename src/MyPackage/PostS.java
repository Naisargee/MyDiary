package MyPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostS {

	public void addPost(Post p){
		PreparedStatement pstatement = null;
		try {
			pstatement = DataStore.getDataStore().connection.prepareStatement("INSERT INTO post(byUser,post) VALUES(?,?)");
			pstatement.setInt(1,p.byUser);
			pstatement.setString(2,p.post);
			pstatement.executeUpdate();
			pstatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Post> viewAllPost(){
		ArrayList<Post> p = new ArrayList<Post>();
		Post pt;
		PreparedStatement pstatement;
		try {
			pstatement = DataStore.getDataStore().connection.prepareStatement("SELECT * FROM post");
		
		ResultSet resultset=pstatement.executeQuery();
		while(resultset.next()){
			String n=resultset.getString("post");
			int t=resultset.getInt("byUser");
			pt=new Post(t,n);
			p.add(pt);
		}
		pstatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}
	
	public ArrayList<Post> viewPost(int user_id){
		ArrayList<Post> p = new ArrayList<Post>();
		Post pt;
		PreparedStatement pstatement;
		try {
			pstatement = DataStore.getDataStore().connection.prepareStatement("SELECT * FROM post WHERE byUser=?");
		
		pstatement.setInt(1, user_id);
		ResultSet resultset=pstatement.executeQuery();
		while(resultset.next()){
			String n=resultset.getString("post");
			pt=new Post(user_id,n);
			p.add(pt);
		}
		pstatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;		
	}
	
}
