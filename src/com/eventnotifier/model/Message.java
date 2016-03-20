package com.eventnotifier.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity()
@Table(name = "message")
@org.hibernate.annotations.Entity(dynamicInsert = true, dynamicUpdate = true, mutable = true)
public class Message {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int messageId;
	private String messageTo;
	private String messageFrom;
	private String subject;
	@Column(columnDefinition = "TEXT")
	private String content;
	private int readStatus;
	private int trashStatus;
	private int toDeleteStatus;
	private int fromDeleteStatus;
	private Date messageOn;

	public int getMessageId() {
		return messageId;
	}

	public String getSubject() {
		return subject;
	}

	public String getContent() {
		return content;
	}

	public int getReadStatus() {
		return readStatus;
	}

	public int getTrashStatus() {
		return trashStatus;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setReadStatus(int readStatus) {
		this.readStatus = readStatus;
	}

	public void setTrashStatus(int trashStatus) {
		this.trashStatus = trashStatus;
	}

	public String getMessageTo() {
		return messageTo;
	}

	public void setMessageTo(String messageTo) {
		this.messageTo = messageTo;
	}

	public String getMessageFrom() {
		return messageFrom;
	}

	public int getToDeleteStatus() {
		return toDeleteStatus;
	}

	public int getFromDeleteStatus() {
		return fromDeleteStatus;
	}

	public Date getMessageOn() {
		return messageOn;
	}

	public void setMessageFrom(String messageFrom) {
		this.messageFrom = messageFrom;
	}

	public void setToDeleteStatus(int toDeleteStatus) {
		this.toDeleteStatus = toDeleteStatus;
	}

	public void setFromDeleteStatus(int fromDeleteStatus) {
		this.fromDeleteStatus = fromDeleteStatus;
	}

	public void setMessageOn(Date messageOn) {
		this.messageOn = messageOn;
	}

	public Message() {
	}
}
