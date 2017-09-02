package com.talentrecd.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_recruit")
public class Recruit {
	private int id;
	private Hr hr;
	private String name;//ְλ���
	private int number;//��Ƹ����
	private Department department;
	private String place;//�����ص�
	private Job job;
	private int is_fte;
	private Date deadline;//��ֹ����
	private String years;//��������
	private String description;
	private String requirement;
	private String spe_demand;//����Ҫ��
	private int emergent;//�Ƿ����,1Ϊ������0������
	private int status;
	private Date createdate ;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@ManyToOne
	@JoinColumn(name="hr_id")
	public Hr getHr() {
		return hr;
	}
	public void setHr(Hr hr) {
		this.hr = hr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	@ManyToOne
	@JoinColumn(name="dep_id")
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	@ManyToOne
	@JoinColumn(name="job_id")
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public int getIs_fte() {
		return is_fte;
	}
	public void setIs_fte(int is_fte) {
		this.is_fte = is_fte;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getYears() {
		return years;
	}
	public void setYears(String years) {
		this.years = years;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public String getSpe_demand() {
		return spe_demand;
	}
	public void setSpe_demand(String spe_demand) {
		this.spe_demand = spe_demand;
	}
	public int getEmergent() {
		return emergent;
	}
	public void setEmergent(int emergent) {
		this.emergent = emergent;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	

	
}
