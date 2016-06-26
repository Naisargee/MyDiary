package MyPackage;
public class UserStore{

	static UserS us=null;
	
	public static UserS getUserStore(){
		System.out.println("GetUser Reached");
		if(us==null){
			us=new UserS();
		}
		return us;	
	}
}