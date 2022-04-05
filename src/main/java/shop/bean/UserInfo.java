package shop.bean;

public class UserInfo {
	String accountId;
	String password;
	String rePassword;
	String phone;
	String email;
	
	public UserInfo() {
		super();
	}

	public UserInfo(String accountId, String password, String rePassword, String phone, String email) {
		super();
		this.accountId = accountId;
		this.password = password;
		this.rePassword = rePassword;
		this.phone = phone;
		this.email = email;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
