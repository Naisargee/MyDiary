package MyPackage;
public class DataStore{

	static DataS ds=null;
	
	public static DataS getDataStore(){
		if(ds==null){
			System.out.println("Returning NUll DataStore");
			ds=new DataS();
		}
		return ds;	
	}
}