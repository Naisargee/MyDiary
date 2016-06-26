package MyPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MessageS {
	
	
	public void addMessage(Message m){
		PreparedStatement pstatement = null;
		try {
			pstatement = DataStore.getDataStore().connection.prepareStatement("INSERT INTO message(from_user,to_user,msg) VALUES(?,?,?)");
			pstatement.setInt(1,m.fromuser);
			pstatement.setInt(2,m.touser);
			pstatement.setString(3,m.msg);
			pstatement.executeUpdate();
			pstatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Message> viewMessage(int user1,int user2){
		ArrayList<Message> m = new ArrayList<Message>();
		Message mg;
		PreparedStatement pstatement;
		try {
		pstatement = DataStore.getDataStore().connection.prepareStatement("SELECT * FROM message WHERE ((to_user=? AND from_user=?) OR (to_user=? AND from_user=?))");		
		pstatement.setInt(1, user1);
		pstatement.setInt(2, user2);
		pstatement.setInt(3, user2);
		pstatement.setInt(4, user1);
		ResultSet resultset=pstatement.executeQuery();
		while(resultset.next()){
			int from=resultset.getInt("from_user");
			int to=resultset.getInt("to_user");
			String ml=resultset.getString("msg");
			mg=new Message(from,to,ml);
			m.add(mg);
		}
		
		pstatement=DataStore.getDataStore().connection.prepareStatement("UPDATE message SET seen=true WHERE (seen=? AND to_user=?");
		pstatement.setBoolean(1, false);
		pstatement.setInt(2, user1);
		pstatement.executeUpdate();
		pstatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;		
	}

}
