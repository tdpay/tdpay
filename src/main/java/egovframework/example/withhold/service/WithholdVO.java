package egovframework.example.withhold.service;

import lombok.Data;

@Data
public class WithholdVO extends WithHoldDefaultVO{
	
	private static final long serialVersionUID = 1L;
	
	private String cardcode;
	private String cardname;
	private String amount;
	private String dealing_yn;
	private String cancle_amount;
	private String cancle_yn;
	private String rate;
	
}
