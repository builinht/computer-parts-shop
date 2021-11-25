/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;


public class OrderDTO {
    private String orderID;
    private UserDTO user;
    private String date;
    private double total;

    public OrderDTO() {
    }
    
    public OrderDTO(UserDTO user, double total) {
        this.user = user;
        this.total = total;
    }

    public OrderDTO(String orderID, UserDTO user, String date, double total) {
        this.orderID = orderID;
        this.user = user;
        this.date = date;
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
}
