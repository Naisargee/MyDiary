package MyPackage;

public class MessageStore {

	static MessageS ms=null;
	
	public static MessageS getMessageStore(){
		if(ms==null){
			ms=new MessageS();
		}
		return ms;	
	}


}
