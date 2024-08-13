class EmployeeModal {
  late String id, name, role;

  EmployeeModal(
    this.id,
    this.name,
    this.role,
  );

  factory EmployeeModal.formJson(Map m1) {
    return EmployeeModal(
      m1['id'],
      m1['name'],
      m1['role'],
    );
  }
}
