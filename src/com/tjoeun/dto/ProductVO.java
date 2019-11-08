package com.tjoeun.dto;

import java.sql.Timestamp;

public class ProductVO {
	private Integer pseq;           
	private String ptitle;
	private String kind;     
	private String area;      
	private Integer price;    
	private String phone;
	private Integer period;           
	private String content;
	private String content_image;
	private String image;
	private String useyn;
	private String bestyn;
	private Timestamp indate;               
	private String id;
	private Integer readcount;
	
	public Integer getPseq() {
		return pseq;
	}
	public void setPseq(Integer pseq) {
		this.pseq = pseq;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getPeriod() {
		return period;
	}
	public void setPeriod(Integer period) {
		this.period = period;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getContent_image() {
		return content_image;
	}
	public void setContent_image(String content_image) {
		this.content_image = content_image;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public String getBestyn() {
		return bestyn;
	}
	public void setBestyn(String bestyn) {
		this.bestyn = bestyn;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getReadcount() {
		return readcount;
	}
	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
	
	
	
}
