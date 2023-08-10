<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<style>
		.table_layout table th:nth-child(1),
		.table_layout table td:nth-child(1) {
			width:5% !important;
		}
		.table_layout table th.title,
		.table_layout table td.title {
			 width:63% !important;
		}
		.table_layout table th:nth-child(3),
		.table_layout table td:nth-child(3) {
			width:10% !important;
			text-align:center;
		}
		.table_layout table th:nth-child(4),
		.table_layout table td:nth-child(4) {
			  width:10% !important;
			  text-align:center;
		}
		.table_layout table th:nth-child(5),
		.table_layout table td:nth-child(5) {
			  width:5% !important;
			  text-align:center;
		}
		.table_layout table th:nth-child(6),
		.table_layout table td:nth-child(6) {
			  width:7% !important;
			  text-align:center;
		}
	</style>
	
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
				 <strong class="sub_ttl">공지사항</strong>
					<form class="form_layout" name="" id="" method="get" action="" target="">

						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">작성자</label>
									</td>
									<td class="input_desc" colspan="7">
										<input class="width_180" type="text" value="관리자" readonly>
									</td>								
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">공지글</label>
									</td>
									<td class="input_desc" colspan="7">
                                        <input class="check_new" type="checkbox" id="notice01">
                                        <label for="notice01">공지글</label>
									</td>
                                </tr>
                                <tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">등록일</label>
									</td>
									<td class="input_desc" colspan="7">
										<input class="width_180" type="text" value="2020-10-27 15:20:01" readonly>
									</td>								
                                </tr>
                                <tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">조회</label>
									</td>
									<td class="input_desc" colspan="7">
										<input class="width_180" type="text" value="0" readonly>
									</td>								
								</tr>
                                <tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">제목</label>
									</td>
									<td class="input_desc" colspan="7">
										<input class="width_all" type="text" value="0" readonly>
									</td>								
								</tr>
                                <tr class="input_box input_box_border editor">
									<td class="input_ttl" colspan="1">
										<label class="" for="">내용</label>
									</td>
									<td class="input_desc" colspan="7">
										<img src="../img/sub/editor.jpg" alt="에디터">
									</td>								
								</tr>
                                <tr class="input_box input_box_border comment">
									<td class="input_ttl" colspan="1">
										<label class="" for="">답변</label>
									</td>
									<td class="input_desc" colspan="7">
										<textarea class="width_all" name="" id=""></textarea>
									</td>								
								</tr>
                                <tr class="input_box input_box_border file_add">
									<td class="input_ttl" colspan="1">
										<label class="" for="">첨부파일</label>
									</td>
									<td class="input_desc" colspan="7">
										<div class="file_add_btn">
                                            <input type="file" id="file_add">
                                            <label for="file_add">
                                                <input type="text" class="width_180" placeholder="선택된 파일 없음" readonly>
                                                <button type="button"></button>
                                            </label>
                                        </div>
                                        <div class="file_delete">
                                            <button type="button">파일삭제</button>
                                            <input id="delete_check" class="check_new" type="checkbox">
                                            <label for="delete_check">20200527100528.gif</label>
                                        </div>
									</td>								
								</tr>
							</tbody>
                        </table>
                        <div class="btn_box">
                            <a href="" class="a_btn a_btn_blue_line">수정</a>
                            <a href="" class="a_btn a_btn_blue">등록</a>
                            <a href="" class="a_btn a_btn_default">목록</a>
                        </div>
						</form>
					</div>
				</div>
	


