package com.yusuf.domain;

public class Student {
    private String department;
    private String studentId;
    private String studentName;
    private int mark;

    public Student() {
    }

    public Student(String department, String studentId, String studentName, int mark) {
        this.department = department;
        this.studentId = studentId;
        this.studentName = studentName;
        this.mark = mark;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }
}
