<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/><br/>
<h3 class="text-center">전시관 정보 수정</h3>
<%
	String code = request.getParameter("CodeChk");
	// 전역 변수 : 설정해서 전시관 관련 정보 찍어줄 변수 생성.
	String placename = "";
	String elocation = "";
	String rscustname = "";
	String contactno= "";
	String times = "";
	String holiday = "";

String sql = "select * from explace where codes = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, code);
rs = pstmt.executeQuery();

if(rs.next()){
	do{ 
		code = rs.getString("codes");
		placename = rs.getString("placename");
		location = rs.getString("location");
		contactno = rs.getString("contactno");
		times = rs.getString("times");
		holiday = rs.getString("holiday");
	%>
<section class="row">
<div class= "col-md-12">
<form action="ExplaceModiProc.jsp" name="">
	<table class="table table-response table-striped">
		<tr>
			<th>전시관 코드(수정불가)</th>
			<td><p class="text-danger"><%=code %></p>
			<input type="hidden" value="<%=code %>" name="codes"/></td>
		</tr>
		<tr>
			<th>전시관 이름</th>
			<td><input type="text" value="<%=placename %>" name="placename" class="form-control"/></td>
		</tr>
		<tr>
			<th>위치(수정불가)</th>
			<td><input type="text" value="<%=location %>" disabled class="form-control"/></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" value="<%=contactno %>" name="contactno"  class="form-control"/></td>
		</tr>
		<tr>
			<th>개관시간</th>
			<td>
			<h4 class="text-primary">현재 운영 시간 : <%out.println(times.substring(1,3) + " 시 ~ " + times.substring(4, 6) + "까지"); %></h4>
			<div class="form-group form-inline">
			OPEN : <input type="text" class="form-inline form-control" value="<%= times.substring(1,3)%>" name="n1"/>
			&nbsp;&nbsp;&nbsp;
			CLOSE : <input type="text" class="form-inline form-control" value="<%= times.substring(4,6)%>" name="n2"/>
			</div>
			</td>
		</tr>
		<tr>
			<th>휴관일</th>
			<td>
			<input type="text" value="<%=holiday %>"class="form-control" name ="holiday"/>
			</td>
		</tr>
		<tr>
			<td colspan ="2">
			<input type="submit" value="수정"
		class="btn btn-success btn-block btn-info"/>
		</td>
		</tr>
	</table>
</form>
</div>
</section>		
	<%}while(rs.next());
}else{out.println("조회 실패");}
%>
<%@ include file="./include/Footer.jsp" %>