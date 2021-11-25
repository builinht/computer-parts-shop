/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import daos.ProductDAO;
import dtos.ProductDTO;



public class AddProductController extends HttpServlet {
    private static final String MANAGER = "ManageProductController";
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
            HttpSession session = request.getSession();
            String image = request.getParameter("txtImage");
            String title = request.getParameter("txtTitle");
            String supplier = request.getParameter("txtSupplier");
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            double price = Double.parseDouble(request.getParameter("txtPrice"));
            Date curDate = new Date();
            String importDate = DateFormat.getDateInstance().format(curDate);
            int categoryID = Integer.parseInt(request.getParameter("txtCategoryID"));
            
            ProductDTO product = new ProductDTO(0, title, price, image, supplier, importDate, quantity, categoryID, true);
            
            boolean result = ProductDAO.insertProduct(product);
            if(result){
                session.setAttribute("INSERT_MESS", true);
            } else {
                session.setAttribute("INSERT_MESS", false);
            }
        } catch (Exception e) {
             
        } finally {
            request.getRequestDispatcher(MANAGER).forward(request, response);
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
