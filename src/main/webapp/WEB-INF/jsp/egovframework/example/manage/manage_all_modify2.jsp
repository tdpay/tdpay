<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <!-- container /common/upload.do -->
    <div>
        <div>
            <h2>영업대행정보</h2>
        </div>
        <div>
            <form name=form id="form" method="post" action="/manage/manageMod.do" enctype="multipart/form-data">
 				<table>	
 					<tbody>
 						<tr> 
                            <td>
                                        <input type="file"name="files" id="files">
                                        <input type="submit" id="submit" name="submit" value="submit"> <!--  accept="image/jpeg,.txt,.pdf" -->
                            </td>	
                        </tr>

                    </tbody>
                </table>
            </form>
        </div>
    </div>

    
