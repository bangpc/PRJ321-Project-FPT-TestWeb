/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuestionDAO;
import dao.TestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author dell
 */
public class TestController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            if (action == null) {
                action = "list";
            }

            switch (action) {
                case "list":
                    listTest(request, response);
                    break;
//                case "TestInfo":
//                    testInfo(request, response);
//                    break;
                case "delete":
                    deleteTest(request, response);
                    break;
                case "add":
                    addTest(request, response);
                    break;
            }
        } catch (Exception e) {
            response.getWriter().print(e);
        }
    }
//    public void testInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        HttpSession session = request.getSession(true);
//        int testID;
//        try {
//            testID = Integer.valueOf(request.getParameter("testID"));
//        } catch (Exception e) {
//            testID = (int) session.getAttribute("testID");
//        }
//        session.setAttribute("testID", testID);
//        TestDAO tdao = new TestDAO();
//        session.setAttribute("TestInfo", tdao.getTest(testID));
//        User u = (User) session.getAttribute("login");
//        if (u == null) {
//            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
//            rd.forward(request, response);
//        } else {
//            RequestDispatcher rd = request.getRequestDispatcher("user/testInfo.jsp");
//            rd.forward(request, response);
//        }
//    }
    
    public void listTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int classID = 1;
        try {
            classID = Integer.valueOf(request.getParameter("classID"));
        } catch (Exception e) {
            classID = (int) session.getAttribute("classID");
        }
        session.setAttribute("classID", classID);

        TestDAO dao = new TestDAO();
        request.setAttribute("testList", dao.listTestByClass(classID));
        User u = (User) session.getAttribute("login");
        if (u == null) {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {
            if (u.getUserType() == 1) {
                RequestDispatcher rd = request.getRequestDispatcher("admin/listTest.jsp");
                rd.forward(request, response);

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("user/listTest.jsp");
                rd.forward(request, response);
            }
        }
    }

    public void deleteTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int classID = Integer.valueOf(request.getParameter("classID"));
        session.setAttribute("classID", classID);

        TestDAO dao = new TestDAO();
        int testID = Integer.valueOf(request.getParameter("testID"));
        dao.delete(testID);
        response.sendRedirect("/FPT_Test/TestController");
    }

    public void addTest(HttpServletRequest request, HttpServletResponse response) throws Exception {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
