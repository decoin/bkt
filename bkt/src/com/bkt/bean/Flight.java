package com.bkt.bean;

public class Flight {
	
	private Integer flight_id;
	private String flightNo;
	private String startAddress;
	private String lastAddress;
	private String starttime;
	private String lasttime;
	private Float dollars;
	private int number;
	private int remains;
	public Integer getFlight_id() {
		return flight_id;
	}
	public void setFlight_id(Integer flightId) {
		flight_id = flightId;
	}
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}
	public String getStartAddress() {
		return startAddress;
	}
	public void setStartAddress(String startAddress) {
		this.startAddress = startAddress;
	}
	public String getLastAddress() {
		return lastAddress;
	}
	public void setLastAddress(String lastAddress) {
		this.lastAddress = lastAddress;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getLasttime() {
		return lasttime;
	}
	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}
	public Float getDollars() {
		return dollars;
	}
	public void setDollars(Float dollars) {
		this.dollars = dollars;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getRemains() {
		return remains;
	}
	public void setRemains(int remains) {
		this.remains = remains;
	}
	
}
