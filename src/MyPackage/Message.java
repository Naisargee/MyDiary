package MyPackage;

public class Message {

	int fromuser;
	int touser;
	String msg;
	
	public Message(int f,int t,String k){
		fromuser=f;
		touser=t;
		msg=k;
	}

	public int getFromuser() {
		return fromuser;
	}

	public void setFromuser(int fromuser) {
		this.fromuser = fromuser;
	}

	public int getTouser() {
		return touser;
	}

	public void setTouser(int touser) {
		this.touser = touser;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	

}
