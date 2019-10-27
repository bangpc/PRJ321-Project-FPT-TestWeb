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
import model.Question;
import model.User;

/**
 *
 * @author dell
 */
public class QuestionController extends HttpServlet {

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
                action = "testInfo";
            }

            switch (action) {
                case "testInfo":
                    testInfo(request, response);
                    break;
                case "delete":
                    deleteQuestion(request, response);
                    break;
                case "add":
                    addQuestion(request, response);
                    break;
                case "Add Question":
                    saveAddQuestion(request, response);
                    break;
                case "edit":
                    editQuestion(request, response);
                    break;
                case "Edit Question":
                    saveEditQuestion(request, response);
                    break;
            }
        } catch (Exception e) {
            response.getWriter().print(e);
        }
    }

    public void testInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int testID;
        try {
            testID = Integer.valueOf(request.getParameter("testID"));
        } catch (Exception e) {
            testID = (int) session.getAttribute("testID");
        }
        session.setAttribute("testID", testID);
        TestDAO tdao = new TestDAO();
        session.setAttribute("TestInfo", tdao.getTest(testID));
        User u = (User) session.getAttribute("login");
        if (u == null) {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("user/testInfo.jsp");
            rd.forward(request, response);
        }
    }

    public void listQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int testID;
        try {
            testID = Integer.valueOf(request.getParameter("testID"));
        } catch (Exception e) {
            testID = (int) session.getAttribute("testID");
        }
        session.setAttribute("testID", testID);

        QuestionDAO dao = new QuestionDAO();
        TestDAO tdao = new TestDAO();
        request.setAttribute("listQuestion", dao.listQuestionByTest(testID));
        session.setAttribute("TestInfo", tdao.getTest(testID));
        User u = (User) session.getAttribute("login");
        if (u == null) {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {
            if (u.getUserType() == 1) {
                RequestDispatcher rd = request.getRequestDispatcher("admin/test.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("user/doTest.jsp");
                rd.forward(request, response);
            }
        }
    }

    public void deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int testID = 1;
        try {
            testID = Integer.valueOf(request.getParameter("testID"));
        } catch (Exception e) {
            testID = (int) session.getAttribute("testID");
        }
        session.setAttribute("testID", testID);

        QuestionDAO dao = new QuestionDAO();
        int questionID = Integer.valueOf(request.getParameter("questionID"));
        dao.delete(questionID);
        response.sendRedirect("/FPT_Test/QuestionController");
    }

    public void addQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int testID = 1;
        try {
            testID = Integer.valueOf(request.getParameter("testID"));
        } catch (Exception e) {
            testID = (int) session.getAttribute("testID");
        }
        session.setAttribute("testID", testID);

        RequestDispatcher rd = request.getRequestDispatcher("admin/addQuestion.jsp");
        rd.forward(request, response);
    }

    public void saveAddQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int testID = (int) session.getAttribute("testID");
        String questionContent = request.getParameter("questionContent");
        String opt1 = request.getParameter("opt1");
        String opt2 = request.getParameter("opt2");
        String opt3 = request.getParameter("opt3");
        String opt4 = request.getParameter("opt4");
        String rightOption = request.getParameter("rightOption");
        QuestionDAO dao = new QuestionDAO();
        dao.insert(testID, questionContent, opt1, opt2, opt3, opt4, rightOption);
        response.sendRedirect("/FPT_Test/QuestionController");
    }

    public void editQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int testID = 1;
        int questionID = 1;
        try {
            testID = Integer.valueOf(request.getParameter("testID"));
            questionID = Integer.valueOf(request.getParameter("questionID"));
        } catch (Exception e) {
            testID = (int) session.getAttribute("testID");
            questionID = (int) session.getAttribute("questionID");
        }
        session.setAttribute("testID", testID);
        session.setAttribute("questionID", questionID);

        QuestionDAO dao = new QuestionDAO();
        Question q = dao.QuestionByID(questionID);
        request.setAttribute("question", q);
        RequestDispatcher rd = request.getRequestDispatcher("admin/editQuestion.jsp");
        rd.forward(request, response);
    }

    public void saveEditQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        int testID = (int) session.getAttribute("testID");
        int questionID = (int) session.getAttribute("questionID");
        String questionContent = request.getParameter("questionContent");
        String opt1 = request.getParameter("opt1");
        String opt2 = request.getParameter("opt2");
        String opt3 = request.getParameter("opt3");
        String opt4 = request.getParameter("opt4");
        String rightOption = request.getParameter("rightOption");
        QuestionDAO dao = new QuestionDAO();
        dao.update(questionID, questionContent, opt1, opt2, opt3, opt4, rightOption);
        response.sendRedirect("/FPT_Test/QuestionController");
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
