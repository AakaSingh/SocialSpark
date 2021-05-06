package model;

public class Notification {
	int notifId;
	User sender;
	int type;
	
	public Notification(int notifId,int type,  User sender) {
		this.notifId = notifId;
		this.sender = sender;
		this.type = type;
	}
	
	public int getNotifId()
	{
		return notifId;
	}
	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	
	
	
}
