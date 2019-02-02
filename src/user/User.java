package user;




public class User {
	private String username;
	private String password;
	private String imageURL;
	private String[] followers;
	private String[] following;
	private library2 library;
	
	public User(String username, String password, String imageURL, String[] followers, String[] following,
			library2 library) {
		super();
		this.username = username;
		this.password = password;
		this.imageURL = imageURL;
		this.followers = followers;
		this.following = following;
		this.library = library;
	}
	public User(String username, String password, String imageURL)
	{
		
		this.username = username;
		this.password = password;
		this.imageURL = imageURL;
		this.followers = new String[0];
		this.following = new String[0];
		this.library = new library2();
		this.library.setFavorite(new String[0]);
		this.library.setRead(new String[0]);
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the imageURL
	 */
	public String getImageURL() {
		return imageURL;
	}

	/**
	 * @param imageURL the imageURL to set
	 */
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	/**
	 * @return the followers
	 */
	public String[] getFollowers() {
		return followers;
	}

	/**
	 * @param followers the followers to set
	 */
	public void setFollowers(String[] followers) {
		this.followers = followers;
	}

	/**
	 * @return the following
	 */
	public String[] getFollowing() {
		return following;
	}

	/**
	 * @param following the following to set
	 */
	public void setFollowing(String[] following) {
		this.following = following;
	}

	/**
	 * @return the history
	 */
	public library2 getLibrary() {
		return library;
	}

	/**
	 * @param history the history to set
	 */
	public void setHistory(library2 library) {
		this.library = library;
	}

	public class library2{
		private String[] read;
		private String[] favorite;
		/**
		 * @return the read
		 */
		public String[] getRead() {
			return read;
		}
		/**
		 * @param read the read to set
		 */
		public void setRead(String[] read) {
			this.read = read;
		}
		/**
		 * @return the favorite
		 */
		public String[] getFavorite() {
			return favorite;
		}
		/**
		 * @param favorite the favorite to set
		 */
		public void setFavorite(String[] favorite) {
			this.favorite = favorite;
		}
		
	}
}


