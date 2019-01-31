package ajax.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.myweb.memberBean.DBConn;

public class EmpDao {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public EmpDao () {
		this.conn = new DBConn().getConn();
	}
	
	private void closeSet () {
		try {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<DeptVo> getDept () {
		List<DeptVo> list = new ArrayList<DeptVo>();;
		final String sql = " select DEPARTMENT_ID, DEPARTMENT_NAME from departments order by department_id asc ";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				DeptVo vo = new DeptVo();
				vo.setDepartment_id(rs.getInt("DEPARTMENT_ID"));
				vo.setDepartment_name(rs.getString("DEPARTMENT_NAME"));
				list.add(vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			closeSet();
		}
		
		return list;
	}

	// true 면 deptId 로 emp 의 아이디와 이름만 조회
	// false 면 empId 로 emp 의 모든 정보 조회
	public List<EmpVo> getEmp (String Id, boolean flag) {
		List<EmpVo> list = new ArrayList<EmpVo>();;
		String sql = "";
		
		if (flag) {
			sql = " select * from employees where department_id = ? ";
		} else {
			sql = " select * from employees where employee_id = ? ";
		}
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, Id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				EmpVo vo = new EmpVo();
				vo.setEmployee_id(rs.getInt("employee_id"));
				vo.setFirst_name(rs.getString("first_name"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone_number(rs.getString("phone_number"));
				vo.setSalary(rs.getInt("salary"));
				vo.setManager_id(rs.getInt("manager_id"));
				vo.setDepartment_id(rs.getInt("department_id"));
				// vo.setDepartment_name(rs.getString("department_name"));
				list.add(vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			closeSet();
		}
		
		return list;
	}
}
