package MyPackage;

public class Post {

	int byUser;
	String post;
	
	public Post(int id,String post){
		this.byUser=id;
		this.post=post;
	/*	try {
			PostStore.getPostStore().addPost(this);
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
	}
	public int getByUser() {
		return byUser;
	}
	public void setByUser(int byUser) {
		this.byUser = byUser;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
}
