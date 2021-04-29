package model;

public class Message {
	int senderId;
	String msgContent;
	String time;
	
	public Message(int senderId, String msgContent, String time) {
		this.senderId = senderId;
		this.msgContent = msgContent;
		this.time = time;
	}

	public int getSenderId() {
		return senderId;
	}

	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
}
