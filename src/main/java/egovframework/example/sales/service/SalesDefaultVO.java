package egovframework.example.sales.service;

import java.io.Serializable;

import lombok.Data;

@Data
public class SalesDefaultVO implements Serializable {
	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;
	
	private String start_datetime = "";
	private String end_datetime = "";
	private String day_type = "";
	private String cp_type = "";
}
