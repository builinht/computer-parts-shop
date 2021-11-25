/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;


public class OrderDetailDTO {
    private int orderDetailID;
    private OrderDTO order;
    private ProductDTO product;
    private int quantity;

    public OrderDetailDTO() {
    }
    
    public OrderDetailDTO(ProductDTO product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public OrderDetailDTO(int orderDetailID, OrderDTO order, ProductDTO product, int quantity) {
        this.orderDetailID = orderDetailID;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public OrderDTO getOrder() {
        return order;
    }

    public void setOrder(OrderDTO order) {
        this.order = order;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    
    
    
}
