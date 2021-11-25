/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import daos.ProductDAO;
import dtos.ProductDTO;
import dtos.UserDTO;


public class SearchController extends HttpServlet {
    private static final String FAIL = "LogoutController";
    private static final String HOME = "home.jsp";
    private static final String MANAGER = "manager.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = FAIL;
        try {
            String title = request.getParameter("search");
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            
            if(user != null){
                ArrayList<ProductDTO> listProduct = null;
                if(user.getRoleID().equals("AD")){
                    listProduct = ProductDAO.getAllProductByTile(title);
                    if(listProduct != null){
                        url = MANAGER;
                    }
                }else{
                    listProduct = ProductDAO.getAvailableProductByTile(title);
                    url = HOME;
                    if(listProduct != null){
                        url = MANAGER;
                    }
                }
                if(listProduct == null) listProduct = new ArrayList<>();
                session.setAttribute("LIST_PRODUCT", listProduct);
            }
            
        } catch (Exception e) {
            
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
