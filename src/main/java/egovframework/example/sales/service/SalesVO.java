package egovframework.example.sales.service;

import lombok.Data;

@Data
public class SalesVO extends SalesDefaultVO{
	
	private static final long serialVersionUID = 1L;
	
	private String rate;
	private String total_approval;
	private String total_cancel_sum;
	
}
