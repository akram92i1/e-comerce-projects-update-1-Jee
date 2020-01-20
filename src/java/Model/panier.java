/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author LENOVO
 */
public class panier {
    private addProduit prod ; 
    private int quantite ; 

    public panier(addProduit prod, int quantite) {
        this.prod = prod;
        this.quantite = quantite;
    }
    

    public addProduit getProd() {
        return prod;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setProd(addProduit prod) {
        this.prod = prod;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    
    
    
}
