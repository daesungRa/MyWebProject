package ajax.dao;

public class EmpVo {
	/*
	 * field
	 */
	private int employee_id;
	private String first_name;
	private String email;
	private String phone_number;
	private int salary;
	private int manager_id;
	
	private int department_id;
	private String department_name;
	
	/*
	 * return json
	 */
	public String toJson () {
		String str = String.format("{'empId':'%d',"
							+ " 'eName':'%s',"
							+ " 'email':'%s',"
							+ " 'phone_number':'%s',"
							+ " 'salary':'%d',"
							+ " 'mId':'%d',"
							+ " 'deptId':'%d',"
							+ " 'dName':'%s'}",
							employee_id, first_name, email, phone_number, salary, manager_id, department_id, department_name);
		str = str.replace("\'", "\""); // json 은 큰따옴표로 묶어야 함..
		
		return str;
	}
	
	/*
	 * getter & setter
	 */
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getManager_id() {
		return manager_id;
	}
	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}
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
