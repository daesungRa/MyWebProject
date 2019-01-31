package ajax.dao;

public class DeptVo {
	/*
	 * field
	 */
	private int department_id;
	private String department_name;
	
	/*
	 * return json
	 */
	public String toJson () {
		String str = String.format("{'deptId':'%d',"
							+ " 'deptName':'%s'}",
							department_id, department_name);
		str = str.replace("\'", "\""); // json 은 큰따옴표로 묶어야 함..
		
		return str;
	}

	/*
	 * getter and setter
	 */
	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	
	
}
