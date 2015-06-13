package org.springframework.social.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;


/**
 * store group's information
 * @author Administrator
 *
 */
@Entity
@Table(name="groupFace")
public class GroupFace implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="idGroupFace")
	private String idGroupFace;
	
	@Column(name="nameGroupFace")
	private String nameGroupFace;
	
	@Column(name="clientId")
	private String clientId;
	
	@ManyToMany( mappedBy = "listGroupFaces",cascade = CascadeType.ALL)
	private List<BigGroupFace> listBigGroups;
	
	@ManyToMany( mappedBy = "listGroupFaces",cascade = CascadeType.ALL)
	private List<Schedule> listSchedule;
	
	@OneToMany(mappedBy = "idGroupFace",fetch = FetchType.EAGER)
	private List<PostFacebook> listPosts;
	
	
	public GroupFace(int id, String idGroupFace, String nameGroupFace,
			String clientId, List<BigGroupFace> listBigGroups,
			List<PostFacebook> listPosts) {
		super();
		this.id = id;
		this.idGroupFace = idGroupFace;
		this.nameGroupFace = nameGroupFace;
		this.clientId = clientId;
		this.listBigGroups = listBigGroups;
		this.listPosts = listPosts;
	}

	public List<PostFacebook> getListPosts() {
		return listPosts;
	}

	public void setListPosts(List<PostFacebook> listPosts) {
		this.listPosts = listPosts;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getIdGroupFace() {
		return idGroupFace;
	}

	public void setIdGroupFace(String idGroupFace) {
		this.idGroupFace = idGroupFace;
	}

	public String getNameGroupFace() {
		return nameGroupFace;
	}

	public void setNameGroupFace(String nameGroupFace) {
		this.nameGroupFace = nameGroupFace;
	}

	public List<BigGroupFace> getListBigGroups() {
		return listBigGroups;
	}

	public void setListBigGroups(List<BigGroupFace> listBigGroups) {
		this.listBigGroups = listBigGroups;
	}

	
	public List<Schedule> getListSchedule() {
		return listSchedule;
	}

	public void setListSchedule(List<Schedule> listSchedule) {
		this.listSchedule = listSchedule;
	}

	public GroupFace(String idGroupFace, String nameGroupFace, String clientId,
			List<BigGroupFace> listBigGroups) {
		super();
		this.idGroupFace = idGroupFace;
		this.nameGroupFace = nameGroupFace;
		this.clientId = clientId;
		this.listBigGroups = listBigGroups;
	}

	public GroupFace() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
