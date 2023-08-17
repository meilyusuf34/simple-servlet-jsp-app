package com.yusuf.servlet;

import com.yusuf.domain.Student;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Student> students = new ArrayList<>();

        // Add sample student data
        students.add(new Student("Dep 1", "S1", "Akhsan", 35));
        students.add(new Student("Dep 1", "S2", "Zaka", 70));
        students.add(new Student("Dep 1", "S3", "Yusuf", 60));
        students.add(new Student("Dep 1", "S4", "Bagus", 90));
        students.add(new Student("Dep 2", "S5", "Andre", 30));
        students.add(new Student("Dep 3", "S6", "Gilang", 32));
        students.add(new Student("Dep 3", "S7", "Yana", 70));
        students.add(new Student("Dep 3", "S8", "Vajar", 20));

        // Store the student list in the request attribute
        request.setAttribute("students", students);
        String username = request.getParameter("username");
        request.setAttribute("username", username);

        // Forward the request to the welcome.jsp page
        request.getRequestDispatcher("/welcome.jsp").forward(request, response);
    }

    public static int calculateRowspan(List<Student> students, String department) {
        int count = 0;
        for (Student student : students) {
            if (student.getDepartment().equals(department)) {
                count++;
            }
        }
        return count;
    }

    public static String calculatePassPercentage(List<Student> students, String department) {
        int passCount = 0;
        int totalCount = 0;
        for (Student student : students) {
            if (student.getDepartment().equals(department)) {
                totalCount++;
                if (student.getMark() >= 40) {
                    passCount++;
                }
            }
        }
        if (totalCount > 0) {
            return String.format("%.2f", (double) passCount / totalCount * 100);
        } else {
            return "0";
        }
    }
}
