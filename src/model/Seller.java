package model;

public class Seller {
			
	public String username;
public String email;
		public String firstName, lastName;
		public String address;
		public String password;

		public Seller(String firstName, String lastName, String address) {
			super();
			this.firstName = firstName;
			this.lastName = lastName;
			this.address = address;
		}

		public Seller(String firstName, String lastName) {
			super();
			this.firstName = firstName;
			this.lastName = lastName;
		}


		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getFirstName() {
			return firstName;
		}

		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}

		public String getLastName() {
			return lastName;
		}

		public void setLastName(String lastName) {
			this.lastName = lastName;
		}
}
