package MyPackage;

public class PostStore {
	
	static PostS ps=null;
	
	public static PostS getPostStore(){
		if(ps==null){
			ps=new PostS();
		}
		return ps;	
	}

}
