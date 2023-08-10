/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.settlement.service;
import lombok.Data;

@Data
public class SettlementVO extends SettlementDefaultVO {

	private static final long serialVersionUID = 1L;

	/** 아이디 */
	private String id;

	/** 이름 */
	private String name;

	/** 내용 */
	private String description;

	/** 사용여부 */
	private String useYn;

	/** 등록자 */
	private String regUser;

	private String rownum;
	private int tocnt;
	private String no;
	private String seqno;
	private String daoutrx;
	private String store_id;
	private String auth_id;
	private String userid;
	private String hold_yn;
	private String orderno;
	private String username;
	private String productname;
	private String amount;
	private String amount_cnt;
	private String cancel_amount;
	private String cancel_cnt;
	private String vat;
	private String vat2;
	private String vat3;
	private String hold;
	private String authdate;
	private String canceldate;
	private String start_date;
	private String end_date;
	private String start_end_date;
	private String cardname;
	private String cardcode;
	private String cardno;
	private String quota;
	private String terminal_id;
	private String terminalid;
	private String imei;
	private String commission;
	private String commission2;
	private String commission3;
	private String franchisee_commission;
	private String commission_total;
	private String commission_total2;
	private String commission_total3;
	private String commission_total4;
	private String business_nm;
	private String business_nm2;
	private String business_nm3;
	private String tax;
	private String tax2;
	private String amount2;
	private String bank_nm;
	private String account_num;
	private String accounter;
	private String period;
	private String state;
	private String canceltype;
	private String status;
	private String ym;
	private String sun;
	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private String cpid;
	private String no_cpid;
	private String cp_type;
	private String amount_sum;
	private String period_date;
	private String period_date2;
	private String period_date3;
	private String settlement;
	private String settlement2;
	private String settlement3;
	private String commission_cost;
	private String total_cnt;
	private String total_approval;
	private String total_cancel_sum;
	private String total_approval_cnt;
	private String total_cancel_cnt;
	private String total_settlement;
	private String total_settlement2;
	private String total_settlement3;
	private String total_settlement_sum;
	private String total_vat;
	private String total_vat2;
	private String total_vat3;
	private String total_amount;
	private String total_amount2;
	private String total_amount3;
	private String d_amount;
	private String d_cancel_sum;
	private int d_total_cnt;
	private String d_approval_cnt;
	private String d_cancel_cnt;
	private String amount_commission;
	private String cencel_amount_commission;
	private String settlement_amount;
	private String cencel_settlement_amount; 
	private String supply_commission;			// 수수료 공급가액
	private String total_cancel_store_cnt;		// 기간별 취소거래처
	private String total_amount_commission;		// 정산매출 수수료, 수수료 합계
	private String total_cencel_cnt;			// 기간별 취소건
	private String total_cencel_amount_commission;	// 기간별 취소수수료
	private String cancel_supply_commission;		// 수수료 공급가액
	private String cancel_vat;						// 수수료 부가세
	private String cancel_settlement;				// 수수료 합계
	private String total_settlement_commission;			// 수수료 공급가액
	private String total_vat_commission;				// 수수료 부가세
	private String total_store_cnt;				// 기간별 거래처

	private String corp_regist_num2 = "";
	private String approve_cnt= "";
	
	private String tax_state;
	
}
