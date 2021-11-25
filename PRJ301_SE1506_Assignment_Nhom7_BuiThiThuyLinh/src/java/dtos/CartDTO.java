/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.util.HashMap;
import java.util.Map;


public class CartDTO {
    private String fullName;
    private Map<String, OrderDetailDTO> cart;

    public CartDTO() {
    }

    public CartDTO(String fullName, Map<String, OrderDetailDTO> cart) {
        this.fullName = fullName;
        this.cart = cart;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Map<String, OrderDetailDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, OrderDetailDTO> cart) {
        this.cart = cart;
    }
    
    public void add(OrderDetailDTO dto) {
        String id = String.valueOf(dto.getProduct().getProductID());
        if (cart == null) {
            this.cart = new HashMap<>();
        }
        if (cart.containsKey(id)) {
            int oldQuantity = cart.get(id).getQuantity();
            cart.get(id).setQuantity(dto.getQuantity() + oldQuantity);
        } else {
            cart.put(id, dto);
        }
    }

    public void delete(int productID) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(String.valueOf(productID))) {
            this.cart.remove(String.valueOf(productID));
        }
    }

    public void update(OrderDetailDTO dto) {
        String id = String.valueOf(dto.getProduct().getProductID());
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, dto);
            }
        }
    }
}
