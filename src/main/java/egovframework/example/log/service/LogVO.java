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
package egovframework.example.log.service;
import lombok.Data;

@Data
public class LogVO extends LogDefaultVO {

	private static final long serialVersionUID = 1L;
	
	private String rownum;   
	private String no;   
	private String login_id;   
	private String ip;   
	private String url;   
	private String login;   
	private String action;   
	private String created_datetime;
	private String updated_datetime;
	
	
}
